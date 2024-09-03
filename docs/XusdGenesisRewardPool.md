# XusdGenesisRewardPool









## Methods

### Xusd

```solidity
function Xusd() external view returns (contract IERC20)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract IERC20 | undefined |

### XusdPerSecond

```solidity
function XusdPerSecond() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### add

```solidity
function add(uint256 _allocPoint, contract IERC20 _token, bool _withUpdate, uint256 _lastRewardTime, uint256 _maxDeposit) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _allocPoint | uint256 | undefined |
| _token | contract IERC20 | undefined |
| _withUpdate | bool | undefined |
| _lastRewardTime | uint256 | undefined |
| _maxDeposit | uint256 | undefined |

### comissionPercent

```solidity
function comissionPercent() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### comissionToken

```solidity
function comissionToken(uint256 index) external view returns (address)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| index | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### comissionTokensCount

```solidity
function comissionTokensCount() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### deposit

```solidity
function deposit(uint256 _pid, uint256 _amount) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _pid | uint256 | undefined |
| _amount | uint256 | undefined |

### emergencyWithdraw

```solidity
function emergencyWithdraw(uint256 _pid) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _pid | uint256 | undefined |

### getGeneratedReward

```solidity
function getGeneratedReward(uint256 _fromTime, uint256 _toTime) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _fromTime | uint256 | undefined |
| _toTime | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### governanceRecoverUnsupported

```solidity
function governanceRecoverUnsupported(contract IERC20 _token, uint256 amount, address to) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _token | contract IERC20 | undefined |
| amount | uint256 | undefined |
| to | address | undefined |

### massUpdatePools

```solidity
function massUpdatePools() external nonpayable
```






### operator

```solidity
function operator() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### pendingXusd

```solidity
function pendingXusd(uint256 _pid, address _user) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _pid | uint256 | undefined |
| _user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### poolEndTime

```solidity
function poolEndTime() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### poolInfo

```solidity
function poolInfo(uint256) external view returns (contract IERC20 token, uint256 allocPoint, uint256 lastRewardTime, uint256 accXusdPerShare, bool isStarted, uint256 maxDeposit)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| token | contract IERC20 | undefined |
| allocPoint | uint256 | undefined |
| lastRewardTime | uint256 | undefined |
| accXusdPerShare | uint256 | undefined |
| isStarted | bool | undefined |
| maxDeposit | uint256 | undefined |

### poolStartTime

```solidity
function poolStartTime() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### runningTime

```solidity
function runningTime() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### set

```solidity
function set(uint256 _pid, uint256 _allocPoint) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _pid | uint256 | undefined |
| _allocPoint | uint256 | undefined |

### setOperator

```solidity
function setOperator(address _operator) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _operator | address | undefined |

### totalAllocPoint

```solidity
function totalAllocPoint() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### totalRewards

```solidity
function totalRewards() external view returns (uint256)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### updatePool

```solidity
function updatePool(uint256 _pid) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _pid | uint256 | undefined |

### userInfo

```solidity
function userInfo(uint256, address) external view returns (uint256 amount, uint256 rewardDebt)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |
| _1 | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| amount | uint256 | undefined |
| rewardDebt | uint256 | undefined |

### withdraw

```solidity
function withdraw(uint256 _pid, uint256 _amount) external nonpayable
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| _pid | uint256 | undefined |
| _amount | uint256 | undefined |



## Events

### Deposit

```solidity
event Deposit(address indexed user, uint256 indexed pid, uint256 amount)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| pid `indexed` | uint256 | undefined |
| amount  | uint256 | undefined |

### EmergencyWithdraw

```solidity
event EmergencyWithdraw(address indexed user, uint256 indexed pid, uint256 amount)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| pid `indexed` | uint256 | undefined |
| amount  | uint256 | undefined |

### RewardPaid

```solidity
event RewardPaid(address indexed user, uint256 amount)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| amount  | uint256 | undefined |

### Withdraw

```solidity
event Withdraw(address indexed user, uint256 indexed pid, uint256 amount)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user `indexed` | address | undefined |
| pid `indexed` | uint256 | undefined |
| amount  | uint256 | undefined |



