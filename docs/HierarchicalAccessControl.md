# HierarchicalAccessControl



> HierarchicalAccessControl



*Implements role-based access control with hierarchical ranks.*

## Methods

### assignRank

```solidity
function assignRank(address account, enum HierarchicalAccessControl.Rank rank) external nonpayable
```

Assign a rank to an account.

*Can only be called by accounts with CONSUL rank or higher.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | The address to assign the rank to. |
| rank | enum HierarchicalAccessControl.Rank | The rank to be assigned. |

### downgradeRank

```solidity
function downgradeRank(address account) external nonpayable
```

Downgrade the rank of an account.

*Can only be called by accounts with CONSUL rank or higher.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | The address to downgrade the rank for. |

### getRank

```solidity
function getRank(address account) external view returns (enum HierarchicalAccessControl.Rank)
```

Get the rank of an account.



#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | The address to check. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum HierarchicalAccessControl.Rank | Rank The rank of the account. |

### hasRank

```solidity
function hasRank(enum HierarchicalAccessControl.Rank requiredRank, address account) external view returns (bool)
```

Check if an account has the required rank or higher.



#### Parameters

| Name | Type | Description |
|---|---|---|
| requiredRank | enum HierarchicalAccessControl.Rank | The rank required. |
| account | address | The address of the account to check. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | bool True if the account has the required rank or higher, false otherwise. |

### revokeRank

```solidity
function revokeRank(address account) external nonpayable
```

Revoke the rank of an account.

*Can only be called by accounts with SENATOR rank or higher.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | The address to revoke the rank from. |

### upgradeRank

```solidity
function upgradeRank(address account) external nonpayable
```

Upgrade the rank of an account.

*Can only be called by accounts with CONSUL rank or higher.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | The address to upgrade the rank for. |



## Events

### RankAssigned

```solidity
event RankAssigned(address indexed account, enum HierarchicalAccessControl.Rank rank)
```



*Emitted when a rank is assigned to an account.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | The address of the account being assigned a rank. |
| rank  | enum HierarchicalAccessControl.Rank | The rank assigned to the account. |

### RankDowngraded

```solidity
event RankDowngraded(address indexed account, enum HierarchicalAccessControl.Rank newRank)
```



*Emitted when an account&#39;s rank is downgraded.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | The address of the account being downgraded. |
| newRank  | enum HierarchicalAccessControl.Rank | The new rank assigned to the account. |

### RankRevoked

```solidity
event RankRevoked(address indexed account)
```



*Emitted when a rank is revoked from an account.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | The address of the account whose rank is revoked. |

### RankUpgraded

```solidity
event RankUpgraded(address indexed account, enum HierarchicalAccessControl.Rank newRank)
```



*Emitted when an account&#39;s rank is upgraded.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account `indexed` | address | The address of the account being upgraded. |
| newRank  | enum HierarchicalAccessControl.Rank | The new rank assigned to the account. |



## Errors

### AccessDenied

```solidity
error AccessDenied(address account, enum HierarchicalAccessControl.Rank requiredRank)
```



*Error thrown when an account lacks the required rank.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | The address of the account attempting the operation. |
| requiredRank | enum HierarchicalAccessControl.Rank | The rank required for the operation. |

### InvalidOperation

```solidity
error InvalidOperation(string reason)
```



*Error thrown when an invalid operation is attempted.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| reason | string | The reason why the operation is invalid. |


