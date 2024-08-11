// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.24;

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
// import "./registry.sol";
// import "./atropamath.sol";
// import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
// import "./TUSDRegistry.sol";


//  import "./ClassRegistry.sol";


//  interface IXUSD {
//   function burnBalance(address user) external view returns (uint256);
//   function totalBurned()external returns(uint);
// }
// contract LitPass is ERC721URIStorage, Ownable, TUSDRegistry {
//   using LibRegistry for LibRegistry.Registry;

//   using AtropaMath for address;


//   ClassRegistry private access;

//   error LitPassAlreadyMinted();
//   error UserDoesNotOwnLitPassId();
//   error LitPassDelegated();
//   error LitPassCanOnlyHoldOne();
//   error LitPassNonExistant();
//   error LitPassNotDelegated();

//   struct litpass {
//     nfts litPass;    
//     string uri;


   
   
   
//   }

//   struct nfts {
//     address owner;
//     uint id;

    
//     uint ownerBurn;

 
    
//   }
// struct KingList {
//   address owner;
//   uint burnAmount;
//   string userName;
//   uint tokenId;
// }
//   struct OwnerInfo {
//     address owner;
//     uint tokenId;  
//     uint burnAmount;
//     uint purchaseBurnAmount;
//     uint accessKey;
//     string url;
//     uint bonus;
//     uint totalInflation;
//     uint totalBurn;
//     string userName;
//     uint aquired;
//     string bio;
//     mapping(uint => mapping(uint => string)) protocolMessages;
//     mapping(uint => uint) messageIndex;
    
//   }


//   LibRegistry.Registry private _LitPass;

//   LibRegistry.Registry internal LitPassHolderReg;

//   mapping(uint => string) internal protocolAlert;
//   mapping(uint => mapping(uint => string)) internal protocolMessages;
//   mapping(uint => string) internal uris;
//   mapping(uint => OwnerInfo) internal LitPassHolder;
  
//   mapping(uint => nfts) internal NFTRegistry;
//   mapping(address => bool) internal LitPassUserIndex;

//   mapping(address => uint) internal LitPassTokenIdIndex;

//   address public xusd;
//   address public oneSwap;
//   uint public purchaseAmount;

//   constructor(
//     address _oneSwap,
//     address classReg
//   ) public ERC721(".", ".")  Ownable(msg.sender) {
//     access = ClassRegistry(classReg);
//     oneSwap = _oneSwap;
   
//   }

//   function mintPass() public {
//     uint newItemId = _LitPass.Count() + 1;
//     uint hash = address(this).hashWithId(newItemId);
  
//    assert(access.HasAccess(msg.sender, AccessRegistry.AccessType.USER, address(this)));
//     // uint hashU = address(this).hashWith(msg.sender);
//     IERC20(oneSwap).transferFrom(msg.sender, address(this), purchaseAmount);
//     if(!LitPassHolderReg.Contains(hash)){
 
//     _safeMint(msg.sender, newItemId);
//     // access.setLitPass(msg.sender, newItemId, address(this));
//     //_setTokenURI(newItemId, uris[0]);
//     setLit(msg.sender, newItemId, hash);
//     }
   
  
//  // else revert("no mint");
// }
// function calculateTriHash(address user, uint number) public returns(uint) {
//   uint h1 = address(this).hashWith(user);
//   uint h2 = address(this).hashWith(user);
//  // uint h3 = address(this).hashWith(from);
// // (uint64 g, uint64 g2, uint64 g3) = AtropaMath.sortThree(uint64(h1), uint64(h2), uint64(h3));
//   uint hash = AtropaMath.modExp64(uint64(h1), uint64(h2), uint64(number));
//   // int addyBasis = IBase(class).claclBasis(addy, amount);
//   return hash;
// }

//   function setXusd(address _xusd) external onlyOwner {
//     xusd = _xusd;
//   }

//   function setRegistry(address registry) external onlyOwner {
//     access = ClassRegistry(registry);
//   }

//   // function setKey(address user) external  {
//   //  uint hashKey = address(AccessRegistry).hashWith(user);
//   //  uint hash = address(this).hashWith(user);
//   //  if(LitPassHolderReg.Contains(hash)){
   
//   //   LitPassHolder[hash].rank = AccessRegistry.accessors[hashKey].class;
 

//   //  }

//   // }

//   function setPurchaseAmount(uint256 amount) external onlyOwner {
   
//     purchaseAmount = amount;
//   }


//   function transferFrom(
//     address from,
//     address to,
//     uint tokenId
//   ) public virtual override(ERC721, IERC721) {
   

//     setLitTransfer(from, to, tokenId);
//     safeTransferFrom(from, to, tokenId);

   
//   }


//   function setLitTransfer(address from, address to, uint id) internal {
//     uint256 hashId = address(this).hashWithId(id);
//     uint256 hashU = address(this).hashWith(from);
//     uint256 hashT = address(this).hashWith(to);
//     if(_LitPass.Contains(hashId)){



//         if(!(LitPassHolder[hashU].owner == from)){    
//             revert UserDoesNotOwnLitPassId();     
//         } 
//         if(LitPassUserIndex[to]){
//             revert LitPassCanOnlyHoldOne();
//         } 
//         LitPassHolderReg.Remove(hashU);
//         LitPassHolderReg.Register(hashT);
//         NFTRegistry[hashId].owner = to;        
//         LitPassHolder[hashT].tokenId = NFTRegistry[hashId].id;
//         LitPassHolder[hashId].tokenId = 0;
//         LitPassHolder[hashId].owner = address(0);
//         LitPassHolder[hashT].tokenId = id;
//         LitPassHolder[hashT].owner = to;
//         LitPassTokenIdIndex[from] = 0; 
//         LitPassTokenIdIndex[to] = id; 
//         LitPassUserIndex[to] = true;
//         LitPassUserIndex[from] = false;
//     }
//     else revert LitPassNonExistant();

// }

// function setLit(address user, uint id, uint hash) internal {
//     uint256 hashId = address(this).hashWithId((id));


  

//         LitPassHolderReg.Register(hash);
//         NFTRegistry[hashId].id = id;
//         NFTRegistry[hashId].owner = user;
//         LitPassHolder[hashId].purchaseBurnAmount = IXUSD(xusd).burnBalance(NFTRegistry[hashId].owner);
//         NFTRegistry[hashId].ownerBurn = IXUSD(xusd).burnBalance(NFTRegistry[hashId].owner);
//         LitPassHolder[hashId].tokenId = NFTRegistry[hashId].id;       
//         LitPassTokenIdIndex[user] = id; 
//         LitPassHolder[hashId].url = uris[0];       
//         LitPassUserIndex[user] = true;  

// }

  




//   function hasLitPass(address user ) external  returns (bool) {
 


//     return getOwner(getIdFromOwner(user)) == user;
//   }

//   function calculateRank()external {
//     for(uint i; i < LitPassHolderReg.Count(); i++){

//       getUserBurns(LitPassHolder[LitPassHolderReg.GetHashByIndex(i)].owner);

//     }
//     sort();
  
//   }

//   function getUserList()external returns(KingList[] memory) {
//     KingList[] memory kings = new KingList[](LitPassHolderReg.Count());
//     for(uint i; i < LitPassHolderReg.Count(); i++){

//       kings[i].owner =  LitPassHolder[LitPassHolderReg.GetHashByIndex(i)].owner;
//       kings[i].burnAmount =  LitPassHolder[LitPassHolderReg.GetHashByIndex(i)].burnAmount;
//       kings[i].tokenId =  LitPassHolder[LitPassHolderReg.GetHashByIndex(i)].tokenId;
//       kings[i].userName =  LitPassHolder[LitPassHolderReg.GetHashByIndex(i)].userName;
     

//     }
//   return kings;
  
//   }

//   function getOwner(uint tokenId) public  returns (address) {
//     uint256 hash = address(this).hashWithId(tokenId);
 
//     return NFTRegistry[hash].owner;
//   }

//   function getIdFromOwner(address user) public view returns (uint) {
   
//     return LitPassTokenIdIndex[user];
//   }

//   function getUserBurns(address user) public {
//     uint256 hash = address(this).hashWith(user);
//     LitPassHolder[hash].burnAmount =  IXUSD(xusd).burnBalance(LitPassHolder[hash].owner) -  LitPassHolder[hash].purchaseBurnAmount;
//   }

//     function sort() public   {
//       uint256 length = LitPassHolderReg.Count();

//       // Bubble Sort algorithm
//       for (uint256 i = 0; i < length; i++) {
//           for (uint256 j = 0; j < length - i - 1; j++) {
//               if (LitPassHolder[LitPassHolderReg.GetHashByIndex(j)].burnAmount > LitPassHolder[LitPassHolderReg.GetHashByIndex(j + 1)].burnAmount) {
//                   // Swap elements
//                   uint256 temp = LitPassHolder[LitPassHolderReg.GetHashByIndex(j)].burnAmount;
//                   LitPassHolder[LitPassHolderReg.GetHashByIndex(j)].burnAmount = LitPassHolder[LitPassHolderReg.GetHashByIndex(j+1)].burnAmount;
//                   LitPassHolder[LitPassHolderReg.GetHashByIndex(j+1)].burnAmount = temp;
//               }
//           }
//       }

      
//   }

//   function calculateBurn(address user) public  returns (uint) {
//     uint256 hash = address(this).hashWith(user);
//    // uint256 userHash = address(this).hashWith(NFTRegistry[hash].owner);
//     NFTRegistry[hash].ownerBurn = IXUSD(xusd).burnBalance(NFTRegistry[hash].owner);
   
//     return IXUSD(xusd).burnBalance(NFTRegistry[hash].owner);
//   }

//   function getProtocolBurn(address user) public   {
//     uint256 hash = address(this).hashWith(user);
//    // uint256 userHash = address(this).hashWith(NFTRegistry[hash].owner);
//    LitPassHolder[hash].totalBurn = IXUSD(xusd).totalBurned();

//   }

//   function setUserName(address user, string memory userName) public   {
//     uint256 hash = address(this).hashWith(user);
 
//    LitPassHolder[hash].userName = userName;

//   }

//   function viewUserName(address user) public view returns(string memory)   {
//     uint256 hash = address(this).hashWith(user);
 
//    return LitPassHolder[hash].userName;

//   }

//   function viewUserBurns(address user) public view returns(uint)   {
//     uint256 hash = address(this).hashWith(user);
 
//    return LitPassHolder[hash].burnAmount;

//   }


//   function viewTotalBurn(address user) public view returns(uint)   {
//     uint256 hash = address(this).hashWith(user);
 
//    return LitPassHolder[hash].totalBurn;

//   }

//   function viewUrl(address user) public view returns(string memory)   {
//     uint256 hash = address(this).hashWith(user);
 
//    return LitPassHolder[hash].url;

//   }




// function GetNftByIndexHash(uint256 i) public view returns (uint) {
//     uint256 hash = _LitPass.GetHashByIndex(i);       
//     return hash;
// }

// // function turnOnDelegate(uint tokenId) public  {
// //   uint256 hash = address(this).hashWithId(tokenId);   
// //   if(!(NFTRegistry[hash].owner == msg.sender)) revert("not owner");
// //   setDel(tokenId);

 
// // }

// // function turnOffDelegate(uint tokenId) public  returns (uint) {
// //   uint256 hash = address(this).hashWithId(tokenId);   
// //   if(!(NFTRegistry[hash].owner == msg.sender)) revert("not owner");
// //   removeDel(tokenId);

// // }

// // function setDel(uint tokenId)internal {
// //   uint256 hash = address(this).hashWithId(tokenId); 
// //   DelegatePoolReg.Register(hash);

// // }

// // function removeDel(uint tokenId)internal {
// //   uint256 hash = address(this).hashWithId(tokenId); 
// //   DelegatePoolReg.Remove(hash);

// // }
//   /**
//    * @notice Gets the total count of registered classes.
//    * @return The total count of registered classes.
//    */


// //   function ProposedClassRegistryCount() public view returns (uint256) {
// //     return ProposedClasses.Count();
// //   }

//   // function GetClassByIndex(uint256 i) public view returns (Class memory) {
//   //     uint256 hash = ClassRegistryList.GetHashByIndex(i);
//   //     return Classes[hash];
//   // }

//   // function GetProspectClassByIndex(uint256 i) public view returns (ProposedClass memory) {
//   //     uint256 hash = ProposedClasses.GetHashByIndex(i);
//   //     return ProspectClass[hash];
//   // }

//   // function ProposeClass(address dom) public  {
//   //    // require(HasAccess(msg.sender, AccessType.CONGRESS), NotAllowedAccess());
//   // require(HasAccess(msg.sender, AccessType.CONGRESS), "You dont have access to propose a new class");
//   // uint256 hash = address(this).hashWith(dom);
//   // IClassBase(dom).getClassBasis();
//   // IClassBase(dom).getActiveAdd(owner(), address(0), address(0), address(0), 0x23b872dd, 0);
//   // IClassBase(dom).getActiveSub(owner(), address(0), address(0), address(0), 0x23b872dd, 0);

//   // if(ProposedClasses.Contains(hash)){
//   //     revert AlreadyProposed();
//   // }
//   // ProspectClass[hash].classAddress = dom;
//   // ProspectClass[hash].votes = 0;
//   // ProposedClasses.Register(hash);

//   // }

//   // function VoteClass(address dom) public  {
//   //     require(HasAccess(msg.sender, AccessType.USER), "You dont have access to propose a new class");
//   //     require(ClassProposedValid(dom), "Not up for vote");

//   //     uint256 hash = address(this).hashWith(dom);

//   //     ProspectClass[hash].votes += accessValues[Accessors[hash].Class];

//   //     }

//   // function SetClass(address dom) internal {
//   //     uint256 hash = address(this).hashWith(dom);
//   //     if(ClassRegistryList.Contains(hash)) {

//   //     }
//   //     if(HasAccess(msg.sender, AccessType.CONGRESS)) {
//   //         ClassRegistryList.Register(hash);
//   //         Classes[hash].classAddress = dom;
//   //         Classes[hash].basisFee = IClassBase(dom).getClassBasis();

//   //     } else {
//   //         assert(ProspectClass[hash].PassedVote(AccessRegistryCount()));

//   //         delete ProspectClass[hash];
//   //         ProposedClasses.Remove(hash);
//   //         ClassRegistryList.Register(hash);
//   //         Classes[hash].classAddress = dom;
//   //         Classes[hash].basisFee = IClassBase(dom).getClassBasis();

//   //     }
//   // }

//   // /**
//   //  * @notice Removes a class from the registry.
//   //  * @param dom The address of the class.
//   //  */
//   // function RemoveClass(address dom) internal {
//   //     uint256 hash = address(this).hashWith(dom);
//   //     ClassRegistryList.Remove(hash);
//   //     delete Classes[hash];

//   // }
// }
