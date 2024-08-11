# WhitelistedAddressTaxCalculator



> WhitelistedAddressTaxCalculator



*A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.*

## Methods

### addToWhitelist

```solidity
function addToWhitelist(address addr) external nonpayable
```



*Add an address to the whitelist.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| addr | address | The address to whitelist. |

### calculateTaxBasisPoints

```solidity
function calculateTaxBasisPoints(address addy) external view returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| addy | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### taxRateBasisPoints

```solidity
function taxRateBasisPoints() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### whitelistedAddresses

```solidity
function whitelistedAddresses(address) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |




