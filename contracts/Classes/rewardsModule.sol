// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "../Access.sol";
import "./VibeBase.sol";
import "hardhat/console.sol";
import "../XUSD1.sol";
import "./IPancackePair.sol";

/**
 * @title GenesisRewardsModule
 * @dev A tax calculator that provides rewards for both referrers and referred addresses.
 */
contract GenesisRewardsModule is VibeBase {
    mapping(address => bool) public Rewards;
    mapping(address => bool) public submitted;

    uint256 public RewardBalance = 0;
    uint256 public PendingewardBalance = 0;
    XUSD public xusd;
    uint256 private rewardDayIndex = 1;
    uint256 private LastUpdateTime = 0;

    uint256 public constant MAX_AMOUNT = 1000 * 1e18;
    uint256 public constant DAILY_LIMIT = 100000 * 1e18;
    mapping(address => mapping(uint256 => uint256)) public DailyRewards;
    mapping(address => uint256) public pendingRewards;
    mapping(uint => uint256) public DailyTotal;
    HierarchicalAccessControl private access;

    event AddedToWhitelist(address indexed account, address indexed by);
    event RewardsDeposited(uint256 amount, address indexed by);
    event RewardsCalculated(address indexed user, uint256 amount);
    event RewardsClaimed(address indexed user, uint256 amount);

    constructor(
        address _access,
        address _xusd,
        VibeInfo memory _description
    ) VibeBase(_description, _access) {
        access = HierarchicalAccessControl(_access);
        xusd = XUSD(_xusd);
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
        emit AddedToWhitelist(account, msg.sender);
    }

    function addToWhiteList(address account) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.LEGATUS, msg.sender),
            "Access denied: LEGATUS rank required"
        );
        require(!submitted[msg.sender], "Only allowed to submit once");

        Rewards[account] = true;
        submitted[msg.sender] = true;
        emit AddedToWhitelist(account, msg.sender);
    }

    /**
     * @dev Allows users to view their daily rewards with pagination.
     * @param account The address of the user.
     * @param start The starting index (inclusive) for the pagination.
     * @param limit The maximum number of entries to return.
     * @return rewards An array of daily rewards.
     * @return totalRewards The total number of rewards available for the user.
     */
    function viewRewards(address account, uint256 start, uint256 limit)
        external
        view
        returns (uint256[] memory rewards, uint256 totalRewards)
    {
        require(start < rewardDayIndex, "Start index out of bounds");

        uint256 end = start + limit;
        if (end > rewardDayIndex) {
            end = rewardDayIndex;
        }

        rewards = new uint256[](end - start);

        for (uint256 i = start; i < end; ) {
            rewards[i - start] = DailyRewards[account][i];
            unchecked {
                i++;
            }
        }

        totalRewards = rewardDayIndex;
        return (rewards, totalRewards);
    }

    function hasSubmitted(address user) external view returns (bool) {
        return submitted[user];
    }

function rewardXusd(address user, uint256 amount) internal {
    // Initialize the last update time if it's not set
    if (LastUpdateTime == 0) {
        LastUpdateTime = block.timestamp;
    }

    // Increment day index if a new day has started
    if (block.timestamp >= LastUpdateTime + 1 days) {
        rewardDayIndex++;
        LastUpdateTime = block.timestamp;
    }

    uint256 userAmount = DailyRewards[user][rewardDayIndex];
    uint256 rewardAmount = amount / 4;

    // If user is already at or over the daily limit, exit early
    if (userAmount >= MAX_AMOUNT) {
        emit RewardsCalculated(user, 0);
        return;
    }

    // Adjust reward amount if it exceeds the maximum allowed per user
    if (rewardAmount > MAX_AMOUNT) {
        rewardAmount = MAX_AMOUNT;
    }

    // Adjust reward amount if adding it would exceed the user's daily maximum
    if (userAmount + rewardAmount > MAX_AMOUNT) {
        rewardAmount = MAX_AMOUNT - userAmount;
    }

    uint256 totalDayAmount = DailyTotal[rewardDayIndex];

    // Adjust reward amount if adding it would exceed the total daily limit
    if (totalDayAmount + rewardAmount > DAILY_LIMIT) {
        rewardAmount = DAILY_LIMIT - totalDayAmount;
    }

    // Adjust reward amount if there isn't enough reward balance
    if (RewardBalance < rewardAmount) {
        rewardAmount = RewardBalance;
        RewardBalance = 0;
    } else {
        unchecked {
            RewardBalance -= rewardAmount;
        }
    }

    unchecked {
        pendingRewards[user] += rewardAmount;
        DailyRewards[user][rewardDayIndex] = userAmount + rewardAmount;
    }

    emit RewardsCalculated(user, rewardAmount);
}

    function getTotalDailyRewards() external view returns (uint256) {
        uint256 total = 0;
        for (uint256 i = 0; i < rewardDayIndex; i++) {
            total += DailyRewards[msg.sender][i];
        }
        return total;
    }

    function depositRewards(uint256 amount) external nonReentrant {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.SENATOR, msg.sender),
            "Access denied: SENATOR rank required"
        );
        require(xusd.transferFrom(msg.sender, address(this), amount), "Transfer failed");

        RewardBalance = xusd.balanceOf(address(this));
        emit RewardsDeposited(amount, msg.sender);
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
            (Rewards[to] || Rewards[from] || Rewards[caller] || Rewards[sender]) && vibes <= 2000
        ) {
            rewardXusd(caller, amount);
        }
    }

    function claimRewards() external nonReentrant {
        uint256 amount = pendingRewards[msg.sender];
        require(amount > 0, "No rewards to claim");

        require(xusd.transfer(msg.sender, amount), "Reward transfer failed");

        pendingRewards[msg.sender] = 0;

        emit RewardsClaimed(msg.sender, amount);
    }
}
