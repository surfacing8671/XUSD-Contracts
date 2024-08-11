// // SPDX-License-Identifier: Sharia
// pragma solidity ^0.8.21;

// import "./registry.sol";


// library AccessGovernanceLibrary  {

//     using LibRegistry for LibRegistry.Registry;


//     enum AccessType {
//         PRESEDENT,
//         CONGRESS,
//         CONTRACT,
//         KING,
//         SOLDIER,
//         PARTICIPANT,
//         USER
//     }

//     struct Accessor {
//         address Address;
//         AccessType Class;
//         string[] Notes;
//         uint burnAmount;
//         uint litPass;
//     }
//     struct Registry {
//         uint256[] keys;
//         mapping(uint256 => uint256) indexOf;
//         mapping(uint256 => bool) inserted;
//         mapping(uint256 => Accessor)  Accessors;
 
//     }
//     function CheckUpgade(Registry storage _registry, uint256 key, uint amounts, AccessType class)public  returns(bool){
//         if(_registry.Accessors[key].burnAmount >= amounts){

//             _registry.Accessors[key].Class = class;
//             return true;
//         }
//         return false;
//     }



//     function GetAccess(Registry storage _registry, uint256 key) public view returns (Accessor memory) {
//         assert(HasAccess(_registry, key, AccessType.USER));
//         return _registry.Accessors[key];
//     }
//     function GetHashByIndex(Registry storage _registry, uint256 index) public view returns(uint256) {
//         return _registry.keys[index];
//     }

//     function Count(Registry  storage _registry) public view returns(uint256) {
//         return _registry.keys.length;
//     }
//     function SetLitpass(Registry  storage _registry, uint256 key,  uint tokenId) external {
//         _registry.Accessors[key].litPass = tokenId;
//     }
//     function Contains(Registry storage _registry, uint256 key) public view returns(bool) {
//         return _registry.inserted[key];
//     }

//     function HasAccess(Registry storage _registry, uint256 key, AccessType  class) public view returns(bool) {
//         if(_registry.Accessors[key].Class <= class) return true;
//         return false;
//     }

//     function Register(Registry storage _registry, uint256 key, address user, AccessType Class) public {
//         if(!_registry.inserted[key])
//         {
//             _registry.inserted[key] = true;
//             _registry.indexOf[key] = _registry.keys.length;
//             _registry.keys.push(key);
//             _registry.Accessors[key].Address = user;
//             _registry.Accessors[key].Class = Class;
//         }
//     }

//     function Remove(Registry storage _registry, uint256 key) public {
//         if(!_registry.inserted[key]) return;
//         delete _registry.inserted[key];
//         uint256 index = _registry.indexOf[key];
//         uint256 lastKey = _registry.keys[_registry.keys.length - 1];
//         _registry.indexOf[lastKey] = index;
//         delete _registry.indexOf[key];
//         _registry.keys[index] = lastKey;
//         _registry.keys.pop();
//     }
// }