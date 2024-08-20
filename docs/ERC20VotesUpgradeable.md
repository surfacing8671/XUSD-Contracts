# ERC20VotesUpgradeable







*Extension of ERC-20 to support Compound-like voting and delegation. This version is more generic than Compound&#39;s, and supports token supply up to 2^208^ - 1, while COMP is limited to 2^96^ - 1. NOTE: This contract does not provide interface compatibility with Compound&#39;s COMP token. This extension keeps a history (checkpoints) of each account&#39;s vote power. Vote power can be delegated either by calling the {Votes-delegate} function directly, or by providing a signature to be used with {Votes-delegateBySig}. Voting power can be queried through the public accessors {Votes-getVotes} and {Votes-getPastVotes}. By default, token balance does not account for voting power. This makes transfers cheaper. The downside is that it requires users to delegate to themselves in order to activate checkpoints and have their voting power tracked.*

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

### allowance

```solidity
function allowance(address owner, address spender) external view returns (uint256)
```



*See {IERC20-allowance}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner | address | undefined |
| spender | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### approve

```solidity
function approve(address spender, uint256 value) external nonpayable returns (bool)
```



*See {IERC20-approve}. NOTE: If `value` is the maximum `uint256`, the allowance is not updated on `transferFrom`. This is semantically equivalent to an infinite approval. Requirements: - `spender` cannot be the zero address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### balanceOf

```solidity
function balanceOf(address account) external view returns (uint256)
```



*See {IERC20-balanceOf}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### checkpoints

```solidity
function checkpoints(address account, uint32 pos) external view returns (struct Checkpoints.Checkpoint208)
```



*Get the `pos`-th checkpoint for `account`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| pos | uint32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | Checkpoints.Checkpoint208 | undefined |

### clock

```solidity
function clock() external view returns (uint48)
```



*Clock used for flagging checkpoints. Can be overridden to implement timestamp based checkpoints (and voting), in which case {CLOCK_MODE} should be overridden as well to match.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint48 | undefined |

### decimals

```solidity
function decimals() external view returns (uint8)
```



*Returns the number of decimals used to get its user representation. For example, if `decimals` equals `2`, a balance of `505` tokens should be displayed to a user as `5.05` (`505 / 10 ** 2`). Tokens usually opt for a value of 18, imitating the relationship between Ether and Wei. This is the default value returned by this function, unless it&#39;s overridden. NOTE: This information is only used for _display_ purposes: it in no way affects any of the arithmetic of the contract, including {IERC20-balanceOf} and {IERC20-transfer}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint8 | undefined |

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

### name

```solidity
function name() external view returns (string)
```



*Returns the name of the token.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

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

### numCheckpoints

```solidity
function numCheckpoints(address account) external view returns (uint32)
```



*Get number of checkpoints for `account`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint32 | undefined |

### symbol

```solidity
function symbol() external view returns (string)
```



*Returns the symbol of the token, usually a shorter version of the name.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### totalSupply

```solidity
function totalSupply() external view returns (uint256)
```



*See {IERC20-totalSupply}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### transfer

```solidity
function transfer(address to, uint256 value) external nonpayable returns (bool)
```



*See {IERC20-transfer}. Requirements: - `to` cannot be the zero address. - the caller must have a balance of at least `value`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 value) external nonpayable returns (bool)
```



*See {IERC20-transferFrom}. Emits an {Approval} event indicating the updated allowance. This is not required by the EIP. See the note at the beginning of {ERC20}. NOTE: Does not update the allowance if the current allowance is the maximum `uint256`. Requirements: - `from` and `to` cannot be the zero address. - `from` must have a balance of at least `value`. - the caller must have allowance for ``from``&#39;s tokens of at least `value`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | undefined |
| to | address | undefined |
| value | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |



## Events

### Approval

```solidity
event Approval(address indexed owner, address indexed spender, uint256 value)
```



*Emitted when the allowance of a `spender` for an `owner` is set by a call to {approve}. `value` is the new allowance.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| owner `indexed` | address | undefined |
| spender `indexed` | address | undefined |
| value  | uint256 | undefined |

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

### Transfer

```solidity
event Transfer(address indexed from, address indexed to, uint256 value)
```



*Emitted when `value` tokens are moved from one account (`from`) to another (`to`). Note that `value` may be zero.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from `indexed` | address | undefined |
| to `indexed` | address | undefined |
| value  | uint256 | undefined |



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

### ERC20ExceededSafeSupply

```solidity
error ERC20ExceededSafeSupply(uint256 increasedSupply, uint256 cap)
```



*Total supply cap has been exceeded, introducing a risk of votes overflowing.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| increasedSupply | uint256 | undefined |
| cap | uint256 | undefined |

### ERC20InsufficientAllowance

```solidity
error ERC20InsufficientAllowance(address spender, uint256 allowance, uint256 needed)
```



*Indicates a failure with the `spender`’s `allowance`. Used in transfers.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | Address that may be allowed to operate on tokens without being their owner. |
| allowance | uint256 | Amount of tokens a `spender` is allowed to operate with. |
| needed | uint256 | Minimum amount required to perform a transfer. |

### ERC20InsufficientBalance

```solidity
error ERC20InsufficientBalance(address sender, uint256 balance, uint256 needed)
```



*Indicates an error related to the current `balance` of a `sender`. Used in transfers.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | Address whose tokens are being transferred. |
| balance | uint256 | Current balance for the interacting account. |
| needed | uint256 | Minimum amount required to perform a transfer. |

### ERC20InvalidApprover

```solidity
error ERC20InvalidApprover(address approver)
```



*Indicates a failure with the `approver` of a token to be approved. Used in approvals.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| approver | address | Address initiating an approval operation. |

### ERC20InvalidReceiver

```solidity
error ERC20InvalidReceiver(address receiver)
```



*Indicates a failure with the token `receiver`. Used in transfers.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| receiver | address | Address to which tokens are being transferred. |

### ERC20InvalidSender

```solidity
error ERC20InvalidSender(address sender)
```



*Indicates a failure with the token `sender`. Used in transfers.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| sender | address | Address whose tokens are being transferred. |

### ERC20InvalidSpender

```solidity
error ERC20InvalidSpender(address spender)
```



*Indicates a failure with the `spender` to be approved. Used in approvals.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | Address that may be allowed to operate on tokens without being their owner. |

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


