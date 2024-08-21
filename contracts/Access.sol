// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./registry.sol";
import "./atropamath.sol";

contract HierarchicalAccessControl {
    using LibRegistry for LibRegistry.Registry;
    using AtropaMath for address;

    enum Rank {
        PRINCEPS,         // 0
        GLADIATOR,        // 1
        LEGATUS,          // 2
        SENATOR,          // 3
        CONSUL,           // 4
        PREATORMAXIMUS    // 5 (Highest rank)
    }

    LibRegistry.Registry private Registry;
    mapping(address => Rank) internal Ranks;

    // Custom errors for gas-efficient error handling
    error AccessDenied(address account, Rank requiredRank);
    error InvalidOperation(string reason);

    // Events
    event RankAssigned(address indexed account, Rank rank);
    event RankRevoked(address indexed account);
    event RankUpgraded(address indexed account, Rank newRank);
    event RankDowngraded(address indexed account, Rank newRank);

    // Constructor to assign the deployer the highest rank
    constructor() {
        _assignRank(msg.sender, Rank.PREATORMAXIMUS);
    }

    // Modifier to check for rank access
    modifier onlyRank(Rank requiredRank) {
        if (!hasRank(requiredRank, msg.sender)) {
            revert AccessDenied(msg.sender, requiredRank);
        }
        _;
    }

    // Function to check if a contract has the required rank or higher
    function hasRank(Rank requiredRank, address account) public view returns (bool) {
        return Ranks[account] >= requiredRank;
    }

    // Function to assign a rank to an account, with strict control
    function assignRank(address account, Rank rank) public onlyRank(Rank.CONSUL) {
        if (Ranks[account] >= Rank.PREATORMAXIMUS) {
            revert InvalidOperation("Cannot assign or reassign PREATORMAXIMUS rank");
        }
        _assignRank(account, rank);
    }

    // Internal function to assign a rank
    function _assignRank(address account, Rank rank) internal {
        Ranks[account] = rank;
        emit RankAssigned(account, rank);
    }

    // Function to get the rank of an account
    function getRank(address account) public view returns (Rank) {
        return Ranks[account];
    }

    // Function to revoke a rank from an account
    function revokeRank(address account) public onlyRank(Rank.SENATOR) {
        if (Ranks[account] == Rank.PREATORMAXIMUS) {
            revert InvalidOperation("Cannot revoke PREATORMAXIMUS rank");
        }
        delete Ranks[account];
        emit RankRevoked(account);
    }

    // Function to upgrade the rank of an account
    function upgradeRank(address account) public onlyRank(Rank.CONSUL) {
        Rank currentRank = Ranks[account];
        if (currentRank >= Rank.LEGATUS) {
            revert InvalidOperation("Already at highest rank");
        }
        _assignRank(account, Rank(uint(currentRank) + 1));
        emit RankUpgraded(account, Ranks[account]);
    }

    // Function to downgrade the rank of an account
    function downgradeRank(address account) public onlyRank(Rank.CONSUL) {
        Rank currentRank = Ranks[account];
        if (currentRank <= Rank.PRINCEPS) {
            revert InvalidOperation("Already at lowest rank");
        }
        _assignRank(account, Rank(uint(currentRank) - 1));
        emit RankDowngraded(account, Ranks[account]);
    }


}