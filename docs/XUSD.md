# XUSD



> MyTokenMock



*A mock token contract inheriting ERC20Taxable with voting and delegate functionalities.*

## Methods

### Rewardtransfer

```solidity
function Rewardtransfer(address to, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### addWhitelistedContract

```solidity
function addWhitelistedContract(address contractAddr) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| contractAddr | address | undefined |

### allowance

```solidity
function allowance(address owner, address spender) external view returns (uint256)
```



*Returns the remaining number of tokens that `spender` will be allowed to spend on behalf of `owner` through {transferFrom}. This is zero by default. This value changes when {approve} or {transferFrom} are called.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |
| spender | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### approve

```solidity
function approve(address spender, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### assignRank

```solidity
function assignRank(address account, enum HierarchicalAccessControl.Rank rank) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| rank | enum HierarchicalAccessControl.Rank | undefined |

### balanceOf

```solidity
function balanceOf(address account) external view returns (uint256)
```



*Returns the value of tokens owned by `account`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### burnAddress

```solidity
function burnAddress() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### burnBalance

```solidity
function burnBalance(address user) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### decimals

```solidity
function decimals() external view returns (uint8)
```



*Returns the decimals places of the token.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint8 | undefined |

### decreaseAllowance

```solidity
function decreaseAllowance(address spender, uint256 subtractedValue) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| subtractedValue | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### delegate

```solidity
function delegate(address delegatee) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| delegatee | address | undefined |

### downgradeRank

```solidity
function downgradeRank(address account) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### feeBasisPoints

```solidity
function feeBasisPoints() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### feeRecipient

```solidity
function feeRecipient() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### getRank

```solidity
function getRank(address account) external view returns (enum HierarchicalAccessControl.Rank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum HierarchicalAccessControl.Rank | undefined |

### getTaxAddress

```solidity
function getTaxAddress() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### getTaxRate

```solidity
function getTaxRate() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getVotes

```solidity
function getVotes(address account) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getVotesContracts

```solidity
function getVotesContracts(address account) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### hasRank

```solidity
function hasRank(enum HierarchicalAccessControl.Rank requiredRank, address account) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| requiredRank | enum HierarchicalAccessControl.Rank | undefined |
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### increaseAllowance

```solidity
function increaseAllowance(address spender, uint256 addedValue) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| addedValue | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### isExcludedFromTax

```solidity
function isExcludedFromTax(address account) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### isWhitelistedContract

```solidity
function isWhitelistedContract(address contractAddr) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| contractAddr | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### mint

```solidity
function mint(address to, uint256 amount) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| amount | uint256 | undefined |

### name

```solidity
function name() external view returns (string)
```



*Returns the name of the token.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### registry

```solidity
function registry() external view returns (contract ClassRegistry)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract ClassRegistry | undefined |

### registryBurn

```solidity
function registryBurn(address account, uint256 amount) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| amount | uint256 | undefined |

### removeWhitelistedContract

```solidity
function removeWhitelistedContract(address contractAddr) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| contractAddr | address | undefined |

### revokeRank

```solidity
function revokeRank(address account) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### setRegistry

```solidity
function setRegistry(address reg) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| reg | address | undefined |

### symbol

```solidity
function symbol() external view returns (string)
```



*Returns the symbol of the token.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### totalBurned

```solidity
function totalBurned() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```



*Returns the value of tokens in existence.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### transfer

```solidity
function transfer(address to, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### upgradeRank

```solidity
function upgradeRank(address account) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### whitelistBurn

```solidity
function whitelistBurn(address account, uint256 amount) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| amount | uint256 | undefined |



## Events

### Approval

```solidity
event Approval(address indexed owner, address indexed spender, uint256 value)
```



*Emitted when the allowance of a `spender` for an `owner` is set by a call to {approve}. `value` is the new allowance.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| spender `indexed` | address | undefined |
| value  | uint256 | undefined |

### DelegateChanged

```solidity
event DelegateChanged(address indexed delegator, address indexed fromDelegate, address indexed toDelegate)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| delegator `indexed` | address | undefined |
| fromDelegate `indexed` | address | undefined |
| toDelegate `indexed` | address | undefined |

### DelegateVotesChanged

```solidity
event DelegateVotesChanged(address indexed delegate, uint256 previousVotes, uint256 newVotes)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| delegate `indexed` | address | undefined |
| previousVotes  | uint256 | undefined |
| newVotes  | uint256 | undefined |

### RankAssigned

```solidity
event RankAssigned(address indexed account, enum HierarchicalAccessControl.Rank rank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |
| rank  | enum HierarchicalAccessControl.Rank | undefined |

### RankDowngraded

```solidity
event RankDowngraded(address indexed account, enum HierarchicalAccessControl.Rank newRank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |
| newRank  | enum HierarchicalAccessControl.Rank | undefined |

### RankRevoked

```solidity
event RankRevoked(address indexed account)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |

### RankUpgraded

```solidity
event RankUpgraded(address indexed account, enum HierarchicalAccessControl.Rank newRank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |
| newRank  | enum HierarchicalAccessControl.Rank | undefined |

### Transfer

```solidity
event Transfer(address indexed from, address indexed to, uint256 value)
```



*Emitted when `value` tokens are moved from one account (`from`) to another (`to`). Note that `value` may be zero.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from `indexed` | address | undefined |
| to `indexed` | address | undefined |
| value  | uint256 | undefined |

### WhitelistContract

```solidity
event WhitelistContract(address indexed contractAddr, bool status)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| contractAddr `indexed` | address | undefined |
| status  | bool | undefined |



## Errors

### AccessDenied

```solidity
error AccessDenied(address account, enum HierarchicalAccessControl.Rank requiredRank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| requiredRank | enum HierarchicalAccessControl.Rank | undefined |

### InvalidOperation

```solidity
error InvalidOperation(string reason)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| reason | string | undefined |


