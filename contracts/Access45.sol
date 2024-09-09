// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./registry.sol";
import "./atropamath.sol";

/**
 * @title HierarchicalAccessControl
 * @dev Implements role-based access control with hierarchical ranks.
 */
contract HierarchicalAccessControl {
    using LibRegistry for LibRegistry.Registry;


    /**
     * @dev Enum representing different ranks.
     */
    enum Rank {
        PRINCEPS,         // 0
        GLADIATOR,        // 1
        LEGATUS,          // 2
        SENATOR,          // 3
        CONSUL,           // 4
        PREATORMAXIMUS    // 5 (Highest rank)
    }
   int internal gladiator = 350;
    /// @notice Internal registry instance
    LibRegistry.Registry private Registry;

    /// @notice Mapping from address to their assigned rank
    mapping(address => Rank) internal Ranks;

    // Custom errors for gas-efficient error handling
    /**
     * @dev Error thrown when an account lacks the required rank.
     * @param account The address of the account attempting the operation.
     * @param requiredRank The rank required for the operation.
     */
    error AccessDenied(address account, Rank requiredRank);

    /**
     * @dev Error thrown when an invalid operation is attempted.
     * @param reason The reason why the operation is invalid.
     */
    error InvalidOperation(string reason);

    // Events
    /**
     * @dev Emitted when a rank is assigned to an account.
     * @param account The address of the account being assigned a rank.
     * @param rank The rank assigned to the account.
     */
    event RankAssigned(address indexed account, Rank rank);

    /**
     * @dev Emitted when a rank is revoked from an account.
     * @param account The address of the account whose rank is revoked.
     */
    event RankRevoked(address indexed account);

    /**
     * @dev Emitted when an account's rank is upgraded.
     * @param account The address of the account being upgraded.
     * @param newRank The new rank assigned to the account.
     */
    event RankUpgraded(address indexed account, Rank newRank);

    /**
     * @dev Emitted when an account's rank is downgraded.
     * @param account The address of the account being downgraded.
     * @param newRank The new rank assigned to the account.
     */
    event RankDowngraded(address indexed account, Rank newRank);

    /**
     * @dev Constructor that assigns the deployer the highest rank (PREATORMAXIMUS).
     */
    constructor() {
        _assignRank(msg.sender, Rank.PREATORMAXIMUS);
    }

    /**
     * @dev Modifier to check if the sender has the required rank.
     * @param requiredRank The rank required to execute the function.
     */
    modifier onlyRank(Rank requiredRank) {
        if (!hasRank(requiredRank, msg.sender)) {
            revert AccessDenied(msg.sender, requiredRank);
        }
        _;
    }

    /**
     * @notice Check if an account has the required rank or higher.
     * @param requiredRank The rank required.
     * @param account The address of the account to check.
     * @return bool True if the account has the required rank or higher, false otherwise.
     */
    function hasRank(Rank requiredRank, address account) public view returns (bool) {
        return Ranks[account] >= requiredRank;
    }

    /**
     * @notice Assign a rank to an account.
     * @dev Can only be called by accounts with CONSUL rank or higher.
     * @param account The address to assign the rank to.
     * @param rank The rank to be assigned.
     */
    function assignRank(address account, Rank rank) public onlyRank(Rank.CONSUL) {
        if (Ranks[account] >= Rank.PREATORMAXIMUS) {
            revert InvalidOperation("Cannot assign or reassign PREATORMAXIMUS rank");
        }
        _assignRank(account, rank);
    }


    /**
     * @notice Internal function to assign a rank to an account.
     * @param account The address to assign the rank to.
     * @param rank The rank to be assigned.
     */
    function _assignRank(address account, Rank rank) internal {
        Ranks[account] = rank;
        emit RankAssigned(account, rank);
    }

    /**
     * @notice Get the rank of an account.
     * @param account The address to check.
     * @return Rank The rank of the account.
     */
    function getRank(address account) public view returns (Rank) {
        return Ranks[account];
    }

    /**
     * @notice Revoke the rank of an account.
     * @dev Can only be called by accounts with SENATOR rank or higher.
     * @param account The address to revoke the rank from.
     */
    function revokeRank(address account) public onlyRank(Rank.SENATOR) {
        if (Ranks[account] == Rank.PREATORMAXIMUS) {
            revert InvalidOperation("Cannot revoke PREATORMAXIMUS rank");
        }
        delete Ranks[account];
        emit RankRevoked(account);
    }

    /**
     * @notice Upgrade the rank of an account.
     * @dev Can only be called by accounts with CONSUL rank or higher.
     * @param account The address to upgrade the rank for.
     */
    function upgradeRank(address account) public onlyRank(Rank.CONSUL) {
        Rank currentRank = Ranks[account];
        if (currentRank >= Rank.LEGATUS) {
            revert InvalidOperation("Already at highest rank");
        }
        _assignRank(account, Rank(uint(currentRank) + 1));
        emit RankUpgraded(account, Ranks[account]);
    }

    /**
     * @notice Downgrade the rank of an account.
     * @dev Can only be called by accounts with CONSUL rank or higher.
     * @param account The address to downgrade the rank for.
     */
    function downgradeRank(address account) public onlyRank(Rank.CONSUL) {
        Rank currentRank = Ranks[account];
        if (currentRank <= Rank.PRINCEPS) {
            revert InvalidOperation("Already at lowest rank");
        }
        _assignRank(account, Rank(uint(currentRank) - 1));
        emit RankDowngraded(account, Ranks[account]);
    }
}
