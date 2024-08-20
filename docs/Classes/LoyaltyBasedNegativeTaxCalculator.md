# LoyaltyBasedNegativeTaxCalculator



> LoyaltyBasedNegativeTaxCalculator



*A tax calculator that gives progressively higher rewards for loyal addresses based on transaction count.*

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

### loyaltyIncrementBasisPoints

```solidity
function loyaltyIncrementBasisPoints() external view returns (int256)
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



*Records a transaction to count towards loyalty rewards.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _addy | address | The address making the transaction. |

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




