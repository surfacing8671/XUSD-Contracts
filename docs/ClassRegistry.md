# ClassRegistry



> ClassRegistry



*Manages whitelisted tax classes, processes user basis points, and handles whitelisting logic.*

## Methods

### DailyRewards

```solidity
function DailyRewards(uint256, address) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |
| _1 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### MAX_AMOUNT

```solidity
function MAX_AMOUNT() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### MasterClassCallerMap

```solidity
function MasterClassCallerMap(address) external view returns (address classAddress, uint256 updatedTimestamp, bool active, bool process, string description)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| updatedTimestamp | uint256 | undefined |
| active | bool | undefined |
| process | bool | undefined |
| description | string | undefined |

### MasterClassContractMap

```solidity
function MasterClassContractMap(address) external view returns (address classAddress, bool active, bool process, string description)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| active | bool | undefined |
| process | bool | undefined |
| description | string | undefined |

### MasterClassFromMap

```solidity
function MasterClassFromMap(address) external view returns (address classAddress, uint256 updatedTimestamp, bool active, bool process, string description)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| updatedTimestamp | uint256 | undefined |
| active | bool | undefined |
| process | bool | undefined |
| description | string | undefined |

### MasterClassMap

```solidity
function MasterClassMap(address) external view returns (address classAddress, uint256 updatedTimestamp, bool active, bool process, string description)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| updatedTimestamp | uint256 | undefined |
| active | bool | undefined |
| process | bool | undefined |
| description | string | undefined |

### MasterClassToMap

```solidity
function MasterClassToMap(address) external view returns (address classAddress, uint256 updatedTimestamp, bool active, bool process, string description)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| classAddress | address | undefined |
| updatedTimestamp | uint256 | undefined |
| active | bool | undefined |
| process | bool | undefined |
| description | string | undefined |

### RewardBalance

```solidity
function RewardBalance() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### Rewards

```solidity
function Rewards(address) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### addClass

```solidity
function addClass(address class, bool active, uint256 classType, bool _process) external nonpayable
```

Adds a new class to the appropriate registry



#### Parameters

| Name | Type | Description |
|---|---|---|
| class | address | The address of the class to be added |
| active | bool | The active status of the class |
| classType | uint256 | The type of class (0: To, 1: From, 2: Caller, 3: Contract) |
| _process | bool | A boolean indicating if the process is ongoing |

### calculateAndSumBasis

```solidity
function calculateAndSumBasis(address to, address from, address _caller, uint256 amount) external nonpayable returns (int256)
```

Calculates and sums the basis points for a transaction



#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | The address of the recipient |
| from | address | The address of the sender |
| _caller | address | The address of the caller |
| amount | uint256 | The transaction amount |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | The total basis points summed from the transaction |

### caller

```solidity
function caller(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### callerVibe

```solidity
function callerVibe(uint256) external view returns (address userAddress, int256 vibes, uint256 timestamp, bool enter)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| userAddress | address | undefined |
| vibes | int256 | undefined |
| timestamp | uint256 | undefined |
| enter | bool | undefined |

### checkRank

```solidity
function checkRank(address user) external nonpayable
```

Checks and assigns the rank of the user based on their vibe score



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user |

### contractVibe

```solidity
function contractVibe(uint256) external view returns (address userAddress, int256 vibes, uint256 timestamp, bool enter)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| userAddress | address | undefined |
| vibes | int256 | undefined |
| timestamp | uint256 | undefined |
| enter | bool | undefined |

### fromArray

```solidity
function fromArray(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### fromVibe

```solidity
function fromVibe(uint256) external view returns (address userAddress, int256 vibes, uint256 timestamp, bool enter)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| userAddress | address | undefined |
| vibes | int256 | undefined |
| timestamp | uint256 | undefined |
| enter | bool | undefined |

### setGov

```solidity
function setGov(address gove) external nonpayable
```

Assigns the CONSUL rank to the given address



#### Parameters

| Name | Type | Description |
|---|---|---|
| gove | address | The address to assign the CONSUL rank to |

### showRewards

```solidity
function showRewards() external view returns (struct ClassRegistry.RewardClass[])
```

Returns the reward classes in the registry




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | ClassRegistry.RewardClass[] | _rewards An array of RewardClass representing the rewards |

### showVibes

```solidity
function showVibes() external view returns (struct ClassRegistry.MaterClass[][3])
```

Returns the active vibe classes in the registry




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | ClassRegistry.MaterClass[][3] | _vibes A 2D array representing the vibes for To, From, and Caller classes |

### toArray

```solidity
function toArray(uint256) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### toVibe

```solidity
function toVibe(uint256) external view returns (address userAddress, int256 vibes, uint256 timestamp, bool enter)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| userAddress | address | undefined |
| vibes | int256 | undefined |
| timestamp | uint256 | undefined |
| enter | bool | undefined |

### userRewards

```solidity
function userRewards(address) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### vibeFree

```solidity
function vibeFree(address) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### vibes

```solidity
function vibes() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### viewUser

```solidity
function viewUser(address user) external view returns (int256)
```

Returns the vibe score of a given user



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | The vibe score of the user |

### viewVibes

```solidity
function viewVibes(address user) external view returns (int256)
```

Returns the vibe score of a given user



#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | The address of the user |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | The vibe score of the user |

### xusd

```solidity
function xusd() external view returns (contract XUSD)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract XUSD | undefined |



## Events

### CallerStatusChanged

```solidity
event CallerStatusChanged(address indexed caller, bool isWhitelisted)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| caller `indexed` | address | undefined |
| isWhitelisted  | bool | undefined |

### TargetStatusChanged

```solidity
event TargetStatusChanged(address indexed target, bool isWhitelisted)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| target `indexed` | address | undefined |
| isWhitelisted  | bool | undefined |

### WhitelistedClassContractFeeChange

```solidity
event WhitelistedClassContractFeeChange(address indexed newContractClass, bool approval)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newContractClass `indexed` | address | undefined |
| approval  | bool | undefined |

### WhitelistedClassFromFeeChange

```solidity
event WhitelistedClassFromFeeChange(address indexed newFromClass, bool approval)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newFromClass `indexed` | address | undefined |
| approval  | bool | undefined |

### WhitelistedClassToFeeChange

```solidity
event WhitelistedClassToFeeChange(address indexed newToClass, bool approval)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| newToClass `indexed` | address | undefined |
| approval  | bool | undefined |



## Errors

### AlreadyProposed

```solidity
error AlreadyProposed()
```






### ArrayLengthMismatch

```solidity
error ArrayLengthMismatch()
```






### FeeAboveMaxLimit

```solidity
error FeeAboveMaxLimit()
```






### InvalidReferralCode

```solidity
error InvalidReferralCode()
```






### NotAllowedAccess

```solidity
error NotAllowedAccess()
```







