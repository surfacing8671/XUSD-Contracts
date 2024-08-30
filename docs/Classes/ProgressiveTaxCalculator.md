# ProgressiveTaxCalculator



> ProgressiveTaxCalculator



*A tax calculator that imposes a progressively increasing tax rate based on the cumulative transaction amount.*

## Methods

### Description

```solidity
function Description() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

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

### baseRateBasisPoints

```solidity
function baseRateBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### calculateTotalBasisFee

```solidity
function calculateTotalBasisFee(address addy, uint256 amount) external nonpayable returns (int256, uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| addy | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |
| _1 | uint256 | undefined |

### cumulativeTransfers

```solidity
function cumulativeTransfers(address) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### description

```solidity
function description() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### getDescription

```solidity
function getDescription() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### getLevel

```solidity
function getLevel() external view returns (enum VibeBase.Importance)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum VibeBase.Importance | undefined |

### id

```solidity
function id() external view returns (address creatorAddress, string info, enum VibeBase.Importance level)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| creatorAddress | address | undefined |
| info | string | undefined |
| level | enum VibeBase.Importance | undefined |

### incrementThreshold

```solidity
function incrementThreshold() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### rateIncrementBasisPoints

```solidity
function rateIncrementBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### setBaseImportance

```solidity
function setBaseImportance(enum VibeBase.Importance level) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| level | enum VibeBase.Importance | undefined |




