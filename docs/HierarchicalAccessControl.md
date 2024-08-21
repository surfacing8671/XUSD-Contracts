# HierarchicalAccessControl









## Methods

### assignRank

```solidity
function assignRank(address account, enum HierarchicalAccessControl.Rank rank) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| rank | enum HierarchicalAccessControl.Rank | undefined |

### downgradeRank

```solidity
function downgradeRank(address account) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### getRank

```solidity
function getRank(address account) external view returns (enum HierarchicalAccessControl.Rank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum HierarchicalAccessControl.Rank | undefined |

### hasRank

```solidity
function hasRank(enum HierarchicalAccessControl.Rank requiredRank, address account) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| requiredRank | enum HierarchicalAccessControl.Rank | undefined |
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### revokeRank

```solidity
function revokeRank(address account) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### upgradeRank

```solidity
function upgradeRank(address account) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |



## Events

### RankAssigned

```solidity
event RankAssigned(address indexed account, enum HierarchicalAccessControl.Rank rank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |
| rank  | enum HierarchicalAccessControl.Rank | undefined |

### RankDowngraded

```solidity
event RankDowngraded(address indexed account, enum HierarchicalAccessControl.Rank newRank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |
| newRank  | enum HierarchicalAccessControl.Rank | undefined |

### RankRevoked

```solidity
event RankRevoked(address indexed account)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |

### RankUpgraded

```solidity
event RankUpgraded(address indexed account, enum HierarchicalAccessControl.Rank newRank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | undefined |
| newRank  | enum HierarchicalAccessControl.Rank | undefined |



## Errors

### AccessDenied

```solidity
error AccessDenied(address account, enum HierarchicalAccessControl.Rank requiredRank)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| requiredRank | enum HierarchicalAccessControl.Rank | undefined |

### InvalidOperation

```solidity
error InvalidOperation(string reason)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| reason | string | undefined |


