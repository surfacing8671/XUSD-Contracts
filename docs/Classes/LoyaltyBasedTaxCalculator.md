# LoyaltyBasedTaxCalculator



> LoyaltyBasedTaxCalculator



*A tax calculator that reduces the tax rate for loyal addresses based on transaction count.*

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

### loyaltyDiscountBasisPoints

```solidity
function loyaltyDiscountBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### loyaltyThreshold

```solidity
function loyaltyThreshold() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### recordTransaction

```solidity
function recordTransaction(address _addy) external nonpayable
```



*Records a transaction for an address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _addy | address | The address conducting the transaction. |

### transactionCounts

```solidity
function transactionCounts(address) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |




