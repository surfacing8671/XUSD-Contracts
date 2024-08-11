// // SPDX-License-Identifier: Sharia
// pragma solidity ^0.8.21;
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "./registry.sol";
// import "./ILitPass.sol";
// import "./atropamath.sol";

// import "./AccessGovernanceLibrary.sol";

// // library Expireable {
// //     function Expired(AccessRegistry.Accessor memory A) public view returns(bool) {
// //         return (block.timestamp > A.Expiration);
// //     }
// // }
// interface XUSD {
//     function burnBalance(address user)external view returns(uint256);
// }
//  abstract contract GovAccessRegistry is Ownable {
//     using LibRegistry for LibRegistry.Registry;
//     using AccessGovernanceLibrary for AccessGovernanceLibrary.Registry;
//     using AtropaMath for address;

//     address public xusd;
//     address public Lit;
//     uint public userAmount = 0;
//     uint public participantAmount = 107750000000;
//     uint public soldierAmount = 207750000000000;
//    //using Expireable for Accessor;
//    AccessGovernanceLibrary.Registry internal AccessRegistry;



//     constructor()Ownable(msg.sender) {
      
//     }
    
//     function setXusd(address _xusd) external onlyOwner {
//         xusd = _xusd;
//     }

//     function setLit(address _lit) external onlyOwner {
        
//         Lit = _lit;
//     }

//     function setRankingAmounts(uint _userAmount, uint _participantAmount, uint _soldierAmount) external  {
//         require(_hasAccess(msg.sender, AccessGovernanceLibrary.AccessType.PRESEDENT));
//         userAmount = _userAmount;
//         participantAmount = _participantAmount;
//         soldierAmount = _soldierAmount;
//     }
//     function hasAccess(address user, AccessGovernanceLibrary.AccessType min) private view returns (bool) {
//         if(user == owner()) return true;
//         uint256 hash = address(this).hashWith(user);
//         if(AccessRegistry.HasAccess(hash, min)) return true;
                
        
//         return false;
//     }
//     function _hasAccess(address user, AccessGovernanceLibrary.AccessType min) internal view returns (bool) {
//         if(user == owner()) return true;
//         uint256 hash = address(this).hashWith(user);
//         if(AccessRegistry.HasAccess(hash, min)) return true;
                
        
//         return false;
//     }

//     function setLitpass(address user,  uint tokenId) external {
//         uint256 hash = address(this).hashWith(user);
//         if(ILitPass(Lit).getOwner(tokenId) == user){
//             AccessRegistry.SetLitpass(hash, tokenId);
//         }
//     }
//     function applyForKing(address user, uint tokenId) external {
//         uint256 hash = address(this).hashWith(user);

//         if(AccessRegistry.Accessors[hash].burnAmount >= soldierAmount ){
//             if(ILitPass(Lit).getOwner(tokenId) == user){
//                 if(!_hasAccess(user, AccessGovernanceLibrary.AccessType.KING))  AccessRegistry.Accessors[hash].Class = AccessGovernanceLibrary.AccessType.KING;
//                 }
           

//         }  
//         }
    

//     function updateUser(address user) public returns(bool) {
//         uint256 hash = address(this).hashWith(user);
//         if(AccessRegistry.CheckUpgade(hash, soldierAmount, AccessGovernanceLibrary.AccessType.SOLDIER)) return true;
//         if(AccessRegistry.CheckUpgade(hash, participantAmount, AccessGovernanceLibrary.AccessType.PARTICIPANT)) return true;
//         if(AccessRegistry.CheckUpgade(hash, userAmount, AccessGovernanceLibrary.AccessType.USER)) return true;
//         return false;
//     }

//     function updateUserBurns(address user) public  {
//         uint256 hash = address(this).hashWith(user);
//         AccessRegistry.Accessors[hash].burnAmount = XUSD(xusd).burnBalance(user);
        
//     }



//     function RegisterGovAccess(address addr, AccessGovernanceLibrary.AccessType class) public {
//         assert(_hasAccess(msg.sender, AccessGovernanceLibrary.AccessType.CONTRACT));
//         SetAccess(addr, class);
//     }

//     function AccessIsClass(address user, AccessGovernanceLibrary.AccessType class) public view returns(bool) {
//         assert(_hasAccess(msg.sender, AccessGovernanceLibrary.AccessType.USER));
//          uint256 hash = address(this).hashWith(user);
//         return AccessRegistry.Accessors[hash].Class == class;
//     }

//     function AccessRegistryCount() public view returns(uint256) {
//         assert(_hasAccess(msg.sender, AccessGovernanceLibrary.AccessType.USER));
//         return AccessRegistry.Count();
//     }

//     function GetAccessByIndex(uint256 i) public view returns(AccessGovernanceLibrary.Accessor memory) {
//         uint256 hash = AccessRegistry.GetHashByIndex(i);
//         assert(_hasAccess(msg.sender, AccessGovernanceLibrary.AccessType.USER));
//         return AccessRegistry.Accessors[hash];
//     }

//     function SetAccess(address user, AccessGovernanceLibrary.AccessType Class) internal {
//          uint256 hash = address(this).hashWith(user);
//          assert(_hasAccess(msg.sender, AccessGovernanceLibrary.AccessType.USER));
//          AccessRegistry.Register(hash, user, Class);
//          AccessRegistry.Accessors[hash].Address = user;
//          AccessRegistry.Accessors[hash].Class = Class;
       

//     }

//     function RemoveAccess(address user) public {
//        //Accessor memory A = GetAccess(user);
//         assert(_hasAccess(msg.sender, AccessGovernanceLibrary.AccessType.CONGRESS));
//          uint256 hash = address(this).hashWith(user);
//          AccessRegistry.Remove(hash);
//         delete AccessRegistry.Accessors[hash];
//     }
// }