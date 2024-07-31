# UserClassRegistry



> UserClassRegistry



*Abstract contract for managing user classes and their active statuses. This contract provides functionalities for registering, validating, and managing user classes.*

## Methods

### GetUserByIndex

```solidity
function GetUserByIndex(uint256 i) external view returns (struct UserClassRegistry.UserWithClass)
```

Gets the details of a user by index.



#### Parameters

| Name | Type | Description |
|---|---|---|
| i | uint256 | The index of the user. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | UserClassRegistry.UserWithClass | The user&#39;s class details. |

### GetUserClass

```solidity
function GetUserClass(address user, address dom) external view returns (struct UserClassRegistry.UserWithClass)
```

Gets the details of a user&#39;s class.



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user. |
| dom | address | The address of the class. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | UserClassRegistry.UserWithClass | The user&#39;s class details. |

### HasUserClass

```solidity
function HasUserClass(address user, address dom) external view returns (bool)
```

Checks if a user has an active specific class.



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user. |
| dom | address | The address of the class. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | True if the user has the active class, false otherwise. |

### RegisterUserClass

```solidity
function RegisterUserClass(address user, address dom, bool active) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| dom | address | undefined |
| active | bool | undefined |

### UserRegistryCount

```solidity
function UserRegistryCount() external view returns (uint256)
```

Gets the total count of registered users.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | The total count of registered users. |

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



