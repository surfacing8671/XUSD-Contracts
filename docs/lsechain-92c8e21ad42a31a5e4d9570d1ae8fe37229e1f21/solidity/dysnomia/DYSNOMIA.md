# DYSNOMIA









## Methods

### GetMarketRate

```solidity
function GetMarketRate(address _a) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _a | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### MotzkinPrime

```solidity
function MotzkinPrime() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### Purchase

```solidity
function Purchase(address _t, uint256 _a) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _t | address | undefined |
| _a | uint256 | undefined |

### Redeem

```solidity
function Redeem(address _t, uint256 _a) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _t | address | undefined |
| _a | uint256 | undefined |

### Rename

```solidity
function Rename(string newName, string newSymbol) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newName | string | undefined |
| newSymbol | string | undefined |

### Xiao

```solidity
function Xiao() external view returns (contract atropaMath)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract atropaMath | undefined |

### addOwner

```solidity
function addOwner(address newOwner) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner | address | undefined |

### allowance

```solidity
function allowance(address owner, address spender) external view returns (uint256)
```





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
function approve(address spender, uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### balanceOf

```solidity
function balanceOf(address account) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### decimals

```solidity
function decimals() external view returns (uint8)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint8 | undefined |

### maxSupply

```solidity
function maxSupply() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### mintToCap

```solidity
function mintToCap() external nonpayable
```






### name

```solidity
function name() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### owner

```solidity
function owner(address cOwner) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| cOwner | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### renounceOwnership

```solidity
function renounceOwnership(address toRemove) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| toRemove | address | undefined |

### symbol

```solidity
function symbol() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### transfer

```solidity
function transfer(address to, uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 value) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |



## Events

### Approval

```solidity
event Approval(address indexed owner, address indexed spender, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| spender `indexed` | address | undefined |
| value  | uint256 | undefined |

### OwnershipUpdate

```solidity
event OwnershipUpdate(address indexed newOwner, bool indexed state)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner `indexed` | address | undefined |
| state `indexed` | bool | undefined |

### Transfer

```solidity
event Transfer(address indexed from, address indexed to, uint256 value)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from `indexed` | address | undefined |
| to `indexed` | address | undefined |
| value  | uint256 | undefined |



## Errors

### DysnomiaInsufficientAllowance

```solidity
error DysnomiaInsufficientAllowance(address origin, address sender, address owner, address spender, address what, uint256 allowance, uint256 needed)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| origin | address | undefined |
| sender | address | undefined |
| owner | address | undefined |
| spender | address | undefined |
| what | address | undefined |
| allowance | uint256 | undefined |
| needed | uint256 | undefined |

### DysnomiaInsufficientBalance

```solidity
error DysnomiaInsufficientBalance(address origin, address sender, address from, address to, address what, uint256 balance, uint256 needed)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| origin | address | undefined |
| sender | address | undefined |
| from | address | undefined |
| to | address | undefined |
| what | address | undefined |
| balance | uint256 | undefined |
| needed | uint256 | undefined |

### MarketRateNotFound

```solidity
error MarketRateNotFound(address asset)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| asset | address | undefined |

### OwnableInvalidOwner

```solidity
error OwnableInvalidOwner(address origin, address owner, address what)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| origin | address | undefined |
| owner | address | undefined |
| what | address | undefined |

### OwnableUnauthorizedAccount

```solidity
error OwnableUnauthorizedAccount(address origin, address account, address what)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| origin | address | undefined |
| account | address | undefined |
| what | address | undefined |


