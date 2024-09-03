# MyGovernor









## Methods

### VoterTallyMap

```solidity
function VoterTallyMap(address) external view returns (address classAddress, uint256 voteTotal, uint256 index, uint256 timestampStart, uint256 totalNft, string name, string description, bool approved, bool rewards, bool process, uint256 classType)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| voteTotal | uint256 | undefined |
| index | uint256 | undefined |
| timestampStart | uint256 | undefined |
| totalNft | uint256 | undefined |
| name | string | undefined |
| description | string | undefined |
| approved | bool | undefined |
| rewards | bool | undefined |
| process | bool | undefined |
| classType | uint256 | undefined |

### checkVotes

```solidity
function checkVotes(address classAddress) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |

### denominator

```solidity
function denominator() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### propose

```solidity
function propose(MyGovernor.VoteProposal proposal, address classAddress) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| proposal | MyGovernor.VoteProposal | undefined |
| classAddress | address | undefined |

### showActiveVibes

```solidity
function showActiveVibes(uint256 limit, uint256 offset) external view returns (struct MyGovernor.VoteTally[])
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| limit | uint256 | undefined |
| offset | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | MyGovernor.VoteTally[] | undefined |

### showAllProposals

```solidity
function showAllProposals(uint256 limit, uint256 offset) external view returns (struct MyGovernor.VoteTally[])
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| limit | uint256 | undefined |
| offset | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | MyGovernor.VoteTally[] | undefined |

### updateNft

```solidity
function updateNft(address _Nft) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _Nft | address | undefined |

### updateVoteDen

```solidity
function updateVoteDen(uint256 _denominator) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _denominator | uint256 | undefined |

### vote

```solidity
function vote(address classAddress) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |



## Events

### ProposalFailed

```solidity
event ProposalFailed(address indexed classAddress, string reason)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress `indexed` | address | undefined |
| reason  | string | undefined |

### VoteCast

```solidity
event VoteCast(address indexed voter, address indexed classAddress, uint256 voteTotal)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| voter `indexed` | address | undefined |
| classAddress `indexed` | address | undefined |
| voteTotal  | uint256 | undefined |

### VoteChecked

```solidity
event VoteChecked(address indexed classAddress, bool approved, uint256 totalVotes)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress `indexed` | address | undefined |
| approved  | bool | undefined |
| totalVotes  | uint256 | undefined |

### VoteDenominatorUpdated

```solidity
event VoteDenominatorUpdated(uint256 oldDenominator, uint256 newDenominator)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| oldDenominator  | uint256 | undefined |
| newDenominator  | uint256 | undefined |

### VoteProposed

```solidity
event VoteProposed(address indexed classAddress, string name, string description, uint256 classType, bool process, bool rewards)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress `indexed` | address | undefined |
| name  | string | undefined |
| description  | string | undefined |
| classType  | uint256 | undefined |
| process  | bool | undefined |
| rewards  | bool | undefined |



## Errors

### AlreadyPassed

```solidity
error AlreadyPassed()
```






### AlreadyProposed

```solidity
error AlreadyProposed()
```






### InvalidDenominator

```solidity
error InvalidDenominator()
```






### NeedAVibePass

```solidity
error NeedAVibePass()
```






### NotAllowedAccess

```solidity
error NotAllowedAccess()
```






### ReentrancyGuardReentrantCall

```solidity
error ReentrancyGuardReentrantCall()
```



*Unauthorized reentrant call.*


### classAddressNotMatch

```solidity
error classAddressNotMatch()
```







