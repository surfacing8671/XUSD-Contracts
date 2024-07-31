# IClassBase







*Interface of the ERC20 standard as defined in the EIP.*

## Methods

### getActiveAdd

```solidity
function getActiveAdd(address user, address to, address from, address sender, bytes4 sig, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| to | address | undefined |
| from | address | undefined |
| sender | address | undefined |
| sig | bytes4 | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### getActiveSub

```solidity
function getActiveSub(address user, address to, address from, address sender, bytes4 sig, uint256 amount) external nonpayable returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |
| to | address | undefined |
| from | address | undefined |
| sender | address | undefined |
| sig | bytes4 | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### getClassBasis

```solidity
function getClassBasis() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### getClassType

```solidity
function getClassType() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |




