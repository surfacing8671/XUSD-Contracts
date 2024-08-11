// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;

import "./registry.sol";
import "./Classes/IClassBase.sol";


library UserClassRegistryLibrary  {

    using LibRegistry for LibRegistry.Registry;
    struct Class1 {     
        address classAddress; 
        int256 basisFee;
    }

    struct UserWithClass {
        address userAddress;   
        bool active;         
        Class1 class;      
    }



  


 
    struct Registry {
        uint256[] keys;
        mapping(uint256 => uint256) indexOf;
        mapping(uint256 => bool) inserted;
        mapping(uint => UserWithClass) Users;
 
    }


    function GetHashByIndex(Registry storage _registry, uint256 index) public view returns(uint256) {
        return _registry.keys[index];
    }

    function Count(Registry  storage _registry) public view returns(uint256) {
        return _registry.keys.length;
    }
 
    function Contains(Registry storage _registry, uint256 key) public view returns(bool) {
        return _registry.inserted[key];
    }

    function IsActive(Registry storage _registry, uint256 key) public view returns(bool) {
        return _registry.Users[key].active;
    }

    function GetBasis(Registry storage _registry, uint256 key) public view returns(int) {
        return _registry.Users[key].class.basisFee;
    }
    function GetUserClass(Registry storage _registry, uint256 key) public view returns (UserWithClass memory) {
     return _registry.Users[key];
    }


    function Register(Registry storage _registry, uint256 key, address user, address class) public {
        if(!_registry.inserted[key])
        {
            _registry.inserted[key] = true;
            _registry.indexOf[key] = _registry.keys.length;
            _registry.keys.push(key);
            _registry.Users[key].userAddress = user;
            _registry.Users[key].class.classAddress = class;
            _registry.Users[key].class.basisFee = IClassBase(class).getClassBasis();
            _registry.Users[key].active = true;
        
        }
    }
    
    function SetUserClassActiveStatus(Registry storage _registry, uint256 key, bool active) internal {
       
       
        if(Contains(_registry,key)) {
            _registry.Users[key].active = active;
        }
    
}
    function Remove(Registry storage _registry, uint256 key) public {
        if(!_registry.inserted[key]) return;
        delete _registry.inserted[key];
        uint256 index = _registry.indexOf[key];
        uint256 lastKey = _registry.keys[_registry.keys.length - 1];
        _registry.indexOf[lastKey] = index;
        delete _registry.indexOf[key];
        _registry.keys[index] = lastKey;
        _registry.keys.pop();
    }
}