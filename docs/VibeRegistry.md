# VibeRegistry









## Methods

### MotzkinPrime

```solidity
function MotzkinPrime() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### activateVibeUser

```solidity
function activateVibeUser(address user, address class) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| class | address | undefined |

### addClass

```solidity
function addClass(address class, bool active, uint256 classType, bool _process) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |
| active | bool | undefined |
| classType | uint256 | undefined |
| _process | bool | undefined |

### calculateAndSumBasis

```solidity
function calculateAndSumBasis(address to, address from, address _caller, address sender, uint256 amount) external nonpayable returns (int256, uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| from | address | undefined |
| _caller | address | undefined |
| sender | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |
| _1 | uint256 | undefined |

### checkErrors

```solidity
function checkErrors() external view returns (struct VibeRegistry.userVibe[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | VibeRegistry.userVibe[] | undefined |

### checkRank

```solidity
function checkRank() external nonpayable
```






### deactivateVibeUser

```solidity
function deactivateVibeUser(address user, address class) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| class | address | undefined |

### removeError

```solidity
function removeError(uint64 Omnicron) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Omnicron | uint64 | undefined |

### retrieveUserVibeList

```solidity
function retrieveUserVibeList(address user) external view returns (struct VibeRegistry.userVibe[])
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | VibeRegistry.userVibe[] | undefined |

### setClassError

```solidity
function setClassError(address class) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | undefined |

### setClassLimit

```solidity
function setClassLimit(uint256 limit) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| limit | uint256 | undefined |

### setDenominator

```solidity
function setDenominator(uint256 _denominator) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _denominator | uint256 | undefined |

### setGladiatorLimit

```solidity
function setGladiatorLimit(int256 limit) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| limit | int256 | undefined |

### setLegatusLimit

```solidity
function setLegatusLimit(int256 limit) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| limit | int256 | undefined |

### showRewards

```solidity
function showRewards() external view returns (struct VibeRegistry.RewardClass[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | VibeRegistry.RewardClass[] | undefined |

### viewCallerVibes

```solidity
function viewCallerVibes() external view returns (struct VibeRegistry.MaterClass[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | VibeRegistry.MaterClass[] | undefined |

### viewFromVibes

```solidity
function viewFromVibes() external view returns (struct VibeRegistry.MaterClass[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | VibeRegistry.MaterClass[] | undefined |

### viewSenderVibes

```solidity
function viewSenderVibes() external view returns (struct VibeRegistry.MaterClass[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | VibeRegistry.MaterClass[] | undefined |

### viewToVibes

```solidity
function viewToVibes() external view returns (struct VibeRegistry.MaterClass[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | VibeRegistry.MaterClass[] | undefined |

### viewVibes

```solidity
function viewVibes(address user) external view returns (int256)
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

### RewardCalculationFailed

```solidity
event RewardCalculationFailed(address classHash, bytes reason)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classHash  | address | undefined |
| reason  | bytes | undefined |



## Errors

### NotAllowedAccess

```solidity
error NotAllowedAccess()
```







