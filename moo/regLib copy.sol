// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.24;

// import "./registryMessage.sol";
// import "./atropamath.sol";
// import "./Classes/IClassBase.sol";
// import "./IClassRegistry.sol";
// import "./ILitPass.sol";

// /**
//  * @title RegistryLib
//  * @dev Library to interact with the SharedRegistry and ClassRegistry contracts.
//  */
// library RegistryLib {
//     using AtropaMath for address;

//     struct Registry {
//         uint256[] keys;
//         mapping(uint256 => uint256) indexOf;
//         mapping(uint256 => bool) inserted;
//         SharedRegistry registry;
//         IClassRegistry classReg;
//         ILitPass lit;
//     }

//     function GetHashByIndex(Registry storage _registry, uint256 index) public view returns(uint256) {
//         return _registry.keys[index];
//     }

//     function Count(Registry storage _registry) public view returns(uint256) {
//         return _registry.keys.length;
//     }

//     function registerAccess(Registry storage _registry, address user, SharedRegistry.AccessType class) public returns(bool) {
//         uint256 hash = address(this).hashWith(user);
//         if (!Contains(_registry, user)) {
//             return _registry.registry.registerAccess(hash, user, class);
//         }
//         return false;
//     }

//     function updateUser(Registry storage _registry, address user) public returns(bool) {
//         uint256 hash = address(this).hashWith(user);
//         return _registry.registry.updateUser(hash, user);
//     }

//     function checkUpgrade(Registry storage _registry, address user, uint256 amounts, SharedRegistry.AccessType class) public returns (bool) {
//         uint256 hash = address(this).hashWith(user);
//         return _registry.registry.checkUpgrade(hash, user, amounts, class);
//     }

//     function updateUserBurns(Registry storage _registry, address user, uint256 amounts, SharedRegistry.AccessType class) public {
//         uint256 hash = address(this).hashWith(user);
//         _registry.registry.updateUserBurns(hash, user);
//     }

//     function registerGovAccess(Registry storage _registry, SharedRegistry.AccessType class, address mapinlt, address user) public {
//         uint256 hash = address(this).hashWith(user);
//         _registry.registry.registerGovAccess(hash, mapinlt, class);
//     }

//     function setLitpass(Registry storage _registry, uint tokenId, address user) external {
//         uint256 hash = address(this).hashWith(user);
//         _registry.registry.setLitpass(hash, user, tokenId);
//     }
//     function GetVote(Registry storage _registry, uint hash) public view returns(uint) {
     
     
//         _registry.registry.GetVote(hash);
       
      
    
//     }
    

//     function GetVote(Registry storage _registry, address user) public view returns(uint) {
//         uint256 hash = address(this).hashWith(user);
//         return _registry.registry.GetVote(hash);
//     }

//     function addClass(Registry storage _registry, address _class, address user) external {
//         uint256 hash = address(this).hashWith(user);
//         if(_registry.registry._hasAccess(hash, SharedRegistry.AccessType.CONTRACT)){
 
//         _registry.classReg.addClass(_class);
//         }
//     }

//     function _hasClass(Registry storage _registry, address user) private view returns (bool) {
//         uint256 hash = address(this).hashWith(user);
//         return Contains(_registry, user);
//     }

//     function setMinBurnBalance(Registry storage _registry, uint256 amount, address user) external {   
//         uint256 hash = address(this).hashWith(user);
//         if(_registry.registry._hasAccess(hash, SharedRegistry.AccessType.CONGRESS)){
//         _registry.classReg.setMinBurnBalance(amount);
//         }
//     }

//     function ClassValid(Registry storage _registry, address dom) public view returns (bool) {                
//         return _registry.classReg.ClassValid(dom);
//     }

//     function ClassProposedValid(Registry storage _registry, address dom) public view returns (bool) {                
//         return _registry.classReg.ClassProposedValid(dom);
//     }

//     // function RegisterClass(Registry storage _registry, address dom, address user) public {
//     //     uint256 hash = address(this).hashWith(user);
//     //     uint256 hashD = address(this).hashWith(dom);
//     //     if (_registry.registry._hasAccess(hash, SharedRegistry.AccessType.CONGRESS)) {
//     //         _registry.classReg.RegisterClass(dom, hashD);
//     //     }
//     // }

//     function getClass(Registry storage _registry, address dom) public view returns (IClassRegistry.Class memory) {
//         return _registry.classReg.getClass(dom);
//     }

//     function getProposed(Registry storage _registry, address dom) public view returns (IClassRegistry.ProposedClass memory) {
//         uint256 hashD = address(this).hashWith(dom);
//         return _registry.classReg.getProposed(hashD);
//     }

//     function ClassRegistryCount(Registry storage _registry) public view returns (uint256) {      
//         return _registry.classReg.ClassRegistryCount();
//     }

//     function proposedCount(Registry storage _registry) public view returns (uint256) {      
//         return _registry.classReg.proposedCount();
//     }

//     function GetClassByIndex(Registry storage _registry, uint256 i) public view returns (IClassRegistry.Class memory) {
//         return _registry.classReg.GetClassByIndex(i);
//     }

//     function ProposeClass(Registry storage _registry, address dom, address user) public {
//         uint256 hash = address(this).hashWith(user);
//         require(_registry.registry._hasAccess(hash, SharedRegistry.AccessType.CONGRESS), "Nope");
//         require(_registry.lit.hasLitPass(user), "Need Litpass");
//         _registry.classReg.ProposeClass(dom);
//     }

//     function VoteClass(Registry storage _registry, address user, address dom) public {
//         uint256 hash = address(this).hashWith(user);
//         require(_registry.registry._hasAccess(hash, SharedRegistry.AccessType.USER), "You dont have access to propose a new class");
//         require(_registry.lit.hasLitPass(user), "Need Litpass");
//         require(_registry.classReg.ClassProposedValid(dom), "Not up for vote");
     
//         _registry.classReg.VoteClass(dom);
//     }

//     function checkClassApproval(Registry storage _registry, address dom, address user) internal {
//         uint256 hash = address(this).hashWith(user);
//         uint256 hashD = address(this).hashWith(dom);
//         if (_registry.registry._hasAccess(hash, SharedRegistry.AccessType.CONTRACT)) {
//             uint256 votes = _registry.classReg.getProposed(hashD).votes;
//             uint256 userAmount = Count(_registry);
//             uint256 amounts = userAmount * 5000 / 10000;
//             if (amounts <= votes) {
//                 _registry.classReg.RegisterClass(dom, hashD);
//             }
//         }
//     }

//     function SetClass(Registry storage _registry, address dom, address user) external {
//         uint256 hash = address(this).hashWith(user);
//         uint256 hashD = address(this).hashWith(dom);
//         uint256 classHash = address(this).hashWith(dom);
//         if (_registry.registry._hasAccess(hash, SharedRegistry.AccessType.USER)) {
//             _registry.classReg.SetClassNow(dom, classHash);
//         } else {
        
//             require(_registry.classReg.getProposed(hashD).votes > (Count(_registry) * 5000 / 10000), "Not enough votes");
//             _registry.classReg.RegisterClass(dom, classHash);
//         }
//     }

//     function RemoveClass(Registry storage _registry, address dom) internal {
//         _registry.classReg.RemoveClass(dom);
//     }

//     function Contains(Registry storage _registry, address user) public view returns(bool) {
//         uint256 hash = address(this).hashWith(user);
//         return _registry.inserted[hash];
//     }

//     function RegisterAuth(Registry storage _registry, address user, address reg) public {
//         uint256 hash = address(this).hashWith(user);
//         if (!_registry.inserted[hash]) {
//             _registry.inserted[hash] = true;
//             _registry.indexOf[hash] = _registry.keys.length;
//             _registry.registry = SharedRegistry(reg);
 
//             _registry.keys.push(hash);
//         }
//     }

//     function RegisterClass(Registry storage _registry, address dom,  address classReg) public {
//         uint256 hash = address(this).hashWith(dom);
//         if (!_registry.inserted[hash]) {
//             _registry.inserted[hash] = true;
//             _registry.indexOf[hash] = _registry.keys.length;
     
//             _registry.classReg = IClassRegistry(classReg);
//             _registry.keys.push(hash);


//         }
//     }

//     function Remove(Registry storage _registry, address user) public {
//         uint256 hash = address(this).hashWith(user);
//         if (!_registry.inserted[hash]) return;
//         delete _registry.inserted[hash];
//         uint256 index = _registry.indexOf[hash];
//         uint256 lastKey = _registry.keys[_registry.keys.length - 1];
//         _registry.indexOf[lastKey] = index;
//         delete _registry.indexOf[hash];
//         _registry.keys[index] = lastKey;
//         _registry.keys.pop();
//         _registry.registry.removeAccess(hash);
//     }
// }
