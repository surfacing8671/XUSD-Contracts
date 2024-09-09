// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

library AuthLib {
    error AccessControlUnauthorizedAccount(address account, bytes32 neededRole);

    enum Rank {
        PRINCEPS,
        GLADIATOR,
        LEGATUS,
        SENATOR,
        CONSUL,
       
        PREATORMAXIMUS
    }

    struct Registry {
        uint256[] keys;
        mapping(uint256 => uint256) indexOf;
        mapping(uint256 => bool) inserted;
        mapping(uint256 => Rank) keyRoles;  // Mapping from keys to roles
    }

    struct RoleData {
        Registry registry; 
        mapping(address => Rank) ranks; 
    }

    function Register(Registry storage _registry, uint256 key, Rank rank) public {
        if (!_registry.inserted[key]) {
            _registry.inserted[key] = true;
            _registry.indexOf[key] = _registry.keys.length;
            _registry.keys.push(key);
            _registry.keyRoles[key] = rank;  // Store the rank with the key
        } else {
            // Update the rank if already registered
            _registry.keyRoles[key] = rank;
        }
    }

    function Remove(Registry storage _registry, uint256 key) public {
        if (!_registry.inserted[key]) return;
        delete _registry.inserted[key];
        uint256 index = _registry.indexOf[key];
        uint256 lastKey = _registry.keys[_registry.keys.length - 1];
        _registry.keys[index] = lastKey;
        _registry.indexOf[lastKey] = index;
        delete _registry.indexOf[key];
        _registry.keys.pop();
        delete _registry.keyRoles[key];  // Remove the associated role
    }

    function grantRole(RoleData storage roleData, address account, Rank rank) public {
        uint256 key = uint256(uint160(account)); 
        roleData.ranks[account] = rank;
        Register(roleData.registry, key, rank);
    }

    function revokeRole(RoleData storage roleData, address account) public {
        uint256 key = uint256(uint160(account)); 
        delete roleData.ranks[account];
        Remove(roleData.registry, key);
    }

    function checkRole(RoleData storage roleData, Rank requiredRank, address account) public view {
        require(roleData.ranks[account] >= requiredRank, "AccessControlUnauthorizedAccount");
    }

    function getHighestRankForAccount(RoleData storage roleData, address account) public view returns (Rank) {
        return roleData.ranks[account];
    }

  
}
