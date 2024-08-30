# Test









## Methods

### MotzkinPrime

```solidity
function MotzkinPrime() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

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

### checkRank

```solidity
function checkRank(address user) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

### setDenominator

```solidity
function setDenominator(uint256 _denominator) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _denominator | uint256 | undefined |

### setGov

```solidity
function setGov(address gove) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| gove | address | undefined |

### showRewards

```solidity
function showRewards() external view returns (struct Test.RewardClass[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | Test.RewardClass[] | undefined |

### viewUser

```solidity
function viewUser(address user) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

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




## Errors

### NotAllowedAccess

```solidity
error NotAllowedAccess()
```







