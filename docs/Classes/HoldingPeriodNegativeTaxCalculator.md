# HoldingPeriodNegativeTaxCalculator



> HoldingPeriodNegativeTaxCalculator



*A tax calculator that provides increasing rewards based on the holding period of an asset.*

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

### calculateTotalBasisFee

```solidity
function calculateTotalBasisFee(address addy, uint256 amount) external view returns (int256)
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

### holdingPeriodThreshold

```solidity
function holdingPeriodThreshold() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### longTermRewardBasisPoints

```solidity
function longTermRewardBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### purchaseTimestamps

```solidity
function purchaseTimestamps(address) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### recordPurchase

```solidity
function recordPurchase(address _addy) external nonpayable
```



*Record the timestamp when an asset is purchased.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _addy | address | The address that purchased the asset. |

### shortTermRewardBasisPoints

```solidity
function shortTermRewardBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |




