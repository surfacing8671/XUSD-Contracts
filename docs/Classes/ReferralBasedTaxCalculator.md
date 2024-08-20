# ReferralBasedTaxCalculator



> ReferralBasedTaxCalculator



*A tax calculator that provides a discount for referred addresses.*

## Methods

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

### referralDiscountBasisPoints

```solidity
function referralDiscountBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### referrals

```solidity
function referrals(address) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### registerReferral

```solidity
function registerReferral(address referrer, address referred) external nonpayable
```



*Registers a referral relationship.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| referrer | address | The address that referred the new address. |
| referred | address | The address being referred. |




