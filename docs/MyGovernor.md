# MyGovernor









## Methods

### VoterTallyMap

```solidity
function VoterTallyMap(uint256) external view returns (address classAddress, uint256 voteTotal, uint256 index, uint256 timestampStart, uint256 totalNft, string name, bool approved)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| voteTotal | uint256 | undefined |
| index | uint256 | undefined |
| timestampStart | uint256 | undefined |
| totalNft | uint256 | undefined |
| name | string | undefined |
| approved | bool | undefined |

### checkVotes

```solidity
function checkVotes(address classAddress) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |

### hashIndexMap

```solidity
function hashIndexMap(address) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

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

### propose

```solidity
function propose(string description, address classAddress) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| description | string | undefined |
| classAddress | address | undefined |

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

### showAllProposals

```solidity
function showAllProposals() external view returns (struct MyGovernor.VoteTally[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | MyGovernor.VoteTally[] | undefined |

### vote

```solidity
function vote(address classAddress) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |



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






### NeedAVibePass

```solidity
error NeedAVibePass()
```






### NotAllowedAccess

```solidity
error NotAllowedAccess()
```







