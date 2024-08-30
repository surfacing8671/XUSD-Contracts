// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "../Access.sol";
import "./VibeBase.sol";
import "hardhat/console.sol";
import "../XUSD1.sol";
import "./IPancackePair.sol";

/**
 * @title NegativeReferralBasedTaxCalculator
 * @dev A tax calculator that provides rewards for both referrers and referred addresses.
 */
contract GenesisRewardsModule is VibeBase {
    mapping(address => bool) Rewards;
      mapping(address => bool) Rewards2;
    mapping(address => bool) public submitted;
    uint public RewardBalance = 0;
    XUSD public xusd;
    uint private rewardDayIndex = 1;
    uint private LastUpdateTime = 0;
    uint256 public constant MAX_AMOUNT = 1000 * 1e18;
    uint256 public constant MAX_AMOUNT2 = 1000 * 1e18;
    mapping(uint => mapping(address => uint)) DailyRewards;
    mapping(address => uint) userRewards;
    HierarchicalAccessControl private access;

    constructor(
        address _access,
        address _xusd,
        VibeInfo memory _description
    ) VibeBase(_description, _access) {
        access = HierarchicalAccessControl(_access);
        xusd = XUSD(_xusd);
    }



    function addToWhiteList(address account) external {
        assert(
            access.hasRank(HierarchicalAccessControl.Rank.LEGATUS, msg.sender)
        );
        require(IPancakePair(account).token0() == address(xusd) || IPancakePair(account).token1() == address(xusd), "XUSD is not in that LP");

        Rewards[account] = true;
        submitted[msg.sender] = true;
       
    }

    function viewRewards(
        address account
    ) external view returns (uint[] memory) {
        uint[] memory rewards = new uint[](rewardDayIndex);
        for (uint i; i < rewardDayIndex; ) {
            rewards[i] = DailyRewards[rewardDayIndex][account];
            unchecked {
                i++;
            }
        }
        return rewards;
    }

    function hasSubmitted(address user) external view returns(bool){
        return submitted[user];
    }

function rewardXusd(address user, uint amount) internal {
    if (LastUpdateTime == 0) {
        LastUpdateTime = block.timestamp;
    }
    if (block.timestamp >= LastUpdateTime + 86400) {
        rewardDayIndex++;
        LastUpdateTime = block.timestamp;
    }
    uint userAmount = DailyRewards[rewardDayIndex][user];

    if (MAX_AMOUNT >= userAmount) {
        uint256 rewardAmount;

        // Granular reward tiers in increments of 100
        if (amount > 1000 * 1e18) {
            rewardAmount = 1000 * 1e18;
        } else {
        rewardAmount = amount/4;
        }
        // Ensure that we don't exceed MAX_AMOUNT
        if (userAmount + rewardAmount > MAX_AMOUNT) {
            rewardAmount = MAX_AMOUNT - userAmount;
        }

        // Transfer the reward to the user
        console.logUint(rewardAmount);
        console.logUint(userAmount);
        xusd.Rewardtransfer(user, rewardAmount);

        // Update the user's daily reward
        DailyRewards[rewardDayIndex][user] = userAmount + rewardAmount;

        // Decrement the reward balance
        RewardBalance -= rewardAmount;
    }
}
    function depositRewards(uint amount) external nonReentrant {
        assert(
            access.hasRank(HierarchicalAccessControl.Rank.SENATOR, msg.sender)
        );
        assert((xusd).transferFrom(msg.sender, address(this), amount));
        RewardBalance += (xusd).balanceOf(address(this));
    }

    function calculateRewards(
        address to,
        address from,
        address caller,
        address sender,
        uint amount,
        int vibes
    ) external nonReentrant{
        assert(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender)
        );
            console.log("here");
        if (
            (Rewards[to] || Rewards[from] || Rewards[caller] ||  Rewards[sender]) && vibes <= 400
        ) {
            rewardXusd(caller, amount);
        }

      
    }
}
