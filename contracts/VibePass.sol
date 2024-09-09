// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "./registry.sol";
import "./atropamath.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "./Access.sol";
import "./VibeRegistry.sol";
import "./PriceDecay.sol";
import "./IAccessManager.sol";

interface IXUSD {
    function burnBalance(address user) external view returns (uint256);
    function burnBalanceOrigin(address user) external view returns (uint256);
    function totalBurned() external view returns (uint);
}

/**
 * @title VibePass
 * @dev ERC721 token representing a VibePass, with additional features for handling access control and token burning.
 */
contract VibePass is ERC721Enumerable {
   
    using LibRegistry for LibRegistry.Registry;
    using AtropaMath for address;

    // Custom Events
    event URIUpdated(address indexed user, string newURI);
    event UserNameUpdated(address indexed user, string newUserName);
    event XusdAddressUpdated(address indexed updater, address newXusd);

    // Custom Errors
    error NotRankedForVibePass();
    error VibePassAlreadyMinted();
    error UserDoesNotOwnVibePassId();
    error VibePassDelegated();
    error VibePassCanOnlyHoldOne();
    error VibePassNonExistant();
    error VibePassNotDelegated();
    error OwnerDoesNotHoldId();

    // Structs to hold NFT details
    struct Nft {
        address owner;
        address holder;
        string userName;
        uint tokenId;
        uint purchaseBurnAmount;
        uint purchaseBurnAmountOrigin;
        string url;
    }

    struct UserNft {
        address owner;
        uint tokenId;
        bool active;
    }

    // State variables
    LibRegistry.Registry private _VibePass;
    mapping(uint => Nft) internal NFTRegistry;
    mapping(address => UserNft) internal VibePassUserIndex;
        mapping(address => uint256) private _votes;
    mapping(address => uint) internal VibePassTokenIdIndex;
    mapping(address => uint) internal VibePassTokenIdOwners;
    VibeRegistry public VibReg;
    int internal gladiator = 350;
    address public xusd;
    address public oneSwap;
    PriceSlowDecay public pDecay;
    uint public purchaseAmount;
IAccessManager public accessControl;

 uint256 private locked = 1;

    modifier nonReentrant() virtual {
        require(locked == 1, "REENTRANCY");

        locked = 2;

        _;

        locked = 1;
    }


  
    /**
     * @dev Restricts access to GLADIATOR role or higher.
     */
       modifier onlyGladiator() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.GLADIATOR), "Access Restricted");
        _;
    }

    modifier onlySenator() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.SENATOR), "Access Restricted");
        _;
    }

    modifier onlyConsul() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.CONSUL), "Access Restricted");
        _;
    }
    constructor(
        address _oneSwap,
        address security,
        address _xusd,
        address _priceDecay,
        address vibes
    ) ERC721("", "")  // Pass token name and symbol to ERC721
  {
       accessControl = IAccessManager(security);
        oneSwap = _oneSwap;
        xusd = _xusd;
        pDecay = PriceSlowDecay(_priceDecay);
        VibReg = VibeRegistry(vibes);
    }



 /// @notice Set the gladiator rank required for VibePass minting
    /// @param vibes Minimum vibes required for gladiator rank
    function setGladiator(int vibes) external onlyConsul {

        gladiator = vibes;
    }

    /// @notice Check if a user qualifies for the gladiator rank and update rank if needed
    function checkRank() external {
        if (VibReg.viewVibes(msg.sender) < gladiator && VibReg.viewVibes(msg.sender) > 0) {
        
                accessControl.grantRole(                  
                    msg.sender,
                      IAccessManager.Rank.GLADIATOR
                );
         
        }
    }
 
    /// @notice Mint a new VibePass NFT for the caller if they meet the required rank
    function mintPass() public nonReentrant  {
        if(VibePassTokenIdOwners[msg.sender] != 0){
            revert VibePassCanOnlyHoldOne();
        }
       if (VibReg.viewVibes(msg.sender) < gladiator && VibReg.viewVibes(msg.sender) > 0) {

        uint160 newItemId = uint160(_VibePass.Count() + 1);

        if (!_VibePass.Contains(newItemId)) {
            _registerPass(msg.sender, newItemId); // Register before external call
            bool success = IERC20(oneSwap).transferFrom(
                msg.sender,
                address(this),
                pDecay.getCurrentPrice()
            );
            require(success, "Transfer failed");
            _safeMint(msg.sender, newItemId);
        } else {
            revert VibePassAlreadyMinted();
        }
    }

    else {
        revert NotRankedForVibePass();
    }
    }

    /// @notice Withdraw funds from oneSwap contract
    function withdrawOneswap() external onlyConsul {
        
        IERC20(oneSwap).transfer(msg.sender, IERC20(oneSwap).balanceOf(address(this)));
    }

    /// @notice Set the URI for a VibePass holder
    /// @param user The address of the user whose URI is being updated
    /// @param Url The new URI
    function setURI(address user, string memory Url) public virtual onlyConsul {
      
        require(bytes(Url).length > 0 && bytes(Url).length <= 256, "Invalid URI");
        if (_VibePass.Contains(VibePassTokenIdIndex[user])) {
            NFTRegistry[VibePassTokenIdIndex[user]].url = Url;
            emit URIUpdated(user, Url);
        }
    }
function setUserName(string memory userName) public virtual {
    require(bytes(userName).length > 0 && bytes(userName).length <= 50, "Invalid username");
    if (_VibePass.Contains(VibePassTokenIdIndex[msg.sender])) {
        NFTRegistry[VibePassTokenIdIndex[msg.sender]].userName = userName;
         emit UserNameUpdated(msg.sender, userName);
    }
}

    function getUsername(address user) external view returns (string memory) {
        if (_VibePass.Contains(VibePassTokenIdIndex[user])) {
            return NFTRegistry[VibePassTokenIdIndex[user]].userName;
        }
        return "NO USERNAME";
    }



    /// @notice Get the URI of the specified token ID
    /// @param tokenId The ID of the token to get the URI for
    /// @return The URI of the specified token ID
    function tokenURI(
        uint256 tokenId
    ) public view virtual override returns (string memory) {
        _requireOwned(tokenId);

        if (_VibePass.Contains(tokenId)) {
            string memory baseURI = NFTRegistry[tokenId].url;
            return bytes(baseURI).length > 0 ? baseURI : "";
        }
        return "";
    }

   

    /// @notice Set the address of the XUSD token
    /// @param _xusd The new XUSD token address
    function setXusd(address _xusd) external onlyConsul{
        
        xusd = _xusd;
        emit XusdAddressUpdated(msg.sender, _xusd);
    }


    function UserUpdate(address user) external {
        if (_VibePass.Contains(VibePassTokenIdIndex[user])) {
            _votes[user] =
                IXUSD(xusd).burnBalance(user) -
                NFTRegistry[VibePassTokenIdIndex[user]].purchaseBurnAmount;
        }
    }


    /// @notice Transfers the VibePass from one user to another
    /// @param from The address of the current owner
    /// @param to The address of the new owner
    /// @param tokenId The token ID to transfer
    function transferFrom(
        address from,
        address to,
        uint tokenId
    ) public virtual override(ERC721, IERC721) onlyConsul {
 
        _transferVibePass(from, to, tokenId);
    }

    /// @notice Safely transfers the VibePass from one user to another
    /// @param from The address of the current owner
    /// @param to The address of the new owner
    /// @param tokenId The token ID to transfer
    /// @param data Additional data for the transfer
    function safeTransferFrom(
        address from,
        address to,
        uint tokenId,
        bytes memory data
    ) public virtual override(ERC721, IERC721)onlyConsul {
 
        _transferVibePass(from, to, tokenId);
        super.safeTransferFrom(from, to, tokenId, data);
    }

    /// @notice View the URI associated with a user's VibePass
    /// @param user The address of the user
    /// @return The URI of the user's VibePass
    function viewUrl(address user) public view returns (string memory) {
        if (_VibePass.Contains(VibePassTokenIdIndex[user])) {
            return NFTRegistry[VibePassTokenIdIndex[user]].url;
        }
        return "";
    }

    /// @dev Internal function to register a newly minted VibePass
    /// @param user The address of the user receiving the VibePass
    /// @param id The token ID of the VibePass
    function _registerPass(address user, uint160 id) internal {
        _VibePass.Register(id);
        NFTRegistry[id] = Nft({
            tokenId: id,
            owner: user,
            holder: user,
            purchaseBurnAmount: IXUSD(xusd).burnBalance(user),
            purchaseBurnAmountOrigin: IXUSD(xusd).burnBalanceOrigin(user),
            userName: "",
            url: ""
        });
        VibePassTokenIdOwners[user] = id;
        VibePassTokenIdIndex[user] = id;
    }

    /// @dev Internal function to transfer a VibePass from one user to another
    /// @param from The address of the current owner
    /// @param to The address of the new owner
    /// @param tokenId The token ID to transfer
    function _transferVibePass(
        address from,
        address to,
        uint tokenId
    ) internal {
        VibePassTokenIdIndex[from] = 0;
        VibePassTokenIdIndex[to] = tokenId;
        NFTRegistry[tokenId].holder = to;
        super.transferFrom(from, to, tokenId);
    }



    function tokenOwnerFromId(uint id) public view returns (address) {
   
    return NFTRegistry[id].owner;
}

    function tokenIdByOwner(address _owner) public view returns (uint) {
    uint tokenId = VibePassTokenIdOwners[_owner];
    require(tokenId != 0, "Token ID not found");
    return tokenId;
}

function getBurnAmounts(
    uint id
) public view virtual returns (uint256) {
    require(NFTRegistry[id].owner != address(0), "Id does not Exist");
    return
        IXUSD(xusd).burnBalance(NFTRegistry[id].owner) -
        NFTRegistry[id].purchaseBurnAmount;
}

function getBurnAmountsOrigin(
    uint id
) public view virtual returns (uint256) {
   require(NFTRegistry[id].owner != address(0), "Id does not Exist");
    return
        IXUSD(xusd).burnBalanceOrigin(NFTRegistry[id].owner) -
        NFTRegistry[id].purchaseBurnAmountOrigin;
}

  

}
