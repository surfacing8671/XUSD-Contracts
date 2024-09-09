# Exchange



> Exchange Contract

This contract facilitates trading on the exchange and distributes rewards to traders.



## Methods

### DAILY_LIMIT

```solidity
function DAILY_LIMIT() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### DAILY_LP_LIMIT

```solidity
function DAILY_LP_LIMIT() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### LpDailyLimit

```solidity
function LpDailyLimit(address, uint256) external view returns (uint256 marketVolume, uint256 lastTradeTime, uint256 amountRewards, bool active)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| marketVolume | uint256 | undefined |
| lastTradeTime | uint256 | undefined |
| amountRewards | uint256 | undefined |
| active | bool | undefined |

### MAXREWARDS

```solidity
function MAXREWARDS() external view returns (uint256)
```






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

### PERIOD_DURATION

```solidity
function PERIOD_DURATION() external view returns (uint256)
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

### TotalRewards

```solidity
function TotalRewards() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### UserActiveList

```solidity
function UserActiveList(uint256) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### VIBE_RANK

```solidity
function VIBE_RANK() external view returns (int256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### accessControl

```solidity
function accessControl() external view returns (contract IAccessManager)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract IAccessManager | undefined |

### addRewards

```solidity
function addRewards(uint256 amounts) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| amounts | uint256 | undefined |

### addToWhiteList

```solidity
function addToWhiteList(address account) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### addToWhiteListAdmin

```solidity
function addToWhiteListAdmin(address account) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

### calculateRewards

```solidity
function calculateRewards(address to, address from, address caller, address sender, uint256 amount, int256 vibes) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | undefined |
| from | address | undefined |
| caller | address | undefined |
| sender | address | undefined |
| amount | uint256 | undefined |
| vibes | int256 | undefined |

### calculateTotalBasisFee

```solidity
function calculateTotalBasisFee(address addy, uint256 amount) external nonpayable returns (int256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| addy | address | undefined |
| amount | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | int256 | undefined |

### claimReward

```solidity
function claimReward() external nonpayable
```






### description

```solidity
function description() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### getCurrentPeriod

```solidity
function getCurrentPeriod() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getDescription

```solidity
function getDescription() external view returns (string)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### getLevel

```solidity
function getLevel() external view returns (enum VibeBase.Importance)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | enum VibeBase.Importance | undefined |

### getTraderCurrentPeriodRewards

```solidity
function getTraderCurrentPeriodRewards(address traderAddress) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| traderAddress | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getTraderCurrentPeriodStatus

```solidity
function getTraderCurrentPeriodStatus(address traderAddress) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| traderAddress | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### getTraderReward

```solidity
function getTraderReward(address traderAddress) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| traderAddress | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### getUsersRewards

```solidity
function getUsersRewards(address user) external view returns (uint256[])
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256[] | undefined |

### id

```solidity
function id() external view returns (address creatorAddress, string info, enum VibeBase.Importance level)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| creatorAddress | address | undefined |
| info | string | undefined |
| level | enum VibeBase.Importance | undefined |

### periodStartTime

```solidity
function periodStartTime() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### periods

```solidity
function periods(uint256) external view returns (uint256 marketVolume, uint256 lastTradeTime, uint256 amountRewards, bool active)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| marketVolume | uint256 | undefined |
| lastTradeTime | uint256 | undefined |
| amountRewards | uint256 | undefined |
| active | bool | undefined |

### rewardContract

```solidity
function rewardContract() external view returns (contract IReward)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract IReward | undefined |

### setBaseImportance

```solidity
function setBaseImportance(enum VibeBase.Importance level) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| level | enum VibeBase.Importance | undefined |

### setDailyAmounts

```solidity
function setDailyAmounts(uint256 amounts) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| amounts | uint256 | undefined |

### setTotalAmount

```solidity
function setTotalAmount(uint256 amounts) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| amounts | uint256 | undefined |

### setUserAmounts

```solidity
function setUserAmounts(uint256 amounts) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| amounts | uint256 | undefined |

### setVibeRank

```solidity
function setVibeRank(int256 vibes) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| vibes | int256 | undefined |

### showTrader

```solidity
function showTrader(address user) external view returns (struct Exchange.Trader)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | Exchange.Trader | undefined |

### submitted

```solidity
function submitted(address) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### traderPeriodRewards

```solidity
function traderPeriodRewards(address, uint256) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### traderPeriodStatus

```solidity
function traderPeriodStatus(address, uint256) external view returns (bool)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### traderPeriodVolume

```solidity
function traderPeriodVolume(address, uint256) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |
| _1 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### traders

```solidity
function traders(address) external view returns (uint256 lastTradeTime, uint256 cumulativeTradingVolume, uint256 totalReward, uint256 withdrawnRewards)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| lastTradeTime | uint256 | undefined |
| cumulativeTradingVolume | uint256 | undefined |
| totalReward | uint256 | undefined |
| withdrawnRewards | uint256 | undefined |

### xusd

```solidity
function xusd() external view returns (contract XUSD)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract XUSD | undefined |




## Errors

### UnauthorizedAccess

```solidity
error UnauthorizedAccess(enum IAccessManager.Rank roleId, address addr)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| roleId | enum IAccessManager.Rank | undefined |
| addr | address | undefined |


