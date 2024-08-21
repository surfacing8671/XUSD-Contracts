// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;
import "../Access.sol";
import "./VibeBase.sol";
import "hardhat/console.sol";
import "../XUSD.sol";

/**
 * @title NegativeReferralBasedTaxCalculator
 * @dev A tax calculator that provides rewards for both referrers and referred addresses.
 */
contract GenesisRewardsModule is VibeBase {
    mapping(address => bool) Rewards;
    mapping(address => address) public referrals;
    uint public RewardBalance = 0;
    XUSD public xusd;
    uint private rewardDayIndex = 1;
    uint private LastUpdateTime = 0;
    uint256 public constant MAX_AMOUNT = 1000 * 1e18;
    mapping(uint => mapping(address => uint)) DailyRewards;
    mapping(address => uint) userRewards;
    HierarchicalAccessControl private access;

    constructor(
        address _access,
        address _xusd,
        string memory _description
    ) VibeBase(_description) {
        access = HierarchicalAccessControl(_access);
        xusd = XUSD(_xusd);
    }

    function addToWhiteList(address account) external {
        assert(
            access.hasRank(HierarchicalAccessControl.Rank.LEGATUS, msg.sender)
        );
        Rewards[account] = true;
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
        rewardAmount = amount/2;
        }
        // Ensure that we don't exceed MAX_AMOUNT
        if (userAmount + rewardAmount > MAX_AMOUNT) {
            rewardAmount = MAX_AMOUNT - userAmount;
        }

        // Transfer the reward to the user
       // console.logUint(amount);
        console.logUint(userAmount);
        XUSD(xusd).Rewardtransfer(user, rewardAmount);

        // Update the user's daily reward
        DailyRewards[rewardDayIndex][user] = userAmount + rewardAmount;

        // Decrement the reward balance
        RewardBalance -= rewardAmount;
    }
}
    function depositRewards(uint amount) external {
        assert(
            access.hasRank(HierarchicalAccessControl.Rank.SENATOR, msg.sender)
        );
        (xusd).transferFrom(msg.sender, address(this), amount);
        RewardBalance += (xusd).balanceOf(address(this));
    }

    function calculateRewards(
        address to,
        address from,
        address caller,
        uint amount,
        int vibes
    ) external {
        assert(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender)
        );

        if (
            (Rewards[to] || Rewards[from] || Rewards[caller]) && vibes <= 3000
        ) {
            rewardXusd(caller, amount);
        }
    }
}
