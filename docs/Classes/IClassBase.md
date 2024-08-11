# IClassBase







*Interface of the ERC20 standard as defined in the EIP.*

## Methods

### calcBasis

```solidity
function calcBasis(address caller, address to, address from, address sender, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| caller | address | undefined |
| to | address | undefined |
| from | address | undefined |
| sender | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### calculateTaxBasisPoints

```solidity
function calculateTaxBasisPoints(address from, address to, address caller) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| caller | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getClassBasis

```solidity
function getClassBasis() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### getNote

```solidity
function getNote() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### getTaxRecipientContract

```solidity
function getTaxRecipientContract() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |




