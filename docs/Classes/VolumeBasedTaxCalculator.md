# VolumeBasedTaxCalculator



> VolumeBasedTaxCalculator



*A tax calculator that imposes different tax rates based on the transaction volume.*

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

### highVolumeRateBasisPoints

```solidity
function highVolumeRateBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### lowVolumeRateBasisPoints

```solidity
function lowVolumeRateBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### volumeThreshold

```solidity
function volumeThreshold() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |




