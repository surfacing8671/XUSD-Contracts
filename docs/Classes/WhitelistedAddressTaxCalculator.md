# WhitelistedAddressTaxCalculator



> WhitelistedAddressTaxCalculator



*A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.*

## Methods

### addToWhitelist

```solidity
function addToWhitelist(address addr, int256 amount) external nonpayable
```



*Add an address to the whitelist.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| addr | address | The address to whitelist. |
| amount | int256 | undefined |

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

### taxRateBasisPoints

```solidity
function taxRateBasisPoints() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### whitelistedAddresses

```solidity
function whitelistedAddresses(address) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |




