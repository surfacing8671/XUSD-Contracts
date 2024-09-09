# IAccessManager









## Methods

### checkRole

```solidity
function checkRole(address account, enum IAccessManager.Rank rank) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| rank | enum IAccessManager.Rank | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### getAccountRank

```solidity
function getAccountRank(address account) external view returns (enum IAccessManager.Rank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum IAccessManager.Rank | undefined |

### getAllAccounts

```solidity
function getAllAccounts() external view returns (uint256[])
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256[] | undefined |

### grantRole

```solidity
function grantRole(address account, enum IAccessManager.Rank rank) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| rank | enum IAccessManager.Rank | undefined |

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
event RoleGranted(address indexed account, enum IAccessManager.Rank role)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |
| role  | enum IAccessManager.Rank | undefined |

### RoleRevoked

```solidity
event RoleRevoked(address indexed account)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |



## Errors

### UnauthorizedAccess

```solidity
error UnauthorizedAccess(enum IAccessManager.Rank roleId, address addr)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| roleId | enum IAccessManager.Rank | undefined |
| addr | address | undefined |


