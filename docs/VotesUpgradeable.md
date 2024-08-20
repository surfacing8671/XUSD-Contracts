# VotesUpgradeable







*This is a base abstract contract that tracks voting units, which are a measure of voting power that can be transferred, and provides a system of vote delegation, where an account can delegate its voting units to a sort of &quot;representative&quot; that will pool delegated voting units from different accounts and can then use it to vote in decisions. In fact, voting units _must_ be delegated in order to count as actual votes, and an account has to delegate those votes to itself if it wishes to participate in decisions and does not have a trusted representative. This contract is often combined with a token contract such that voting units correspond to token units. For an example, see {ERC721Votes}. The full history of delegate votes is tracked on-chain so that governance protocols can consider votes as distributed at a particular block number to protect against flash loans and double voting. The opt-in delegate system makes the cost of this history tracking optional. When using this module the derived contract must implement {_getVotingUnits} (for example, make it return {ERC721-balanceOf}), and can use {_transferVotingUnits} to track a change in the distribution of those units (in the previous example, it would be included in {ERC721-_update}).*

## Methods

### CLOCK_MODE

```solidity
function CLOCK_MODE() external view returns (string)
```



*Machine-readable description of the clock as specified in EIP-6372.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### clock

```solidity
function clock() external view returns (uint48)
```



*Clock used for flagging checkpoints. Can be overridden to implement timestamp based checkpoints (and voting), in which case {CLOCK_MODE} should be overridden as well to match.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint48 | undefined |

### delegate

```solidity
function delegate(address delegatee) external nonpayable
```



*Delegates votes from the sender to `delegatee`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| delegatee | address | undefined |

### delegateBySig

```solidity
function delegateBySig(address delegatee, uint256 nonce, uint256 expiry, uint8 v, bytes32 r, bytes32 s) external nonpayable
```



*Delegates votes from signer to `delegatee`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| delegatee | address | undefined |
| nonce | uint256 | undefined |
| expiry | uint256 | undefined |
| v | uint8 | undefined |
| r | bytes32 | undefined |
| s | bytes32 | undefined |

### delegates

```solidity
function delegates(address account) external view returns (address)
```



*Returns the delegate that `account` has chosen.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### eip712Domain

```solidity
function eip712Domain() external view returns (bytes1 fields, string name, string version, uint256 chainId, address verifyingContract, bytes32 salt, uint256[] extensions)
```



*See {IERC-5267}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| fields | bytes1 | undefined |
| name | string | undefined |
| version | string | undefined |
| chainId | uint256 | undefined |
| verifyingContract | address | undefined |
| salt | bytes32 | undefined |
| extensions | uint256[] | undefined |

### getPastTotalSupply

```solidity
function getPastTotalSupply(uint256 timepoint) external view returns (uint256)
```



*Returns the total supply of votes available at a specific moment in the past. If the `clock()` is configured to use block numbers, this will return the value at the end of the corresponding block. NOTE: This value is the sum of all available votes, which is not necessarily the sum of all delegated votes. Votes that have not been delegated are still part of total supply, even though they would not participate in a vote. Requirements: - `timepoint` must be in the past. If operating using block numbers, the block must be already mined.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| timepoint | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getPastVotes

```solidity
function getPastVotes(address account, uint256 timepoint) external view returns (uint256)
```



*Returns the amount of votes that `account` had at a specific moment in the past. If the `clock()` is configured to use block numbers, this will return the value at the end of the corresponding block. Requirements: - `timepoint` must be in the past. If operating using block numbers, the block must be already mined.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| timepoint | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getVotes

```solidity
function getVotes(address account) external view returns (uint256)
```



*Returns the current amount of votes that `account` has.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### nonces

```solidity
function nonces(address owner) external view returns (uint256)
```



*Returns the next unused nonce for an address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |



## Events

### DelegateChanged

```solidity
event DelegateChanged(address indexed delegator, address indexed fromDelegate, address indexed toDelegate)
```



*Emitted when an account changes their delegate.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| delegator `indexed` | address | undefined |
| fromDelegate `indexed` | address | undefined |
| toDelegate `indexed` | address | undefined |

### DelegateVotesChanged

```solidity
event DelegateVotesChanged(address indexed delegate, uint256 previousVotes, uint256 newVotes)
```



*Emitted when a token transfer or delegate change results in changes to a delegate&#39;s number of voting units.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| delegate `indexed` | address | undefined |
| previousVotes  | uint256 | undefined |
| newVotes  | uint256 | undefined |

### EIP712DomainChanged

```solidity
event EIP712DomainChanged()
```



*MAY be emitted to signal that the domain could have changed.*


### Initialized

```solidity
event Initialized(uint64 version)
```



*Triggered when the contract has been initialized or reinitialized.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| version  | uint64 | undefined |



## Errors

### CheckpointUnorderedInsertion

```solidity
error CheckpointUnorderedInsertion()
```



*A value was attempted to be inserted on a past checkpoint.*


### ECDSAInvalidSignature

```solidity
error ECDSAInvalidSignature()
```



*The signature derives the `address(0)`.*


### ECDSAInvalidSignatureLength

```solidity
error ECDSAInvalidSignatureLength(uint256 length)
```



*The signature has an invalid length.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| length | uint256 | undefined |

### ECDSAInvalidSignatureS

```solidity
error ECDSAInvalidSignatureS(bytes32 s)
```



*The signature has an S value that is in the upper half order.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| s | bytes32 | undefined |

### ERC5805FutureLookup

```solidity
error ERC5805FutureLookup(uint256 timepoint, uint48 clock)
```



*Lookup to future votes is not available.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| timepoint | uint256 | undefined |
| clock | uint48 | undefined |

### ERC6372InconsistentClock

```solidity
error ERC6372InconsistentClock()
```



*The clock was incorrectly modified.*


### InvalidAccountNonce

```solidity
error InvalidAccountNonce(address account, uint256 currentNonce)
```



*The nonce used for an `account` is not the expected current nonce.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| currentNonce | uint256 | undefined |

### InvalidInitialization

```solidity
error InvalidInitialization()
```



*The contract is already initialized.*


### NotInitializing

```solidity
error NotInitializing()
```



*The contract is not initializing.*


### SafeCastOverflowedUintDowncast

```solidity
error SafeCastOverflowedUintDowncast(uint8 bits, uint256 value)
```



*Value doesn&#39;t fit in an uint of `bits` size.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| bits | uint8 | undefined |
| value | uint256 | undefined |

### VotesExpiredSignature

```solidity
error VotesExpiredSignature(uint256 expiry)
```



*The signature used has expired.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| expiry | uint256 | undefined |


