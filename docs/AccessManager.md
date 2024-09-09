# AccessManager









## Methods

### checkRole

```solidity
function checkRole(address account, enum AuthLib.Rank rank) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| rank | enum AuthLib.Rank | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### getAccountRank

```solidity
function getAccountRank(address account) external view returns (enum AuthLib.Rank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum AuthLib.Rank | undefined |

### grantRole

```solidity
function grantRole(address account, enum AuthLib.Rank rank) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| rank | enum AuthLib.Rank | undefined |

### revokeRole

```solidity
function revokeRole(address account) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |



## Events

### RoleGranted

```solidity
event RoleGranted(address indexed account, enum AuthLib.Rank role)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |
| role  | enum AuthLib.Rank | undefined |

### RoleRevoked

```solidity
event RoleRevoked(address indexed account)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |



