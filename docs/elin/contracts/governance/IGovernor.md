# IGovernor







*Interface of the {Governor} core.*

## Methods

### CLOCK_MODE

```solidity
function CLOCK_MODE() external view returns (string)
```



*Description of the clock*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### COUNTING_MODE

```solidity
function COUNTING_MODE() external view returns (string)
```

module:voting

*A description of the possible `support` values for {castVote} and the way these votes are counted, meant to be consumed by UIs to show correct vote options and interpret the results. The string is a URL-encoded sequence of key-value pairs that each describe one aspect, for example `support=bravo&amp;quorum=for,abstain`. There are 2 standard keys: `support` and `quorum`. - `support=bravo` refers to the vote options 0 = Against, 1 = For, 2 = Abstain, as in `GovernorBravo`. - `quorum=bravo` means that only For votes are counted towards quorum. - `quorum=for,abstain` means that both For and Abstain votes are counted towards quorum. If a counting module makes use of encoded `params`, it should  include this under a `params` key with a unique name that describes the behavior. For example: - `params=fractional` might refer to a scheme where votes are divided fractionally between for/against/abstain. - `params=erc721` might refer to a scheme where specific NFTs are delegated to vote. NOTE: The string can be decoded by the standard https://developer.mozilla.org/en-US/docs/Web/API/URLSearchParams[`URLSearchParams`] JavaScript class.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### cancel

```solidity
function cancel(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) external nonpayable returns (uint256 proposalId)
```



*Cancel a proposal. A proposal is cancellable by the proposer, but only while it is Pending state, i.e. before the vote starts. Emits a {ProposalCanceled} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| targets | address[] | undefined |
| values | uint256[] | undefined |
| calldatas | bytes[] | undefined |
| descriptionHash | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

### castVote

```solidity
function castVote(uint256 proposalId, uint8 support) external nonpayable returns (uint256 balance)
```



*Cast a vote Emits a {VoteCast} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |
| support | uint8 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| balance | uint256 | undefined |

### castVoteBySig

```solidity
function castVoteBySig(uint256 proposalId, uint8 support, address voter, bytes signature) external nonpayable returns (uint256 balance)
```



*Cast a vote using the voter&#39;s signature, including ERC-1271 signature support. Emits a {VoteCast} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |
| support | uint8 | undefined |
| voter | address | undefined |
| signature | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| balance | uint256 | undefined |

### castVoteWithReason

```solidity
function castVoteWithReason(uint256 proposalId, uint8 support, string reason) external nonpayable returns (uint256 balance)
```



*Cast a vote with a reason Emits a {VoteCast} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |
| support | uint8 | undefined |
| reason | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| balance | uint256 | undefined |

### castVoteWithReasonAndParams

```solidity
function castVoteWithReasonAndParams(uint256 proposalId, uint8 support, string reason, bytes params) external nonpayable returns (uint256 balance)
```



*Cast a vote with a reason and additional encoded parameters Emits a {VoteCast} or {VoteCastWithParams} event depending on the length of params.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |
| support | uint8 | undefined |
| reason | string | undefined |
| params | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| balance | uint256 | undefined |

### castVoteWithReasonAndParamsBySig

```solidity
function castVoteWithReasonAndParamsBySig(uint256 proposalId, uint8 support, address voter, string reason, bytes params, bytes signature) external nonpayable returns (uint256 balance)
```



*Cast a vote with a reason and additional encoded parameters using the voter&#39;s signature, including ERC-1271 signature support. Emits a {VoteCast} or {VoteCastWithParams} event depending on the length of params.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |
| support | uint8 | undefined |
| voter | address | undefined |
| reason | string | undefined |
| params | bytes | undefined |
| signature | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| balance | uint256 | undefined |

### clock

```solidity
function clock() external view returns (uint48)
```



*Clock used for flagging checkpoints. Can be overridden to implement timestamp based checkpoints (and voting).*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint48 | undefined |

### execute

```solidity
function execute(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) external payable returns (uint256 proposalId)
```



*Execute a successful proposal. This requires the quorum to be reached, the vote to be successful, and the deadline to be reached. Depending on the governor it might also be required that the proposal was queued and that some delay passed. Emits a {ProposalExecuted} event. NOTE: Some modules can modify the requirements for execution, for example by adding an additional timelock.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| targets | address[] | undefined |
| values | uint256[] | undefined |
| calldatas | bytes[] | undefined |
| descriptionHash | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

### getVotes

```solidity
function getVotes(address account, uint256 timepoint) external view returns (uint256)
```

module:reputation

*Voting power of an `account` at a specific `timepoint`. Note: this can be implemented in a number of ways, for example by reading the delegated balance from one (or multiple), {ERC20Votes} tokens.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| timepoint | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getVotesWithParams

```solidity
function getVotesWithParams(address account, uint256 timepoint, bytes params) external view returns (uint256)
```

module:reputation

*Voting power of an `account` at a specific `timepoint` given additional encoded parameters.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |
| timepoint | uint256 | undefined |
| params | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### hasVoted

```solidity
function hasVoted(uint256 proposalId, address account) external view returns (bool)
```

module:voting

*Returns whether `account` has cast a vote on `proposalId`.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### hashProposal

```solidity
function hashProposal(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) external pure returns (uint256)
```

module:core

*Hashing function used to (re)build the proposal id from the proposal details..*

#### Parameters

| Name | Type | Description |
|---|---|---|
| targets | address[] | undefined |
| values | uint256[] | undefined |
| calldatas | bytes[] | undefined |
| descriptionHash | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### name

```solidity
function name() external view returns (string)
```

module:core

*Name of the governor instance (used in building the ERC712 domain separator).*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### proposalDeadline

```solidity
function proposalDeadline(uint256 proposalId) external view returns (uint256)
```

module:core

*Timepoint at which votes close. If using block number, votes close at the end of this block, so it is possible to cast a vote during this block.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### proposalEta

```solidity
function proposalEta(uint256 proposalId) external view returns (uint256)
```

module:core

*The time when a queued proposal becomes executable (&quot;ETA&quot;). Unlike {proposalSnapshot} and {proposalDeadline}, this doesn&#39;t use the governor clock, and instead relies on the executor&#39;s clock which may be different. In most cases this will be a timestamp.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### proposalNeedsQueuing

```solidity
function proposalNeedsQueuing(uint256 proposalId) external view returns (bool)
```

module:core

*Whether a proposal needs to be queued before execution.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### proposalProposer

```solidity
function proposalProposer(uint256 proposalId) external view returns (address)
```

module:core

*The account that created a proposal.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### proposalSnapshot

```solidity
function proposalSnapshot(uint256 proposalId) external view returns (uint256)
```

module:core

*Timepoint used to retrieve user&#39;s votes and quorum. If using block number (as per Compound&#39;s Comp), the snapshot is performed at the end of this block. Hence, voting for this proposal starts at the beginning of the following block.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### proposalThreshold

```solidity
function proposalThreshold() external view returns (uint256)
```

module:core

*The number of votes required in order for a voter to become a proposer.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### propose

```solidity
function propose(address[] targets, uint256[] values, bytes[] calldatas, string description) external nonpayable returns (uint256 proposalId)
```



*Create a new proposal. Vote start after a delay specified by {IGovernor-votingDelay} and lasts for a duration specified by {IGovernor-votingPeriod}. Emits a {ProposalCreated} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| targets | address[] | undefined |
| values | uint256[] | undefined |
| calldatas | bytes[] | undefined |
| description | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

### queue

```solidity
function queue(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) external nonpayable returns (uint256 proposalId)
```



*Queue a proposal. Some governors require this step to be performed before execution can happen. If queuing is not necessary, this function may revert. Queuing a proposal requires the quorum to be reached, the vote to be successful, and the deadline to be reached. Emits a {ProposalQueued} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| targets | address[] | undefined |
| values | uint256[] | undefined |
| calldatas | bytes[] | undefined |
| descriptionHash | bytes32 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

### quorum

```solidity
function quorum(uint256 timepoint) external view returns (uint256)
```

module:user-config

*Minimum number of cast voted required for a proposal to be successful. NOTE: The `timepoint` parameter corresponds to the snapshot used for counting vote. This allows to scale the quorum depending on values such as the totalSupply of a token at this timepoint (see {ERC20Votes}).*

#### Parameters

| Name | Type | Description |
|---|---|---|
| timepoint | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### state

```solidity
function state(uint256 proposalId) external view returns (enum IGovernor.ProposalState)
```

module:core

*Current state of a proposal, following Compound&#39;s convention*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum IGovernor.ProposalState | undefined |

### supportsInterface

```solidity
function supportsInterface(bytes4 interfaceId) external view returns (bool)
```



*Returns true if this contract implements the interface defined by `interfaceId`. See the corresponding https://eips.ethereum.org/EIPS/eip-165#how-interfaces-are-identified[EIP section] to learn more about how these ids are created. This function call must use less than 30 000 gas.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| interfaceId | bytes4 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### version

```solidity
function version() external view returns (string)
```

module:core

*Version of the governor instance (used in building the ERC712 domain separator). Default: &quot;1&quot;*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### votingDelay

```solidity
function votingDelay() external view returns (uint256)
```

module:user-config

*Delay, between the proposal is created and the vote starts. The unit this duration is expressed in depends on the clock (see EIP-6372) this contract uses. This can be increased to leave time for users to buy voting power, or delegate it, before the voting of a proposal starts. NOTE: While this interface returns a uint256, timepoints are stored as uint48 following the ERC-6372 clock type. Consequently this value must fit in a uint48 (when added to the current clock). See {IERC6372-clock}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### votingPeriod

```solidity
function votingPeriod() external view returns (uint256)
```

module:user-config

*Delay between the vote start and vote end. The unit this duration is expressed in depends on the clock (see EIP-6372) this contract uses. NOTE: The {votingDelay} can delay the start of the vote. This must be considered when setting the voting duration compared to the voting delay. NOTE: This value is stored when the proposal is submitted so that possible changes to the value do not affect proposals that have already been submitted. The type used to save it is a uint32. Consequently, while this interface returns a uint256, the value it returns should fit in a uint32.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |



## Events

### ProposalCanceled

```solidity
event ProposalCanceled(uint256 proposalId)
```



*Emitted when a proposal is canceled.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId  | uint256 | undefined |

### ProposalCreated

```solidity
event ProposalCreated(uint256 proposalId, address proposer, address[] targets, uint256[] values, string[] signatures, bytes[] calldatas, uint256 voteStart, uint256 voteEnd, string description)
```



*Emitted when a proposal is created.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId  | uint256 | undefined |
| proposer  | address | undefined |
| targets  | address[] | undefined |
| values  | uint256[] | undefined |
| signatures  | string[] | undefined |
| calldatas  | bytes[] | undefined |
| voteStart  | uint256 | undefined |
| voteEnd  | uint256 | undefined |
| description  | string | undefined |

### ProposalExecuted

```solidity
event ProposalExecuted(uint256 proposalId)
```



*Emitted when a proposal is executed.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId  | uint256 | undefined |

### ProposalQueued

```solidity
event ProposalQueued(uint256 proposalId, uint256 etaSeconds)
```



*Emitted when a proposal is queued.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId  | uint256 | undefined |
| etaSeconds  | uint256 | undefined |

### VoteCast

```solidity
event VoteCast(address indexed voter, uint256 proposalId, uint8 support, uint256 weight, string reason)
```



*Emitted when a vote is cast without params. Note: `support` values should be seen as buckets. Their interpretation depends on the voting module used.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| voter `indexed` | address | undefined |
| proposalId  | uint256 | undefined |
| support  | uint8 | undefined |
| weight  | uint256 | undefined |
| reason  | string | undefined |

### VoteCastWithParams

```solidity
event VoteCastWithParams(address indexed voter, uint256 proposalId, uint8 support, uint256 weight, string reason, bytes params)
```



*Emitted when a vote is cast with params. Note: `support` values should be seen as buckets. Their interpretation depends on the voting module used. `params` are additional encoded parameters. Their interpepretation also depends on the voting module used.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| voter `indexed` | address | undefined |
| proposalId  | uint256 | undefined |
| support  | uint8 | undefined |
| weight  | uint256 | undefined |
| reason  | string | undefined |
| params  | bytes | undefined |



## Errors

### GovernorAlreadyCastVote

```solidity
error GovernorAlreadyCastVote(address voter)
```



*The vote was already cast.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| voter | address | undefined |

### GovernorAlreadyQueuedProposal

```solidity
error GovernorAlreadyQueuedProposal(uint256 proposalId)
```



*The proposal has already been queued.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

### GovernorDisabledDeposit

```solidity
error GovernorDisabledDeposit()
```



*Token deposits are disabled in this contract.*


### GovernorInsufficientProposerVotes

```solidity
error GovernorInsufficientProposerVotes(address proposer, uint256 votes, uint256 threshold)
```



*The `proposer` does not have the required votes to create a proposal.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposer | address | undefined |
| votes | uint256 | undefined |
| threshold | uint256 | undefined |

### GovernorInvalidProposalLength

```solidity
error GovernorInvalidProposalLength(uint256 targets, uint256 calldatas, uint256 values)
```



*Empty proposal or a mismatch between the parameters length for a proposal call.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| targets | uint256 | undefined |
| calldatas | uint256 | undefined |
| values | uint256 | undefined |

### GovernorInvalidSignature

```solidity
error GovernorInvalidSignature(address voter)
```



*The provided signature is not valid for the expected `voter`. If the `voter` is a contract, the signature is not valid using {IERC1271-isValidSignature}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| voter | address | undefined |

### GovernorInvalidVoteType

```solidity
error GovernorInvalidVoteType()
```



*The vote type used is not valid for the corresponding counting module.*


### GovernorInvalidVotingPeriod

```solidity
error GovernorInvalidVotingPeriod(uint256 votingPeriod)
```



*The voting period set is not a valid period.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| votingPeriod | uint256 | undefined |

### GovernorNonexistentProposal

```solidity
error GovernorNonexistentProposal(uint256 proposalId)
```



*The `proposalId` doesn&#39;t exist.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

### GovernorNotQueuedProposal

```solidity
error GovernorNotQueuedProposal(uint256 proposalId)
```



*The proposal hasn&#39;t been queued yet.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |

### GovernorOnlyExecutor

```solidity
error GovernorOnlyExecutor(address account)
```



*The `account` is not the governance executor.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### GovernorOnlyProposer

```solidity
error GovernorOnlyProposer(address account)
```



*The `account` is not a proposer.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### GovernorQueueNotImplemented

```solidity
error GovernorQueueNotImplemented()
```



*Queue operation is not implemented for this governor. Execute should be called directly.*


### GovernorRestrictedProposer

```solidity
error GovernorRestrictedProposer(address proposer)
```



*The `proposer` is not allowed to create a proposal.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposer | address | undefined |

### GovernorUnexpectedProposalState

```solidity
error GovernorUnexpectedProposalState(uint256 proposalId, enum IGovernor.ProposalState current, bytes32 expectedStates)
```



*The current state of a proposal is not the required for performing an operation. The `expectedStates` is a bitmap with the bits enabled for each ProposalState enum position counting from right to left. NOTE: If `expectedState` is `bytes32(0)`, the proposal is expected to not be in any state (i.e. not exist). This is the case when a proposal that is expected to be unset is already initiated (the proposal is duplicated). See {Governor-_encodeStateBitmap}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |
| current | enum IGovernor.ProposalState | undefined |
| expectedStates | bytes32 | undefined |


