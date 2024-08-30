# SHA









## Methods

### Adduct

```solidity
function Adduct(uint64 _Phi) external nonpayable returns (uint64)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _Phi | uint64 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### Avail

```solidity
function Avail(uint64 Xi) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Xi | uint64 | undefined |

### Bond

```solidity
function Bond() external nonpayable
```






### Conify

```solidity
function Conify(uint64 _Beta) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _Beta | uint64 | undefined |

### Conjugate

```solidity
function Conjugate(uint64 Chi) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Chi | uint64 | undefined |

### Dynamo

```solidity
function Dynamo() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### Form

```solidity
function Form(uint64 Chi) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Chi | uint64 | undefined |

### Fuse

```solidity
function Fuse(uint64 _rho, uint64 Upsilon, uint64 Ohm) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _rho | uint64 | undefined |
| Upsilon | uint64 | undefined |
| Ohm | uint64 | undefined |

### MotzkinPrime

```solidity
function MotzkinPrime() external view returns (uint64)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |

### Polarize

```solidity
function Polarize() external nonpayable
```






### React

```solidity
function React(uint64 Pi, uint64 Theta) external nonpayable returns (uint64, uint64)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Pi | uint64 | undefined |
| Theta | uint64 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint64 | undefined |
| _1 | uint64 | undefined |

### Saturate

```solidity
function Saturate(uint64 _Beta, uint64 Epsilon, uint64 Theta) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _Beta | uint64 | undefined |
| Epsilon | uint64 | undefined |
| Theta | uint64 | undefined |

### Type

```solidity
function Type() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### View

```solidity
function View() external view returns (struct Fa)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | Fa | undefined |

### Xiao

```solidity
function Xiao() external view returns (contract atropaMath)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract atropaMath | undefined |

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

### ReactionZeroError

```solidity
error ReactionZeroError(uint64 Eta, uint64 Kappa)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| Eta | uint64 | undefined |
| Kappa | uint64 | undefined |


