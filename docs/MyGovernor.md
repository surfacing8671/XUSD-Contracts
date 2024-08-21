# MyGovernor









## Methods

### VoterTallyMap

```solidity
function VoterTallyMap(address) external view returns (address classAddress, uint256 voteTotal, uint256 index, uint256 timestampStart, uint256 totalNft, string name, string description, bool approved, bool rewards, bool process, uint256 classType)
```

Mapping of vote tallies by class address



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

Check the votes for a specific class address and finalize the proposal if the vote passes



#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress | address | The address of the class being voted on |

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
function showActiveVibes() external view returns (struct MyGovernor.VoteTally[])
```

Retrieves all approved vote proposals (active vibes)




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | MyGovernor.VoteTally[] | voters An array of VoteTally structs representing all approved vote proposals |

### showAllProposals

```solidity
function showAllProposals() external view returns (struct MyGovernor.VoteTally[])
```

Retrieves all active vote proposals




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | MyGovernor.VoteTally[] | voters An array of VoteTally structs representing all active vote proposals |

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

Cast a vote for a specific class address



#### Parameters

| Name | Type | Description |
|---|---|---|
| classAddress | address | The address of the class being voted on |




## Errors

### AlreadyPassed

```solidity
error AlreadyPassed()
```






### AlreadyProposed

```solidity
error AlreadyProposed()
```






### NeedAVibePass

```solidity
error NeedAVibePass()
```






### NotAllowedAccess

```solidity
error NotAllowedAccess()
```







