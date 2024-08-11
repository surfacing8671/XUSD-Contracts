# BaseClass



> BaseClass



*This is an abstract base class contract that includes basic functionalities for user activation and class basis management.*

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

### calcBasis

```solidity
function calcBasis(address caller, address to, address from, address sender, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| caller | address | undefined |
| to | address | undefined |
| from | address | undefined |
| sender | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### calculateTaxBasisPoints

```solidity
function calculateTaxBasisPoints(address from, address to, address caller) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| caller | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

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

### getClassBasis

```solidity
function getClassBasis() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### getClassType

```solidity
function getClassType() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getNote

```solidity
function getNote() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### getTaxRecipientContract

```solidity
function getTaxRecipientContract() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### note

```solidity
function note() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

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



