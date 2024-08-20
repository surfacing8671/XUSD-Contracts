// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.24;

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "./registry.sol";
// import "./atropamath.sol";
// import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

// import "./AccessRegistry.sol";

//  import "./ClassRegistry.sol";


//  interface IXUSD {
//   function burnBalance(address user) external view returns (uint256);
//   function totalBurned()external view returns(uint);
// }
// contract NFTRegistry {
//   using LibRegistry for LibRegistry.Registry;

//   using AtropaMath for address;
//   struct nfts {
//   address owner;
//   uint burnAmount;
//   string userName;
//   uint tokenId;
//   uint purchaseBurnAmount;
//  string url;
 
    
//   }



//   LibRegistry.Registry private _VibePass;


//   mapping(uint => string) internal protocolAlert;
//   mapping(uint => mapping(uint => string)) internal protocolMessages;
//   mapping(uint => string) internal uris;

  
//   mapping(uint => nfts) internal NFTRegistry;
//   mapping(address => bool) internal LitPassUserIndex;

//   mapping(address => uint160) internal LitPassTokenIdIndex;
//   address public xusd;

//     constructor(address _xusd) {
//         xusd = _xusd;
//     }

//     function GetUserBurnAmount( address user) public view returns(uint256) {
//        return IXUSD(xusd).burnBalance(user);
//     }

//     function GetUserTotalBurn() public view returns(uint256) {
//        return IXUSD(xusd).totalBurned();
//     }

//      function getUserList()external view returns(nfts[] memory) {
//     nfts[] memory kings = new nfts[](_VibePass.Count());
//     for(uint i; i < _VibePass.Count(); i++){

//       kings[i].owner =  NFTRegistry[_VibePass.GetHashByIndex(i)].owner;
//       kings[i].tokenId =  NFTRegistry[_VibePass.GetHashByIndex(i)].tokenId;
//       kings[i].userName =  NFTRegistry[_VibePass.GetHashByIndex(i)].userName;
//       kings[i].burnAmount =  IXUSD(xusd).burnBalance(NFTRegistry[_VibePass.GetHashByIndex(i)].owner) -  NFTRegistry[_VibePass.GetHashByIndex(i)].purchaseBurnAmount;
     

//     }
//   return kings;
  
//   }

//     function getUserBurns(address user) public {
//     uint256 hash = address(this).hashWith(user);
//     NFTRegistry[hash].burnAmount =  IXUSD(xusd).burnBalance(NFTRegistry[hash].owner) -  NFTRegistry[hash].purchaseBurnAmount;
//   }



//   function calculateBurn(address user) public  returns (uint) {
//     uint256 hash = address(this).hashWith(user);
//    // uint256 userHash = address(this).hashWith(NFTRegistry[hash].owner);
//     NFTRegistry[hash].burnAmount = IXUSD(xusd).burnBalance(NFTRegistry[hash].owner);
   
//     return IXUSD(xusd).burnBalance(NFTRegistry[hash].owner);
//   }

//   function getProtocolBurn() public view returns(uint)  {
   
//    // uint256 userHash = address(this).hashWith(NFTRegistry[hash].owner);
//    return IXUSD(xusd).totalBurned();

//   }

//   function setUserName(address user, string memory userName) public   {
//     uint256 hash = address(this).hashWith(user);
 
//    NFTRegistry[hash].userName = userName;

//   }

//   function viewUserName(address user) public  returns(string memory)   {
//     uint256 hash = address(this).hashWith(user);
 
//    return NFTRegistry[hash].userName;

//   }

//   function viewUserBurns(address user) public  returns(uint)   {
//     uint256 hash = address(this).hashWith(user);
 
//    return NFTRegistry[hash].burnAmount;

//   }




//   function viewUrl(address user) public  returns(string memory)   {
//     uint256 hash = address(this).hashWith(user);
 
//    return NFTRegistry[hash].url;

//   }




// function GetNftByIndexHash(uint256 i) public view returns (uint) {
//     uint256 hash = _VibePass.GetHashByIndex(i);       
//     return hash;
// }


   
// }