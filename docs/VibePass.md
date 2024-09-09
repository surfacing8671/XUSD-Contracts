# VibePass



> VibePass



*ERC721 token representing a VibePass, with additional features for handling access control and token burning.*

## Methods

### UserUpdate

```solidity
function UserUpdate(address user) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

### VibReg

```solidity
function VibReg() external view returns (contract VibeRegistry)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract VibeRegistry | undefined |

### accessControl

```solidity
function accessControl() external view returns (contract IAccessManager)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract IAccessManager | undefined |

### approve

```solidity
function approve(address to, uint256 tokenId) external nonpayable
```



*See {IERC721-approve}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| tokenId | uint256 | undefined |

### balanceOf

```solidity
function balanceOf(address owner) external view returns (uint256)
```



*See {IERC721-balanceOf}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### checkRank

```solidity
function checkRank() external nonpayable
```

Check if a user qualifies for the gladiator rank and update rank if needed




### getApproved

```solidity
function getApproved(uint256 tokenId) external view returns (address)
```



*See {IERC721-getApproved}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| tokenId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### getBurnAmounts

```solidity
function getBurnAmounts(uint256 id) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| id | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getBurnAmountsOrigin

```solidity
function getBurnAmountsOrigin(uint256 id) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| id | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getUsername

```solidity
function getUsername(address user) external view returns (string)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### isApprovedForAll

```solidity
function isApprovedForAll(address owner, address operator) external view returns (bool)
```



*See {IERC721-isApprovedForAll}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |
| operator | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### mintPass

```solidity
function mintPass() external nonpayable
```

Mint a new VibePass NFT for the caller if they meet the required rank




### name

```solidity
function name() external view returns (string)
```



*See {IERC721Metadata-name}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### oneSwap

```solidity
function oneSwap() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### ownerOf

```solidity
function ownerOf(uint256 tokenId) external view returns (address)
```



*See {IERC721-ownerOf}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| tokenId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### pDecay

```solidity
function pDecay() external view returns (contract PriceSlowDecay)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract PriceSlowDecay | undefined |

### purchaseAmount

```solidity
function purchaseAmount() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 tokenId) external nonpayable
```



*See {IERC721-safeTransferFrom}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| tokenId | uint256 | undefined |

### safeTransferFrom

```solidity
function safeTransferFrom(address from, address to, uint256 tokenId, bytes data) external nonpayable
```

Safely transfers the VibePass from one user to another



#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | The address of the current owner |
| to | address | The address of the new owner |
| tokenId | uint256 | The token ID to transfer |
| data | bytes | Additional data for the transfer |

### setApprovalForAll

```solidity
function setApprovalForAll(address operator, bool approved) external nonpayable
```



*See {IERC721-setApprovalForAll}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| operator | address | undefined |
| approved | bool | undefined |

### setGladiator

```solidity
function setGladiator(int256 vibes) external nonpayable
```

Set the gladiator rank required for VibePass minting



#### Parameters

| Name | Type | Description |
|---|---|---|
| vibes | int256 | Minimum vibes required for gladiator rank |

### setURI

```solidity
function setURI(address user, string Url) external nonpayable
```

Set the URI for a VibePass holder



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user whose URI is being updated |
| Url | string | The new URI |

### setUserName

```solidity
function setUserName(string userName) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| userName | string | undefined |

### setXusd

```solidity
function setXusd(address _xusd) external nonpayable
```

Set the address of the XUSD token



#### Parameters

| Name | Type | Description |
|---|---|---|
| _xusd | address | The new XUSD token address |

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```



*See {IERC165-supportsInterface}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| interfaceId | bytes4 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### symbol

```solidity
function symbol() external view returns (string)
```



*See {IERC721Metadata-symbol}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### tokenByIndex

```solidity
function tokenByIndex(uint256 index) external view returns (uint256)
```



*See {IERC721Enumerable-tokenByIndex}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| index | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### tokenIdByOwner

```solidity
function tokenIdByOwner(address _owner) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _owner | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### tokenOfOwnerByIndex

```solidity
function tokenOfOwnerByIndex(address owner, uint256 index) external view returns (uint256)
```



*See {IERC721Enumerable-tokenOfOwnerByIndex}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |
| index | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### tokenOwnerFromId

```solidity
function tokenOwnerFromId(uint256 id) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| id | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### tokenURI

```solidity
function tokenURI(uint256 tokenId) external view returns (string)
```

Get the URI of the specified token ID



#### Parameters

| Name | Type | Description |
|---|---|---|
| tokenId | uint256 | The ID of the token to get the URI for |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | The URI of the specified token ID |

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```



*See {IERC721Enumerable-totalSupply}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 tokenId) external nonpayable
```

Transfers the VibePass from one user to another



#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | The address of the current owner |
| to | address | The address of the new owner |
| tokenId | uint256 | The token ID to transfer |

### viewUrl

```solidity
function viewUrl(address user) external view returns (string)
```

View the URI associated with a user&#39;s VibePass



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | The URI of the user&#39;s VibePass |

### withdrawOneswap

```solidity
function withdrawOneswap() external nonpayable
```

Withdraw funds from oneSwap contract




### xusd

```solidity
function xusd() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |



## Events

### Approval

```solidity
event Approval(address indexed owner, address indexed approved, uint256 indexed tokenId)
```



*Emitted when `owner` enables `approved` to manage the `tokenId` token.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| approved `indexed` | address | undefined |
| tokenId `indexed` | uint256 | undefined |

### ApprovalForAll

```solidity
event ApprovalForAll(address indexed owner, address indexed operator, bool approved)
```



*Emitted when `owner` enables or disables (`approved`) `operator` to manage all of its assets.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| operator `indexed` | address | undefined |
| approved  | bool | undefined |

### Transfer

```solidity
event Transfer(address indexed from, address indexed to, uint256 indexed tokenId)
```



*Emitted when `tokenId` token is transferred from `from` to `to`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from `indexed` | address | undefined |
| to `indexed` | address | undefined |
| tokenId `indexed` | uint256 | undefined |

### URIUpdated

```solidity
event URIUpdated(address indexed user, string newURI)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| newURI  | string | undefined |

### UserNameUpdated

```solidity
event UserNameUpdated(address indexed user, string newUserName)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| newUserName  | string | undefined |

### XusdAddressUpdated

```solidity
event XusdAddressUpdated(address indexed updater, address newXusd)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| updater `indexed` | address | undefined |
| newXusd  | address | undefined |



## Errors

### ERC721EnumerableForbiddenBatchMint

```solidity
error ERC721EnumerableForbiddenBatchMint()
```



*Batch mint is not allowed.*


### ERC721IncorrectOwner

```solidity
error ERC721IncorrectOwner(address sender, uint256 tokenId, address owner)
```



*Indicates an error related to the ownership over a particular token. Used in transfers.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | Address whose tokens are being transferred. |
| tokenId | uint256 | Identifier number of a token. |
| owner | address | Address of the current owner of a token. |

### ERC721InsufficientApproval

```solidity
error ERC721InsufficientApproval(address operator, uint256 tokenId)
```



*Indicates a failure with the `operator`’s approval. Used in transfers.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| operator | address | Address that may be allowed to operate on tokens without being their owner. |
| tokenId | uint256 | Identifier number of a token. |

### ERC721InvalidApprover

```solidity
error ERC721InvalidApprover(address approver)
```



*Indicates a failure with the `approver` of a token to be approved. Used in approvals.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| approver | address | Address initiating an approval operation. |

### ERC721InvalidOperator

```solidity
error ERC721InvalidOperator(address operator)
```



*Indicates a failure with the `operator` to be approved. Used in approvals.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| operator | address | Address that may be allowed to operate on tokens without being their owner. |

### ERC721InvalidOwner

```solidity
error ERC721InvalidOwner(address owner)
```



*Indicates that an address can&#39;t be an owner. For example, `address(0)` is a forbidden owner in EIP-20. Used in balance queries.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | Address of the current owner of a token. |

### ERC721InvalidReceiver

```solidity
error ERC721InvalidReceiver(address receiver)
```



*Indicates a failure with the token `receiver`. Used in transfers.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| receiver | address | Address to which tokens are being transferred. |

### ERC721InvalidSender

```solidity
error ERC721InvalidSender(address sender)
```



*Indicates a failure with the token `sender`. Used in transfers.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | Address whose tokens are being transferred. |

### ERC721NonexistentToken

```solidity
error ERC721NonexistentToken(uint256 tokenId)
```



*Indicates a `tokenId` whose `owner` is the zero address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| tokenId | uint256 | Identifier number of a token. |

### ERC721OutOfBoundsIndex

```solidity
error ERC721OutOfBoundsIndex(address owner, uint256 index)
```



*An `owner`&#39;s token query was out of bounds for `index`. NOTE: The owner being `address(0)` indicates a global out of bounds index.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |
| index | uint256 | undefined |

### NotRankedForVibePass

```solidity
error NotRankedForVibePass()
```






### OwnerDoesNotHoldId

```solidity
error OwnerDoesNotHoldId()
```






### UserDoesNotOwnVibePassId

```solidity
error UserDoesNotOwnVibePassId()
```






### VibePassAlreadyMinted

```solidity
error VibePassAlreadyMinted()
```






### VibePassCanOnlyHoldOne

```solidity
error VibePassCanOnlyHoldOne()
```






### VibePassDelegated

```solidity
error VibePassDelegated()
```






### VibePassNonExistant

```solidity
error VibePassNonExistant()
```






### VibePassNotDelegated

```solidity
error VibePassNotDelegated()
```







