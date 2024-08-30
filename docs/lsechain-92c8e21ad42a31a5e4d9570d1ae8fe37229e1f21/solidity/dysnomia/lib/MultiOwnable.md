# MultiOwnable









## Methods

### addOwner

```solidity
function addOwner(address newOwner) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner | address | undefined |

### owner

```solidity
function owner(address cOwner) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| cOwner | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### renounceOwnership

```solidity
function renounceOwnership(address toRemove) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| toRemove | address | undefined |



## Events

### OwnershipUpdate

```solidity
event OwnershipUpdate(address indexed newOwner, bool indexed state)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner `indexed` | address | undefined |
| state `indexed` | bool | undefined |



## Errors

### OwnableInvalidOwner

```solidity
error OwnableInvalidOwner(address origin, address owner, address what)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| origin | address | undefined |
| owner | address | undefined |
| what | address | undefined |

### OwnableUnauthorizedAccount

```solidity
error OwnableUnauthorizedAccount(address origin, address account, address what)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| origin | address | undefined |
| account | address | undefined |
| what | address | undefined |


