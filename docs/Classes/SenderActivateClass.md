# SenderActivateClass



> AddSubSigActiveClass



*This contract extends the BaseClass and adds functionality for managing activation status based on function signatures.*

## Methods

### UserActiveList

```solidity
function UserActiveList(uint256) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### addSender

```solidity
function addSender(uint256) external view returns (bool)
```



*Mapping to keep track of add signatures for each contract address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### addSenderAdd

```solidity
function addSenderAdd(address sender) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | undefined |

### addSenderSub

```solidity
function addSenderSub(address sender) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | undefined |

### blockUserClassAdd

```solidity
function blockUserClassAdd(uint256, address) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |
| _1 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### blockUserClassSub

```solidity
function blockUserClassSub(uint256, address) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |
| _1 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### blockUserFromApplyingClass

```solidity
function blockUserFromApplyingClass(address user, address sender) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| sender | address | undefined |

### blockUserFromApplyingSubClass

```solidity
function blockUserFromApplyingSubClass(address user, address sender) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| sender | address | undefined |

### classBasis

```solidity
function classBasis() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### classRegistry

```solidity
function classRegistry() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### classType

```solidity
function classType() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### deleteSenderAdd

```solidity
function deleteSenderAdd(address sender) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | undefined |

### deleteSenderSub

```solidity
function deleteSenderSub(address sender) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | undefined |

### getActiveAdd

```solidity
function getActiveAdd(address user, address to, address from, address sender, bytes4 sig, uint256 amount) external nonpayable returns (bool)
```

Sets the active status of a user based on function signatures.

*This function can only be called by the class registry.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user. |
| to | address | The address of the recipient. |
| from | address | The address of the sender. |
| sender | address | The address of the original sender. |
| sig | bytes4 | The function signature. |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | True if the user is active, false otherwise. |

### getActiveSub

```solidity
function getActiveSub(address user, address to, address from, address sender, bytes4 sig, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| to | address | undefined |
| from | address | undefined |
| sender | address | undefined |
| sig | bytes4 | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### getClassBasis

```solidity
function getClassBasis() external view returns (int256)
```

Gets the class basis fee.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | The class basis fee. |

### getClassType

```solidity
function getClassType() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### letUserFromApplyingClass

```solidity
function letUserFromApplyingClass(address user, address sender) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| sender | address | undefined |

### letUserFromApplyingSubClass

```solidity
function letUserFromApplyingSubClass(address user, address sender) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| sender | address | undefined |

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



*Leaves the contract without owner. It will not be possible to call `onlyOwner` functions anymore. Can only be called by the current owner. NOTE: Renouncing ownership will leave the contract without an owner, thereby removing any functionality that is only available to the owner.*


### subSender

```solidity
function subSender(uint256) external view returns (bool)
```



*Mapping to keep track of subtract signatures for each contract address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### transferOwnership

```solidity
function transferOwnership(address newOwner) external nonpayable
```



*Transfers ownership of the contract to a new account (`newOwner`). Can only be called by the current owner.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner | address | undefined |

### updateClassRegistry

```solidity
function updateClassRegistry(address registry) external nonpayable
```

Updates the class registry address.



#### Parameters

| Name | Type | Description |
|---|---|---|
| registry | address | The new class registry address. |



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



