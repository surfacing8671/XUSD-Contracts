# AccessRegistry









## Methods

### AccessIsClass

```solidity
function AccessIsClass(address user, address dom, enum AccessRegistry.AccessType class) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| dom | address | undefined |
| class | enum AccessRegistry.AccessType | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### AccessRegistryCount

```solidity
function AccessRegistryCount() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### GetAccess

```solidity
function GetAccess(address user, address dom) external view returns (struct AccessRegistry.Accessor)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| dom | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | AccessRegistry.Accessor | undefined |

### GetAccessByIndex

```solidity
function GetAccessByIndex(uint256 i) external view returns (struct AccessRegistry.Accessor)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| i | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | AccessRegistry.Accessor | undefined |

### HasAccess

```solidity
function HasAccess(address user, enum AccessRegistry.AccessType min, address dom) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| min | enum AccessRegistry.AccessType | undefined |
| dom | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### RegisterAccess

```solidity
function RegisterAccess(address addr, enum AccessRegistry.AccessType class, address dom) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| addr | address | undefined |
| class | enum AccessRegistry.AccessType | undefined |
| dom | address | undefined |

### RemoveAccess

```solidity
function RemoveAccess(address user, address dom) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| dom | address | undefined |

### owner

```solidity
function owner() external view returns (address)
```



*Returns the address of the current owner.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### renounceOwnership

```solidity
function renounceOwnership() external nonpayable
```



*Leaves the contract without owner. It will not be possible to call `onlyOwner` functions. Can only be called by the current owner. NOTE: Renouncing ownership will leave the contract without an owner, thereby disabling any functionality that is only available to the owner.*


### transferOwnership

```solidity
function transferOwnership(address newOwner) external nonpayable
```



*Transfers ownership of the contract to a new account (`newOwner`). Can only be called by the current owner.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner | address | undefined |



## Events

### OwnershipTransferred

```solidity
event OwnershipTransferred(address indexed previousOwner, address indexed newOwner)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| previousOwner `indexed` | address | undefined |
| newOwner `indexed` | address | undefined |



## Errors

### OwnableInvalidOwner

```solidity
error OwnableInvalidOwner(address owner)
```



*The owner is not a valid owner account. (eg. `address(0)`)*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |

### OwnableUnauthorizedAccount

```solidity
error OwnableUnauthorizedAccount(address account)
```



*The caller account is not authorized to perform an operation.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |


