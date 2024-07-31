# ClassRegistry



> UserClassRegistry



*Abstract contract for managing user classes and their active statuses. This contract provides functionalities for registering, validating, and managing user classes.*

## Methods

### ClassRegistryCount

```solidity
function ClassRegistryCount() external view returns (uint256)
```

Gets the total count of registered classes.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | The total count of registered classes. |

### ClassValid

```solidity
function ClassValid(address dom) external view returns (bool)
```

Checks if a given class is valid.



#### Parameters

| Name | Type | Description |
|---|---|---|
| dom | address | The address of the class. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | True if the class is valid, false otherwise. |

### GetClassByIndex

```solidity
function GetClassByIndex(uint256 i) external view returns (struct ClassRegistry.Class)
```

Gets the details of a class by index.



#### Parameters

| Name | Type | Description |
|---|---|---|
| i | uint256 | The index of the class. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | ClassRegistry.Class | The class details. |

### HasAccess

```solidity
function HasAccess(address user, enum ClassRegistry.ClassType min, address dom) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| min | enum ClassRegistry.ClassType | undefined |
| dom | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### RegisterClass

```solidity
function RegisterClass(address dom) external nonpayable
```

Registers a class.



#### Parameters

| Name | Type | Description |
|---|---|---|
| dom | address | The address of the class. |

### getBasis

```solidity
function getBasis(address dom) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| dom | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### getClass

```solidity
function getClass(address dom) external view returns (struct ClassRegistry.Class)
```

Retrieves class details for a given address.



#### Parameters

| Name | Type | Description |
|---|---|---|
| dom | address | The address of the class. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | ClassRegistry.Class | The class details. |

### getClassType

```solidity
function getClassType(address dom) external view returns (enum ClassRegistry.ClassType)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| dom | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum ClassRegistry.ClassType | undefined |

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



