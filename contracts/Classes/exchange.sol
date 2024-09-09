// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../Access.sol";
import "./VibeBase.sol";
import "../AddressReg.sol";
import "../XUSD1.sol";
import "../IAccessManager.sol";
import "./IPancackePair.sol";

// Import the interface for the reward contract
interface IReward {
    function distributeReward(
        address traderAddress,
        uint256 rewardAmount
    ) external;
}

/// @title Exchange Contract
/// @notice This contract facilitates trading on the exchange and distributes rewards to traders.
contract Exchange is VibeBase {
    using LibRegistryAdd for LibRegistryAdd.Registry;

    uint256 public periodStartTime;
    uint256 public constant PERIOD_DURATION = 3600; 
    int public VIBE_RANK = 2000;
    uint256 public MAX_AMOUNT = 1000 * 1e18;
    uint256 public DAILY_LIMIT = 5000 * 1e18;
    uint256 public TotalRewards = 0;

    mapping(address => bool) public Rewards;

    struct Trader {
        uint256 lastTradeTime; 
        uint256 cumulativeTradingVolume;
        uint256 totalReward; 
        uint256 withdrawnRewards;
    }

    struct Period {
        uint256 marketVolume; 
        uint256 lastTradeTime;
        uint256 amountRewards;
        bool active;
    }

    mapping(address => Trader) public traders;
    mapping(uint256 => Period) public periods;
    LibRegistryAdd.Registry internal LpWhitelistedReg;
    mapping(address => mapping(uint256 => bool)) public traderPeriodStatus;

    uint256 public DAILY_LP_LIMIT = DAILY_LIMIT;
    mapping(address => mapping(uint256 => Period)) public LpDailyLimit;
    mapping(address => bool) public submitted;
    mapping(address => mapping(uint256 => uint256)) public traderPeriodVolume;
    mapping(address => mapping(uint256 => uint256)) public traderPeriodRewards;
    uint256 public MAXREWARDS;

    IReward public rewardContract;
    XUSD public xusd;
  IAccessManager public accessControl;

    error UnauthorizedAccess( IAccessManager.Rank roleId, address addr);
    /**
     * @dev Restricts access to GLADIATOR role or higher.
     */
      modifier onlyGladiator() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.GLADIATOR), "Access Restricted");
        _;
    }

    modifier onlySenator() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.SENATOR), "Access Restricted");
        _;
    }

    modifier onlyConsul() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.CONSUL),"Access Restricted");
        _;
    }

    modifier onlyLegatus() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.LEGATUS),"Access Restricted");
        _;
    }
    constructor(
        address _access,
        address _xusd,
        address _rewardContract,
        VibeInfo memory _description
    ) VibeBase(_description, _access) {
        accessControl = IAccessManager(_access);
        xusd = XUSD(_xusd);
        rewardContract = IReward(_rewardContract);
  

        periodStartTime = block.timestamp;
    }
   function _msgSender() internal view virtual returns (address) {
        return msg.sender;
    }

    function _msgData() internal view virtual returns (bytes calldata) {
        return msg.data;
    }

    function _contextSuffixLength() internal view virtual  returns (uint256) {
        return 0;
    }
    function addToWhiteListAdmin(address account) external onlyConsul{

        require(
            IPancakePair(account).token0() == address(xusd) || IPancakePair(account).token1() == address(xusd),
            "XUSD is not in that LP"
        );
        LpWhitelistedReg.Register(account);
        Rewards[account] = true;
    }

    function addToWhiteList(address account) external onlyLegatus{

        require(
            IPancakePair(account).token0() == address(xusd) || IPancakePair(account).token1() == address(xusd),
            "XUSD is not in that LP"
        );
        require(!submitted[msg.sender], "Only allowed to submit once");
        LpWhitelistedReg.Register(account);
        Rewards[account] = true;
        submitted[msg.sender] = true;
    }

    function handleOpenPosition(uint256 volume, uint256 currentPeriod, address lp) private {
        if(!periods[currentPeriod].active && !LpDailyLimit[lp][currentPeriod].active){
            calculateReward(tx.origin, volume, lp);
        }
    }

    function showTrader(address user) external view returns(Trader memory){
       return traders[user];
    }

    function calculateReward(address traderAddress, uint256 volume, address lp) private {
        uint256 currentPeriod = getCurrentPeriod();
        Trader storage trader = traders[traderAddress];
        if (TotalRewards >= MAXREWARDS) return;
        if (traderPeriodStatus[traderAddress][currentPeriod]) return;
        if (periods[currentPeriod].active) return;

        uint256 rewardAmount = volume / 8;
        if (rewardAmount > MAX_AMOUNT) {
            rewardAmount = MAX_AMOUNT;
        }

        uint256 lpCount = LpWhitelistedReg.Count();
        if (lpCount > 0) {
    uint256 lpRewardLimit = DAILY_LP_LIMIT / lpCount;
    uint256 rewardToAdd;

    // Calculate reward for the LP limit
    if (LpDailyLimit[lp][currentPeriod].amountRewards + rewardAmount >= lpRewardLimit) {
        rewardToAdd = lpRewardLimit - LpDailyLimit[lp][currentPeriod].amountRewards;
        LpDailyLimit[lp][currentPeriod].amountRewards += rewardToAdd;
        LpDailyLimit[lp][currentPeriod].active = true;
    } else {
        rewardToAdd = rewardAmount;
        LpDailyLimit[lp][currentPeriod].amountRewards += rewardToAdd;
    }

    // Adjust for overall period daily limit
    if (periods[currentPeriod].amountRewards + rewardToAdd >= DAILY_LIMIT) {
        uint256 remainingPeriodReward = DAILY_LIMIT - periods[currentPeriod].amountRewards;
        rewardToAdd = remainingPeriodReward;
        periods[currentPeriod].amountRewards += rewardToAdd;
        periods[currentPeriod].active = true;
    } else {
        periods[currentPeriod].amountRewards += rewardToAdd;
    }

    // Adjust for the trader's maximum allowed reward
    if (traderPeriodRewards[traderAddress][currentPeriod] + rewardToAdd >= MAX_AMOUNT) {
        uint256 remainingTraderReward = MAX_AMOUNT - traderPeriodRewards[traderAddress][currentPeriod];
        rewardToAdd = remainingTraderReward;
        traderPeriodRewards[traderAddress][currentPeriod] += rewardToAdd;
        trader.totalReward += rewardToAdd;
        traderPeriodStatus[traderAddress][currentPeriod] = true;
    } else {
        traderPeriodRewards[traderAddress][currentPeriod] += rewardToAdd;
        trader.totalReward += rewardToAdd;
    }

    // Finally, update the total rewards
    TotalRewards += rewardToAdd;
}
    }

    function calculateRewards(
        address to,
        address from,
        address caller,
        address sender,
        uint256 amount,
        int256 vibes
    ) external onlyConsul {
    

        if ((Rewards[from] || Rewards[to]) && vibes <= VIBE_RANK) {
            uint256 currentPeriod = getCurrentPeriod();
            handleOpenPosition(amount, currentPeriod, Rewards[from] ? from : to);
        }
    }

    function claimReward() external nonReentrant {
        uint256 currentPeriod = getCurrentPeriod();
        uint256 reward = traders[msg.sender].totalReward;
        require(reward > 0, "Reward cannot be 0");

        // Set the totalReward to 0 before distributing the reward
        traders[msg.sender].totalReward = 0;

        // Distribute the reward safely
        (bool success, ) = address(rewardContract).call(abi.encodeWithSelector(
            IReward.distributeReward.selector, msg.sender, reward
        ));
        require(success, "Reward distribution failed");
    }

    function setTotalAmount(uint256 amounts) external onlyConsul {
 
        MAXREWARDS = amounts;
    }

    function setDailyAmounts(uint256 amounts) external onlyConsul{
   
        DAILY_LIMIT = amounts;
    }

    function setUserAmounts(uint256 amounts) external onlyConsul{
 
        MAX_AMOUNT = amounts;
    }

    function setVibeRank(int256 vibes) external onlyConsul{
   
        VIBE_RANK = vibes;
    }

    function addRewards(uint256 amounts) external onlyConsul{
 
        MAXREWARDS += amounts;
    }

    function getUsersRewards(address user) external view returns (uint256[] memory) {
        uint256 currentPeriod = getCurrentPeriod();
        uint256[] memory userRewards = new uint256[](currentPeriod);
        for (uint256 i = 0; i < currentPeriod; i++) {
            userRewards[i] = traderPeriodRewards[user][i];
        }
        return userRewards;
    }

    function getTraderCurrentPeriodStatus(
        address traderAddress
    ) public view returns (bool) {
        uint256 currentPeriod = getCurrentPeriod();
        return traderPeriodStatus[traderAddress][currentPeriod];
    }

    function getTraderCurrentPeriodRewards(
        address traderAddress
    ) public view returns (uint256) {
        uint256 currentPeriod = getCurrentPeriod();
        return traderPeriodRewards[traderAddress][currentPeriod];
    }

    function getTraderReward(
        address traderAddress
    ) public view returns (uint256) {
        return traders[traderAddress].totalReward;
    }

    function getCurrentPeriod() public view returns (uint256) {
        return (block.timestamp - periodStartTime) / PERIOD_DURATION;
    }
}
