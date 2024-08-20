# ClassRegistry



> ClassRegistry



*This contract is to store the Whitlisted Tax Classes, 3 different types, and the logic to call them and determine the ussers basis points*

## Methods

### MAX_AMOUNT

```solidity
function MAX_AMOUNT() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### MasteClassMap

```solidity
function MasteClassMap(uint256) external view returns (address classAddress, uint256 updatedTimestamp, bool active)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| updatedTimestamp | uint256 | undefined |
| active | bool | undefined |

### MasterClassCallerMap

```solidity
function MasterClassCallerMap(uint256) external view returns (address classAddress, uint256 updatedTimestamp, bool active)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| updatedTimestamp | uint256 | undefined |
| active | bool | undefined |

### MasterClassContractMap

```solidity
function MasterClassContractMap(uint256) external view returns (address classAddress, uint256 updatedTimestamp, bool active)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| updatedTimestamp | uint256 | undefined |
| active | bool | undefined |

### MasterClassFromMap

```solidity
function MasterClassFromMap(uint256) external view returns (address classAddress, uint256 updatedTimestamp, bool active)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| updatedTimestamp | uint256 | undefined |
| active | bool | undefined |

### MasterClassToMap

```solidity
function MasterClassToMap(uint256) external view returns (address classAddress, uint256 updatedTimestamp, bool active)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| updatedTimestamp | uint256 | undefined |
| active | bool | undefined |

### RegisterContracts

```solidity
function RegisterContracts(address contracts) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| contracts | address | undefined |

### RewardBalance

```solidity
function RewardBalance() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### addClass

```solidity
function addClass(address class, bool active, uint256 classType) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |
| active | bool | undefined |
| classType | uint256 | undefined |

### calculateAndSumBasis

```solidity
function calculateAndSumBasis(address to, address from, address _caller, uint256 amount) external nonpayable returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| from | address | undefined |
| _caller | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### depositRewards

```solidity
function depositRewards(uint256 amount) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| amount | uint256 | undefined |

### hasVibes

```solidity
function hasVibes(address user) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

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

### setGov

```solidity
function setGov(address gove) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| gove | address | undefined |

### turnOnRewards

```solidity
function turnOnRewards() external nonpayable
```






### viewUser

```solidity
function viewUser(address user) external nonpayable returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### xusd

```solidity
function xusd() external view returns (contract XUSD)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract XUSD | undefined |



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







