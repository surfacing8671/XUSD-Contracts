# NegativeReferralBasedTaxCalculator



> NegativeReferralBasedTaxCalculator



*A tax calculator that provides rewards for both referrers and referred addresses.*

## Methods

### baseRewardBasisPoints

```solidity
function baseRewardBasisPoints() external view returns (int256)
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

### referralBonusBasisPoints

```solidity
function referralBonusBasisPoints() external view returns (int256)
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
| referrer | address | The address that referred the new user. |
| referred | address | The address being referred. |




