# TUSDRegistry



> TUSDRegistry



*This contract manages fee structures for different classes and their functions, allowing for user and class registration, as well as fee retrieval and updates.*

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

### RegisterClass

```solidity
function RegisterClass(address dom) external nonpayable
```

Registers a class.



#### Parameters

| Name | Type | Description |
|---|---|---|
| dom | address | The address of the class. |

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

### XUSD

```solidity
function XUSD() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### addClass

```solidity
function addClass(address class) external nonpayable
```

Adds a new class contract address to the registry.



#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | The address of the class contract. |

### addUser

```solidity
function addUser(address user) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

### burn

```solidity
function burn() external view returns (address)
```

Address used for burning




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### classes

```solidity
function classes(uint256) external view returns (address classAddress, enum ClassRegistry.ClassType classType, int256 basisFee)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| classType | enum ClassRegistry.ClassType | undefined |
| basisFee | int256 | undefined |

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

### getUserClasses

```solidity
function getUserClasses(address user) external view returns (address[])
```

Gets the classes associated with a user.



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address[] | An array of class addresses. |

### owner

```solidity
function owner() external view returns (address)
```



*Returns the address of the current owner.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### processTransaction

```solidity
function processTransaction(address caller, address to, address from, bytes4 selector, address sender, uint256 amount) external nonpayable returns (int256)
```

Processes a transaction and calculates the total basis fee.



#### Parameters

| Name | Type | Description |
|---|---|---|
| caller | address | The address of the caller. |
| to | address | The recipient address. |
| from | address | The sender address. |
| selector | bytes4 | The function selector. |
| sender | address | The sender address. |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | The total basis fee or a default fee if no fee is applicable. |

### renounceOwnership

```solidity
function renounceOwnership() external nonpayable
```



*Leaves the contract without owner. It will not be possible to call `onlyOwner` functions anymore. Can only be called by the current owner. NOTE: Renouncing ownership will leave the contract without an owner, thereby removing any functionality that is only available to the owner.*


### returnFunctionSelectorFromSignature

```solidity
function returnFunctionSelectorFromSignature(string functionName) external pure returns (bytes4)
```

Public function to convert a function signature string to its bytes4 selector.



#### Parameters

| Name | Type | Description |
|---|---|---|
| functionName | string | The function signature in string format. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes4 | The function selector as bytes4. |

### transferOwnership

```solidity
function transferOwnership(address newOwner) external nonpayable
```



*Transfers ownership of the contract to a new account (`newOwner`). Can only be called by the current owner.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner | address | undefined |

### userIndex

```solidity
function userIndex() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### userList

```solidity
function userList(uint256) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |



## Events

### ClassFeeRegistered

```solidity
event ClassFeeRegistered(bytes32 indexed feeId, address indexed classContract, bytes4 indexed functionSig, int256 fee)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| feeId `indexed` | bytes32 | undefined |
| classContract `indexed` | address | undefined |
| functionSig `indexed` | bytes4 | undefined |
| fee  | int256 | undefined |

### OwnershipTransferred

```solidity
event OwnershipTransferred(address indexed previousOwner, address indexed newOwner)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| previousOwner `indexed` | address | undefined |
| newOwner `indexed` | address | undefined |

### TotalFee

```solidity
event TotalFee(int256 fee)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| fee  | int256 | undefined |



## Errors

### ArrayLengthMismatch

```solidity
error ArrayLengthMismatch()
```






### FeeAboveMaxLimit

```solidity
error FeeAboveMaxLimit()
```







