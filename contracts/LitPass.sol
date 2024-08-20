// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "./registry.sol";
import "./atropamath.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

import "./AccessRegistry.sol";

 //import "./ClassRegistry.sol";


 interface IXUSD {
  function burnBalance(address user) external view returns (uint256);
  function totalBurned()external view returns(uint);
}
contract LitPass is ERC721Enumerable, AccessRegistry {
  using LibRegistry for LibRegistry.Registry;

  using AtropaMath for address;


//  ClassRegistry private access;
 error NotRankedForVibePass();
  error LitPassAlreadyMinted();
  error UserDoesNotOwnLitPassId();
  error LitPassDelegated();
  error LitPassCanOnlyHoldOne();
  error LitPassNonExistant();
  error LitPassNotDelegated();
  error OwnerDoesNotHoldId();


  struct nfts {
  address owner;
  uint burnAmount;
  string userName;
  uint tokenId;
  uint purchaseBurnAmount;
 string url;
 
    
  }



  LibRegistry.Registry private _VibePass;


  mapping(uint => string) internal protocolAlert;
  mapping(uint => mapping(uint => string)) internal protocolMessages;
  mapping(uint => string) internal uris;

    mapping(uint => uint) messageIndex;
  
  mapping(uint => nfts) internal NFTRegistry;
  mapping(address => bool) internal LitPassUserIndex;

  mapping(address => uint160) internal LitPassTokenIdIndex;

  address public xusd;
  address public oneSwap;
  uint public purchaseAmount = 0;
AccessRegistry private accessControl;
  constructor(
    address _oneSwap,
    address classReg

  ) public ERC721(".", ".")  {
    //access = ClassRegistry(classReg);
    oneSwap = _oneSwap;

   
  }

  function mintPass() public {
  // if(access.hasVibes(msg.sender)){
 uint160 newItemId = uint160(_VibePass.Count() + 1);
    uint hash = address(this).hashWith(msg.sender);
  
   //assert(HasAccess(msg.sender, AccessType.PRINCEPS, address(this)));
    // uint hashU = address(this).hashWith(msg.sender);
    IERC20(oneSwap).transferFrom(msg.sender, address(this), purchaseAmount);
    if(!_VibePass.Contains(hash)){
 
    _safeMint(msg.sender, newItemId);
    // access.setLitPass(msg.sender, newItemId, address(this));
    //_setTokenURI(newItemId, uris[0]);
    setLit(msg.sender, newItemId, hash);
    }

  // }
//   else{
    //revert NotRankedForVibePass();
//   }
   
   
  
 // else revert("no mint");
}
   function totalSupply() public view virtual override returns (uint256) {
        return _VibePass.Count();
    }

   function tokenByOwner(address _owner) public  virtual returns (address) {
    uint hash = address(this).hashWith(_owner);
    if(_VibePass.Contains(hash)){
        return NFTRegistry[hash].owner;
    }
    return address(0);

}
  function setXusd(address _xusd) external onlyOwner {
    xusd = _xusd;
  }

  

  function setRegistry(address registry) external onlyOwner {
  //  access = ClassRegistry(registry);
  }


  function setPurchaseAmount(uint256 amount) external onlyOwner {
   
    purchaseAmount = amount;
  }


  function transferFrom(
    address from,
    address to,
    uint tokenId
  ) public virtual override(ERC721, IERC721) {
    //  uint hash = address(access).hashWith(to);
   assert(HasAccess(msg.sender, AccessType.CONSUL, address(this)));
    setLitTransfer(from, to, uint160(tokenId));
    safeTransferFrom(from, to, tokenId);

   
  }


  function setLitTransfer(address from, address to, uint160 id) internal {
   // uint256 hashId = address(this).hashWith();
    uint256 hashU = address(this).hashWith(from);
    uint256 hashT = address(this).hashWith(to);
    if(_VibePass.Contains(hashU)){



        if(!(NFTRegistry[hashU].owner == from)){    
            revert UserDoesNotOwnLitPassId();     
        } 
        if(LitPassUserIndex[to]){
            revert LitPassCanOnlyHoldOne();
        } 
        if(NFTRegistry[hashU].tokenId != id){
            revert OwnerDoesNotHoldId();
        } 
        _VibePass.Remove(hashU);
        _VibePass.Register(hashT);
        NFTRegistry[hashT].owner = to;     
        NFTRegistry[hashU].tokenId = 0;
        NFTRegistry[hashU].owner = address(0);
        NFTRegistry[hashT].tokenId = id;
        NFTRegistry[hashT].owner = to;
        LitPassTokenIdIndex[from] = 0; 
        LitPassTokenIdIndex[to] = id; 
    //     LitPassUserIndex[to] = true;
    //     LitPassUserIndex[from] = false;
    }
    else revert LitPassNonExistant();

}

function setLit(address user, uint160 id, uint hash) internal {
    uint256 hashId = address(this).hashWith(user);
//console.logUint(hashId);

  

        _VibePass.Register(hashId);
        NFTRegistry[hashId].tokenId = id;

        NFTRegistry[hashId].owner = user;
        NFTRegistry[hashId].purchaseBurnAmount = IXUSD(xusd).burnBalance(user);
      //  console.log(IXUSD(xusd).burnBalance(NFTRegistry[hashId].owner));
        NFTRegistry[hashId].burnAmount = IXUSD(xusd).burnBalance(NFTRegistry[hashId].owner);
    
        LitPassUserIndex[user] = true;  

}

  



  









  function viewUrl(address user) public  returns(string memory)   {
    uint256 hash = address(this).hashWith(user);
 
   return NFTRegistry[hash].url;

  }




function GetNftByIndexHash(uint256 i) public view returns (uint) {
    uint256 hash = _VibePass.GetHashByIndex(i);       
    return hash;
}

}
