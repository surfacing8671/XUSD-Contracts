// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

interface IAccessManager {
    // Define the Rank enum directly in the interface
    enum Rank {
        PRINCEPS, // Lowest rank
        GLADIATOR,
        LEGATUS,
        SENATOR,
        CONSUL,
        PREATORMAXIMUS // Highest rank
    }
  error UnauthorizedAccess( IAccessManager.Rank roleId, address addr);
    // Events to notify about role changes
    event RoleGranted(address indexed account, Rank role);
    event RoleRevoked(address indexed account);

    // Function to grant a role to a specific account
    function grantRole(address account, Rank rank) external;

    // Function to revoke a role from a specific account
    function revokeRole(address account) external;

    // Function to check if an account has a specific role or higher
    function checkRole(address account, Rank rank) external view returns (bool);

    // Utility function to get the rank of an account
    function getAccountRank(address account) external view returns (Rank);

    // Utility function to get all registered accounts (keys)
    function getAllAccounts() external view returns (uint256[] memory);
}
