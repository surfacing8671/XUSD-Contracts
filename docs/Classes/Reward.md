# Reward



> Reward Contract

This contract distributes rewards to traders based on their trading activity.



## Methods

### distributeReward

```solidity
function distributeReward(address traderAddress, uint256 rewardAmount) external nonpayable
```

Distributes reward to a trader



#### Parameters

| Name | Type | Description |
|---|---|---|
| traderAddress | address | Address of the trader to receive the reward |
| rewardAmount | uint256 | Amount of reward to distribute |

### exchangeContract

```solidity
function exchangeContract() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### getExchangeContract

```solidity
function getExchangeContract() external view returns (address)
```

Gets the address of the associated exchange contract




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | Address of the exchange contract |

### getTraderWithdrawnReward

```solidity
function getTraderWithdrawnReward(address traderAddress) external view returns (uint256)
```

Gets the withdrawn reward for a trader



#### Parameters

| Name | Type | Description |
|---|---|---|
| traderAddress | address | Address of the trader |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | Withdrawn reward for the trader |

### mockTokenContract

```solidity
function mockTokenContract() external view returns (contract IMockERC20)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract IMockERC20 | undefined |

### owner

```solidity
function owner() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### rewards

```solidity
function rewards(address) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### setExchangeContract

```solidity
function setExchangeContract(address _exchangeContract) external nonpayable
```

Sets the address of the associated exchange contract



#### Parameters

| Name | Type | Description |
|---|---|---|
| _exchangeContract | address | Address of the exchange contract |

### withdraw

```solidity
function withdraw() external nonpayable
```

Withdraws the contract&#39;s ERC20 token balance to the owner






## Events

### RewardDistributed

```solidity
event RewardDistributed(address indexed traderAddress, uint256 reward, uint256 timestamp)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| traderAddress `indexed` | address | undefined |
| reward  | uint256 | undefined |
| timestamp  | uint256 | undefined |



