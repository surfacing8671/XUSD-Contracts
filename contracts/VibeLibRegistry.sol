// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.24;
import "./Classes/VibeBase.sol";
library VibeLibRegistry {
  

    struct Registry {
        address[] keys; // List of registered addresses
        mapping(address => uint256) indexOf; // Maps an address to its index in `keys`
        mapping(address => bool) inserted; // Tracks whether an address is in the registry
        mapping(address => VibeBase.Importance) accessStyles; // Mapping for enumerator list
    }

    function GetHashByIndex(Registry storage _registry, uint index) public view returns (address) {
        return _registry.keys[index];
    }

    function Count(Registry storage _registry) public view returns (uint256) {
        return _registry.keys.length;
    }

    function Contains(Registry storage _registry, address key) public view returns (bool) {
        return _registry.inserted[key];
    }

    function ReturnAllKeys(Registry storage _registry) public view returns (address[] storage) {
        return _registry.keys;
    }

    // Register a key with its associated access style
    function Register(Registry storage _registry, address key, VibeBase.Importance accessStyle) public {
        if (!_registry.inserted[key]) {
            _registry.inserted[key] = true;
            _registry.indexOf[key] = _registry.keys.length;
            _registry.keys.push(key);
            _registry.accessStyles[key] = accessStyle; // Assign the access style
        }
    }

    function Remove(Registry storage _registry, address key) public {
        if (!_registry.inserted[key]) return;
        delete _registry.inserted[key];
        delete _registry.accessStyles[key]; // Remove the access style
        uint256 index = _registry.indexOf[key];
        address lastKey = _registry.keys[_registry.keys.length - 1];
        _registry.indexOf[lastKey] = index;
        delete _registry.indexOf[key];
        _registry.keys[index] = lastKey;
        _registry.keys.pop();
    }

    // Get the access style for a specific key
    function GetAccessStyle(Registry storage _registry, address key) public view returns (VibeBase.Importance) {
        require(_registry.inserted[key], "Key not found in registry");
        return _registry.accessStyles[key];
    }

    // New function to sort the registry based on AccessStyle ranking
function SortRegistryByAccessStyle(Registry storage _registry) public {
    uint256 n = _registry.keys.length;
    for (uint256 i = 0; i < n - 1; i++) {
        uint256 maxIndex = i;
        for (uint256 j = i + 1; j < n; j++) {
            // Compare based on AccessStyle rank (sorting from highest to lowest)
            if (uint256(_registry.accessStyles[_registry.keys[j]]) > uint256(_registry.accessStyles[_registry.keys[maxIndex]])) {
                maxIndex = j;
            }
        }
        if (maxIndex != i) {
            // Swap keys
            address temp = _registry.keys[i];
            _registry.keys[i] = _registry.keys[maxIndex];
            _registry.keys[maxIndex] = temp;

            // Update indexOf mapping
            _registry.indexOf[_registry.keys[i]] = i;
            _registry.indexOf[_registry.keys[maxIndex]] = maxIndex;
        }
    }
}

}