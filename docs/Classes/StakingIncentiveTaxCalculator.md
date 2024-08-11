# StakingIncentiveTaxCalculator



> StakingIncentiveTaxCalculator



*A tax calculator that reduces the tax rate (negative basis points) when interacting with a specific staking contract.*

## Methods

### calculateTaxBasisPoints

```solidity
function calculateTaxBasisPoints(address to, address from) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| from | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### getContract

```solidity
function getContract() external view returns (address[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address[] | undefined |

### incentiveBasisPoints

```solidity
function incentiveBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### stakingContract

```solidity
function stakingContract() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |




