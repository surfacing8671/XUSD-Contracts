# HoldingPeriodBasedTaxCalculator



> HoldingPeriodBasedTaxCalculator



*A tax calculator that imposes different tax rates based on the holding period of an asset.*

## Methods

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

### holdingPeriodThreshold

```solidity
function holdingPeriodThreshold() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### longTermRateBasisPoints

```solidity
function longTermRateBasisPoints() external view returns (int256)
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

### shortTermRateBasisPoints

```solidity
function shortTermRateBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |




