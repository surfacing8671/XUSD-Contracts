// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./Access.sol"; // Assume AuthLib includes all the functionality as discussed previously

contract AccessManager {
    using AuthLib for AuthLib.RoleData;

    AuthLib.RoleData private roleData;

    // Event declarations for logging changes
    event RoleGranted(address indexed account, AuthLib.Rank role);
    event RoleRevoked(address indexed account);

    // Constructor to initialize the access control settings
    constructor() {
        // Grant the deployer the highest role initially
        roleData.grantRole(msg.sender, AuthLib.Rank.PREATORMAXIMUS);
    }

    // Grant a role to a specific account
    function grantRole(address account, AuthLib.Rank rank) public {
        require(
            roleData.getHighestRankForAccount(msg.sender) >= AuthLib.Rank.CONSUL,
            "Insufficient privileges to grant roles."
        );
        roleData.grantRole(account, rank);
        emit RoleGranted(account, rank);
    }

    // Revoke a role from a specific account
    function revokeRole(address account) public {
        require(
            roleData.getHighestRankForAccount(msg.sender) >= AuthLib.Rank.CONSUL,
            "Insufficient privileges to revoke roles."
        );
        roleData.revokeRole(account);
        emit RoleRevoked(account);
    }

    // Check if an account has a specific role or higher
    function checkRole(address account, AuthLib.Rank rank) public view returns (bool) {
        return roleData.getHighestRankForAccount(account) >= rank;
    }

    // Utility function to get the rank of an account
    function getAccountRank(address account) public view returns (AuthLib.Rank) {
        return roleData.getHighestRankForAccount(account);
    }

   
}
