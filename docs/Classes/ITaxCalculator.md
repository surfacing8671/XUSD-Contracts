# ITaxCalculator









## Methods

### calculateTaxBasisPoints

```solidity
function calculateTaxBasisPoints(address from, address to, address caller) external view returns (uint256)
```



*Returns the tax rate in basis points for a specific transaction.*

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



*Returns the contract address that should be interacted with for tax purposes.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | address The contract address to interact with. |




