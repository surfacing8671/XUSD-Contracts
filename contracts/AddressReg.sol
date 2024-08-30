// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.24;

/**
 * @title LibRegistryAdd
 * @dev Library for managing a registry of addresses with efficient lookup, insertion, and removal.
 */
library LibRegistryAdd {
    /**
     * @dev Data structure to hold the registry of addresses.
     */
    struct Registry {
        address[] keys; // List of registered addresses
        mapping(address => uint256) indexOf; // Maps an address to its index in `keys`
        mapping(address => bool) inserted; // Tracks whether an address is in the registry
    }

    /**
     * @notice Returns the address stored at a specific index in the registry.
     * @param _registry The registry being accessed.
     * @param index The index of the address to retrieve.
     * @return address The address at the given index.
     */
    function GetHashByIndex(Registry storage _registry, uint256 index) public view returns (address) {
        return _registry.keys[index];
    }

    /**
     * @notice Returns the total number of addresses stored in the registry.
     * @param _registry The registry being queried.
     * @return uint256 The number of addresses in the registry.
     */
    function Count(Registry storage _registry) public view returns (uint256) {
        return _registry.keys.length;
    }

    /**
     * @notice Checks if a specific address is contained in the registry.
     * @param _registry The registry being checked.
     * @param key The address to check for.
     * @return bool True if the address is in the registry, false otherwise.
     */
    function Contains(Registry storage _registry, address key) public view returns (bool) {
        return _registry.inserted[key];
    }

    /**
     * @notice Returns all the addresses stored in the registry.
     * @param _registry The registry being accessed.
     * @return address[] storage The list of all addresses in the registry.
     */
    function ReturnAllKeys(Registry storage _registry) public view returns (address[] storage) {
        return _registry.keys;
    }

    /**
     * @notice Registers an address in the registry if it is not already registered.
     * @param _registry The registry being modified.
     * @param key The address to register.
     */
    function Register(Registry storage _registry, address key) public {
        if (!_registry.inserted[key]) {
            _registry.inserted[key] = true;
            _registry.indexOf[key] = _registry.keys.length;
            _registry.keys.push(key);
        }
    }

    /**
     * @notice Removes an address from the registry.
     * @param _registry The registry being modified.
     * @param key The address to remove.
     */
    function Remove(Registry storage _registry, address key) public {
        if (!_registry.inserted[key]) return;

        delete _registry.inserted[key];
        uint256 index = _registry.indexOf[key];
        address lastKey = _registry.keys[_registry.keys.length - 1];
        _registry.indexOf[lastKey] = index;
        delete _registry.indexOf[key];
        _registry.keys[index] = lastKey;
        _registry.keys.pop();
    }
}
