// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "../Access.sol";
import "hardhat/console.sol";
import "./VibeBase.sol";
import "../XUSD1.sol";
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
    uint256 public periodStartTime;
    uint256 public constant PERIOD_DURATION = 1 days; // 30 days in seconds
    int public VIBE_RANK = 2000;
    uint256 public  MAX_AMOUNT = 1000 * 1e18;
    uint256 public  DAILY_LIMIT = 100000 * 1e18;
    uint256 public TotalRewards = 0;
        mapping(address => bool) public Rewards;
    // Struct to store trader information
    struct Trader {
        uint256 lastTradeTime; // Timestamp of the last trade
        uint256 cumulativeTradingVolume; // Total trading volume of the trader accepted
        uint256 totalReward; // Total reward earned by the trader
        uint256 withdrawnRewards;
    }

    struct Period {
        uint256 marketVolume; // Total trading volume within the period
        uint256 lastTradeTime; // Timestamp of the last trade within the period
        uint256 amountRewards;
        bool active;
    }

    // Mapping to store trader information
    mapping(address => Trader) public traders;
    // Mapping to store period information
    mapping(uint256 => Period) public periods;
    // Mapping to store the status of traders' positions per period
    mapping(address => mapping(uint256 => bool)) public traderPeriodStatus;
    mapping(address => bool) public submitted;
    // Mapping to store the status of traders' volumes per period
    mapping(address => mapping(uint256 => uint256)) public traderPeriodVolume;
    mapping(address => mapping(uint256 => uint256)) public traderPeriodRewards;
    uint256 public MAXREWARDS;
    // Instance of the reward contract interface
    IReward public rewardContract;


        XUSD public xusd;
    HierarchicalAccessControl private access;

     constructor(
        address _access,
        address _xusd,
        address _rewardContract,
        VibeInfo memory _description
    ) VibeBase(_description, _access) {
        access = HierarchicalAccessControl(_access);
        xusd = XUSD(_xusd);
                rewardContract = IReward(_rewardContract);
        MAXREWARDS = xusd.balanceOf(address(rewardContract));
        periodStartTime = block.timestamp;
    }


    function addToWhiteListAdmin(address account) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender),
            "Access denied: CONSUL rank required"
        );
        require(
            IPancakePair(account).token0() == address(xusd) || IPancakePair(account).token1() == address(xusd),
            "XUSD is not in that LP"
        );

        Rewards[account] = true;
       // emit AddedToWhitelist(account, msg.sender);
    }

    function addToWhiteList(address account) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.LEGATUS, msg.sender),
            "Access denied: LEGATUS rank required"
        );
                require(
            IPancakePair(account).token0() == address(xusd) || IPancakePair(account).token1() == address(xusd),
            "XUSD is not in that LP"
        );
        require(!submitted[msg.sender], "Only allowed to submit once");

        Rewards[account] = true;
        submitted[msg.sender] = true;
      //  emit AddedToWhitelist(account, msg.sender);
    }
   

    /// @notice Handles opening a trading position
    /// @param volume Volume of the trade
    /// @param currentPeriod Current period index
    function handleOpenPosition(uint256 volume, uint256 currentPeriod) private {
  
     
        if(!periods[currentPeriod].active){
        calculateReward(tx.origin, volume);
        }
        
    }



    /// @notice Calculates the reward for a trader based on their trading activity
    /// @param traderAddress Address of the trader
    /// @param volume Volume of the trade
    function calculateReward(address traderAddress, uint256 volume) private {
        uint256 currentPeriod = getCurrentPeriod();
        Trader storage trader = traders[traderAddress];
       console.logUint(MAXREWARDS);
    if(TotalRewards >= MAXREWARDS) return;
    if(traderPeriodStatus[traderAddress][currentPeriod]) return;
    if(periods[currentPeriod].active) return;
   
    uint256 rewardAmount = volume / 4;
    if(rewardAmount > MAX_AMOUNT){
        rewardAmount = MAX_AMOUNT;
    }
           if (periods[currentPeriod].amountRewards + rewardAmount >= DAILY_LIMIT) {
        periods[currentPeriod].amountRewards += DAILY_LIMIT - periods[currentPeriod].amountRewards;
        rewardAmount = DAILY_LIMIT - periods[currentPeriod].amountRewards;
        TotalRewards += rewardAmount;
        periods[currentPeriod].active = true;

    }
    else{
        periods[currentPeriod].amountRewards += rewardAmount;
        TotalRewards += rewardAmount;
        console.logUint(rewardAmount);
    }

        if (traderPeriodRewards[traderAddress][currentPeriod] + rewardAmount >= MAX_AMOUNT) {
        trader.totalReward += MAX_AMOUNT - traderPeriodRewards[traderAddress][currentPeriod];
        traderPeriodRewards[traderAddress][currentPeriod] += MAX_AMOUNT - traderPeriodRewards[traderAddress][currentPeriod];
 
        traderPeriodStatus[traderAddress][currentPeriod] = true;
    }
    else{
        traderPeriodRewards[traderAddress][currentPeriod] += rewardAmount;
        trader.totalReward += rewardAmount;
    }

   

    }

      function calculateRewards(
        address to,
        address from,
        address caller,
        address sender,
        uint256 amount,
        int256 vibes
    ) external  {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender),
            "Access denied: CONSUL rank required"
        );

        if (
            (Rewards[from] || Rewards[to] ) && vibes <= VIBE_RANK
        ) {
            console.logAddress(from);
            uint256 currentPeriod = getCurrentPeriod();

            handleOpenPosition(amount, currentPeriod);
        }
    }


    /// @notice Allows a trader to claim their earned rewards
    function claimReward() external {
        uint256 currentPeriod = getCurrentPeriod();
        uint256 reward = traders[msg.sender].totalReward;
        require(reward > 0, "Reward cannot be 0");

        // Set the totalReward to 0 before distributing the reward
        traders[msg.sender].totalReward = 0;

      
        // Distribute the reward
        rewardContract.distributeReward(msg.sender, reward);
    }

    function setTotalAmount(uint amounts) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender),
            "Access denied: CONSUL rank required"
        );
        MAXREWARDS = amounts;
    }

    function setDailyAmounts(uint amounts) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender),
            "Access denied: CONSUL rank required"
        );
        DAILY_LIMIT = amounts;
    }


    function setUserAmounts(uint amounts) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender),
            "Access denied: CONSUL rank required"
        );
        MAX_AMOUNT = amounts;
    }

        function setVibeRank(int vibes) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender),
            "Access denied: CONSUL rank required"
        );
        VIBE_RANK = vibes;
    }

    function addRewards(uint amounts) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender),
            "Access denied: CONSUL rank required"
        );
        MAXREWARDS += amounts;
    }

        function getUsersRewards(address user) external view returns(uint[] memory) {
         uint256 currentPeriod = getCurrentPeriod();
          uint[] memory userRewards = new uint[](currentPeriod);
          for(uint i; i < currentPeriod; i ++){
            userRewards[i] = traderPeriodRewards[user][i];
          }
          return userRewards;
    }
    /// @notice Gets the status of a trader's position in the current period
    /// @param traderAddress Address of the trader
    /// @return Status of the trader's position in the current period
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

    /// @notice Gets the total reward earned by a trader
    /// @param traderAddress Address of the trader
    /// @return Total reward earned by the trader
    function getTraderReward(
        address traderAddress
    ) public view returns (uint256) {
        return traders[traderAddress].totalReward;
    }



    /// @notice Gets the current period index based on the elapsed time since contract deployment
    /// @return Current period index
    function getCurrentPeriod() public view returns (uint256) {
        return (block.timestamp - periodStartTime) / PERIOD_DURATION;
    }
}