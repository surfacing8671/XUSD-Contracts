# ClassRegistry



> ClassRegistry



*This contract is to store the Whitlisted Tax Classes, 3 different types, and the logic to call them and determine the ussers basis points*

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

### BATCH_SIZE

```solidity
function BATCH_SIZE() external view returns (uint256)
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

### MasterAddressMap

```solidity
function MasterAddressMap(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### MasterFeeMap

```solidity
function MasterFeeMap(uint256) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### MasterFeeMapContractCaller

```solidity
function MasterFeeMapContractCaller(uint256) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### MasterFeeMapContractFrom

```solidity
function MasterFeeMapContractFrom(uint256) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### MasterFeeMapContractTo

```solidity
function MasterFeeMapContractTo(uint256) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

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

### addressList

```solidity
function addressList(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### calculateTotalBasisFee

```solidity
function calculateTotalBasisFee(address to, address from, address caller) external nonpayable returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| from | address | undefined |
| caller | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### classCallerFee

```solidity
function classCallerFee(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### classCallerFeeNow

```solidity
function classCallerFeeNow(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### classContractFee

```solidity
function classContractFee(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### classFromFee

```solidity
function classFromFee(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### classToFee

```solidity
function classToFee(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### isWhitelistedCaller

```solidity
function isWhitelistedCaller(address) external view returns (bool)
```

Tracks the contracts that can call Sickle multicall



#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | True if the contract is a whitelisted caller |

### isWhitelistedTarget

```solidity
function isWhitelistedTarget(address) external view returns (bool)
```

Tracks the contracts that can be called through Sickle multicall



#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | True if the contract is a whitelisted target |

### owner

```solidity
function owner() external view returns (address)
```



*Returns the address of the current owner.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### previousBatchIndex

```solidity
function previousBatchIndex() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### recalculateFees

```solidity
function recalculateFees() external nonpayable
```






### referralCodes

```solidity
function referralCodes(bytes32) external view returns (address)
```

Keeps track of the referrers and their associated code



#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### renounceOwnership

```solidity
function renounceOwnership() external nonpayable
```



*Leaves the contract without owner. It will not be possible to call `onlyOwner` functions. Can only be called by the current owner. NOTE: Renouncing ownership will leave the contract without an owner, thereby disabling any functionality that is only available to the owner.*


### setWhitelistedClassCallerFee

```solidity
function setWhitelistedClassCallerFee(address class, bool isApproved) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |
| isApproved | bool | undefined |

### setWhitelistedClassContractFee

```solidity
function setWhitelistedClassContractFee(address class, bool isApproved) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |
| isApproved | bool | undefined |

### setWhitelistedClassFromFee

```solidity
function setWhitelistedClassFromFee(address class, bool isApproved) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |
| isApproved | bool | undefined |

### setWhitelistedClassNowFee

```solidity
function setWhitelistedClassNowFee(address class, bool isApproved) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |
| isApproved | bool | undefined |

### setWhitelistedClassToFee

```solidity
function setWhitelistedClassToFee(address class, bool isApproved) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |
| isApproved | bool | undefined |

### transferOwnership

```solidity
function transferOwnership(address newOwner) external nonpayable
```



*Transfers ownership of the contract to a new account (`newOwner`). Can only be called by the current owner.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner | address | undefined |

### updateContractFees

```solidity
function updateContractFees() external nonpayable
```








## Events

### CallerStatusChanged

```solidity
event CallerStatusChanged(address caller, bool isWhitelisted)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| caller  | address | undefined |
| isWhitelisted  | bool | undefined |

### OwnershipTransferred

```solidity
event OwnershipTransferred(address indexed previousOwner, address indexed newOwner)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| previousOwner `indexed` | address | undefined |
| newOwner `indexed` | address | undefined |

### TargetStatusChanged

```solidity
event TargetStatusChanged(address target, bool isWhitelisted)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| target  | address | undefined |
| isWhitelisted  | bool | undefined |

### whitelistedClassContractFeeChange

```solidity
event whitelistedClassContractFeeChange(address newContractClass, bool approval)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newContractClass  | address | undefined |
| approval  | bool | undefined |

### whitelistedClassFromFeeChange

```solidity
event whitelistedClassFromFeeChange(address newFromClass, bool approval)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newFromClass  | address | undefined |
| approval  | bool | undefined |

### whitelistedClassToFeeChange

```solidity
event whitelistedClassToFeeChange(address newToClass, bool approval)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newToClass  | address | undefined |
| approval  | bool | undefined |



## Errors

### AlreadyProposed

```solidity
error AlreadyProposed()
```






### ArrayLengthMismatch

```solidity
error ArrayLengthMismatch()
```

ERRORS ///




### FeeAboveMaxLimit

```solidity
error FeeAboveMaxLimit()
```






### InvalidReferralCode

```solidity
error InvalidReferralCode()
```






### NotAllowedAccess

```solidity
error NotAllowedAccess()
```






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


