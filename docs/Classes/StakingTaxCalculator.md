# StakingTaxCalculator



> StakingTaxCalculator



*A tax calculator that specifies a staking contract for tax collection.*

## Methods

### calculateTaxBasisPoints

```solidity
function calculateTaxBasisPoints(address from, address to, address caller) external view returns (uint256)
```



*Returns the tax rate for the transaction.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | The sender of the tokens. |
| to | address | The recipient of the tokens. |
| caller | address | The address that initiated the transaction. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | uint256 The tax rate in basis points. |

### getTaxRecipientContract

```solidity
function getTaxRecipientContract() external view returns (address)
```



*Returns the staking contract address where the tax should be sent.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | address The staking contract address. |

### stakingContract

```solidity
function stakingContract() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### taxRateBasisPoints

```solidity
function taxRateBasisPoints() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |




