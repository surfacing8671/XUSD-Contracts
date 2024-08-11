# GovernorSettings







*Extension of {Governor} for settings updatable through governance.*

## Methods

### BALLOT_TYPEHASH

```solidity
function BALLOT_TYPEHASH() external view returns (bytes32)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes32 | undefined |

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

### EXTENDED_BALLOT_TYPEHASH

```solidity
function EXTENDED_BALLOT_TYPEHASH() external view returns (bytes32)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes32 | undefined |

### cancel

```solidity
function cancel(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) external nonpayable returns (uint256)
```



*See {IGovernor-cancel}.*

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

### castVote

```solidity
function castVote(uint256 proposalId, uint8 support) external nonpayable returns (uint256)
```



*See {IGovernor-castVote}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |
| support | uint8 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### castVoteBySig

```solidity
function castVoteBySig(uint256 proposalId, uint8 support, address voter, bytes signature) external nonpayable returns (uint256)
```



*See {IGovernor-castVoteBySig}.*

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
| _0 | uint256 | undefined |

### castVoteWithReason

```solidity
function castVoteWithReason(uint256 proposalId, uint8 support, string reason) external nonpayable returns (uint256)
```



*See {IGovernor-castVoteWithReason}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| proposalId | uint256 | undefined |
| support | uint8 | undefined |
| reason | string | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### castVoteWithReasonAndParams

```solidity
function castVoteWithReasonAndParams(uint256 proposalId, uint8 support, string reason, bytes params) external nonpayable returns (uint256)
```



*See {IGovernor-castVoteWithReasonAndParams}.*

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
| _0 | uint256 | undefined |

### castVoteWithReasonAndParamsBySig

```solidity
function castVoteWithReasonAndParamsBySig(uint256 proposalId, uint8 support, address voter, string reason, bytes params, bytes signature) external nonpayable returns (uint256)
```



*See {IGovernor-castVoteWithReasonAndParamsBySig}.*

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
| _0 | uint256 | undefined |

### clock

```solidity
function clock() external view returns (uint48)
```



*Clock used for flagging checkpoints. Can be overridden to implement timestamp based checkpoints (and voting).*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint48 | undefined |

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

### execute

```solidity
function execute(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) external payable returns (uint256)
```



*See {IGovernor-execute}.*

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

### getVotes

```solidity
function getVotes(address account, uint256 timepoint) external view returns (uint256)
```



*See {IGovernor-getVotes}.*

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



*See {IGovernor-getVotesWithParams}.*

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



*See {IGovernor-hashProposal}. The proposal id is produced by hashing the ABI encoded `targets` array, the `values` array, the `calldatas` array and the descriptionHash (bytes32 which itself is the keccak256 hash of the description string). This proposal id can be produced from the proposal data which is part of the {ProposalCreated} event. It can even be computed in advance, before the proposal is submitted. Note that the chainId and the governor address are not part of the proposal id computation. Consequently, the same proposal (with same operation and same description) will have the same id if submitted on multiple governors across multiple networks. This also means that in order to execute the same operation twice (on the same governor) the proposer will have to change the description in order to avoid proposal id conflicts.*

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



*See {IGovernor-name}.*


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

### onERC1155BatchReceived

```solidity
function onERC1155BatchReceived(address, address, uint256[], uint256[], bytes) external nonpayable returns (bytes4)
```



*See {IERC1155Receiver-onERC1155BatchReceived}. Receiving tokens is disabled if the governance executor is other than the governor itself (eg. when using with a timelock).*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | address | undefined |
| _2 | uint256[] | undefined |
| _3 | uint256[] | undefined |
| _4 | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes4 | undefined |

### onERC1155Received

```solidity
function onERC1155Received(address, address, uint256, uint256, bytes) external nonpayable returns (bytes4)
```



*See {IERC1155Receiver-onERC1155Received}. Receiving tokens is disabled if the governance executor is other than the governor itself (eg. when using with a timelock).*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | address | undefined |
| _2 | uint256 | undefined |
| _3 | uint256 | undefined |
| _4 | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes4 | undefined |

### onERC721Received

```solidity
function onERC721Received(address, address, uint256, bytes) external nonpayable returns (bytes4)
```



*See {IERC721Receiver-onERC721Received}. Receiving tokens is disabled if the governance executor is other than the governor itself (eg. when using with a timelock).*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | address | undefined |
| _2 | uint256 | undefined |
| _3 | bytes | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bytes4 | undefined |

### proposalDeadline

```solidity
function proposalDeadline(uint256 proposalId) external view returns (uint256)
```



*See {IGovernor-proposalDeadline}.*

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



*See {IGovernor-proposalEta}.*

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
function proposalNeedsQueuing(uint256) external view returns (bool)
```



*See {IGovernor-proposalNeedsQueuing}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### proposalProposer

```solidity
function proposalProposer(uint256 proposalId) external view returns (address)
```



*See {IGovernor-proposalProposer}.*

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



*See {IGovernor-proposalSnapshot}.*

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



*See {Governor-proposalThreshold}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### propose

```solidity
function propose(address[] targets, uint256[] values, bytes[] calldatas, string description) external nonpayable returns (uint256)
```



*See {IGovernor-propose}. This function has opt-in frontrunning protection, described in {_isValidDescriptionForProposer}.*

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
| _0 | uint256 | undefined |

### queue

```solidity
function queue(address[] targets, uint256[] values, bytes[] calldatas, bytes32 descriptionHash) external nonpayable returns (uint256)
```



*See {IGovernor-queue}.*

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

### relay

```solidity
function relay(address target, uint256 value, bytes data) external payable
```



*Relays a transaction or function call to an arbitrary target. In cases where the governance executor is some contract other than the governor itself, like when using a timelock, this function can be invoked in a governance proposal to recover tokens or Ether that was sent to the governor contract by mistake. Note that if the executor is simply the governor itself, use of `relay` is redundant.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| target | address | undefined |
| value | uint256 | undefined |
| data | bytes | undefined |

### setProposalThreshold

```solidity
function setProposalThreshold(uint256 newProposalThreshold) external nonpayable
```



*Update the proposal threshold. This operation can only be performed through a governance proposal. Emits a {ProposalThresholdSet} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newProposalThreshold | uint256 | undefined |

### setVotingDelay

```solidity
function setVotingDelay(uint48 newVotingDelay) external nonpayable
```



*Update the voting delay. This operation can only be performed through a governance proposal. Emits a {VotingDelaySet} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newVotingDelay | uint48 | undefined |

### setVotingPeriod

```solidity
function setVotingPeriod(uint32 newVotingPeriod) external nonpayable
```



*Update the voting period. This operation can only be performed through a governance proposal. Emits a {VotingPeriodSet} event.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newVotingPeriod | uint32 | undefined |

### state

```solidity
function state(uint256 proposalId) external view returns (enum IGovernor.ProposalState)
```



*See {IGovernor-state}.*

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



*See {IERC165-supportsInterface}.*

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



*See {IGovernor-version}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### votingDelay

```solidity
function votingDelay() external view returns (uint256)
```



*See {IGovernor-votingDelay}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### votingPeriod

```solidity
function votingPeriod() external view returns (uint256)
```



*See {IGovernor-votingPeriod}.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |



## Events

### EIP712DomainChanged

```solidity
event EIP712DomainChanged()
```



*MAY be emitted to signal that the domain could have changed.*


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

### ProposalThresholdSet

```solidity
event ProposalThresholdSet(uint256 oldProposalThreshold, uint256 newProposalThreshold)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| oldProposalThreshold  | uint256 | undefined |
| newProposalThreshold  | uint256 | undefined |

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

### VotingDelaySet

```solidity
event VotingDelaySet(uint256 oldVotingDelay, uint256 newVotingDelay)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| oldVotingDelay  | uint256 | undefined |
| newVotingDelay  | uint256 | undefined |

### VotingPeriodSet

```solidity
event VotingPeriodSet(uint256 oldVotingPeriod, uint256 newVotingPeriod)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| oldVotingPeriod  | uint256 | undefined |
| newVotingPeriod  | uint256 | undefined |



## Errors

### FailedInnerCall

```solidity
error FailedInnerCall()
```



*A call to an address target failed. The target may have reverted.*


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

### InvalidShortString

```solidity
error InvalidShortString()
```






### QueueEmpty

```solidity
error QueueEmpty()
```



*An operation (e.g. {front}) couldn&#39;t be completed due to the queue being empty.*


### QueueFull

```solidity
error QueueFull()
```



*A push operation couldn&#39;t be completed due to the queue being full.*


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

### StringTooLong

```solidity
error StringTooLong(string str)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| str | string | undefined |


