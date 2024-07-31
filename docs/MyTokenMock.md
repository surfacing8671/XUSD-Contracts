# MyTokenMock



> MyTokenMock



*Implementation of a mock token with tax functionalities.*

## Methods

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
function approve(address spender, uint256 amount) external nonpayable returns (bool)
```



*See {IERC20-approve}.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| amount | uint256 | undefined |

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

### burn

```solidity
function burn() external view returns (address)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### decimals

```solidity
function decimals() external view returns (uint8)
```



*Returns the number of decimals used to get its user representation.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint8 | undefined |

### decreaseAllowance

```solidity
function decreaseAllowance(address spender, uint256 subtractedValue) external nonpayable returns (bool)
```



*Atomically decreases the allowance granted to `spender` by the caller.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| subtractedValue | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### feeBasisPoints

```solidity
function feeBasisPoints() external view returns (uint256)
```

The fee rate in basis points (1 basis point = 0.01%).




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### feeRecipient

```solidity
function feeRecipient() external view returns (address)
```

The address that will receive the collected fees.




#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### getUserBurn

```solidity
function getUserBurn(address user) external view returns (uint256)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| user | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

### increaseAllowance

```solidity
function increaseAllowance(address spender, uint256 addedValue) external nonpayable returns (bool)
```



*Atomically increases the allowance granted to `spender` by the caller.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| spender | address | undefined |
| addedValue | uint256 | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### isExcludedFromTaxFee

```solidity
function isExcludedFromTaxFee(address account) external view returns (bool)
```



*Returns the status of exclusion from tax fee mechanism for a given account.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| account | address | undefined |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### mint

```solidity
function mint(address to, uint256 amount) external nonpayable
```



*Mints new tokens.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | The address to mint the tokens to. |
| amount | uint256 | The amount of tokens to mint. |

### name

```solidity
function name() external view returns (string)
```



*Returns the name of the token.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### owner

```solidity
function owner() external view returns (address)
```



*Returns the address of the current owner.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### registry

```solidity
function registry() external view returns (contract TUSDRegistry)
```






#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | contract TUSDRegistry | undefined |

### renounceOwnership

```solidity
function renounceOwnership() external nonpayable
```



*Leaves the contract without owner. It will not be possible to call `onlyOwner` functions anymore. Can only be called by the current owner. NOTE: Renouncing ownership will leave the contract without an owner, thereby removing any functionality that is only available to the owner.*


### setFeeRecipient

```solidity
function setFeeRecipient(address _feeRecipient) external nonpayable
```

Sets a new fee recipient address.



#### Parameters

| Name | Type | Description |
|---|---|---|
| _feeRecipient | address | The new address that will receive the collected fees. |

### setRegistry

```solidity
function setRegistry(address reg) external nonpayable
```



*Sets the registry address.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| reg | address | The address of the registry contract. |

### symbol

```solidity
function symbol() external view returns (string)
```



*Returns the symbol of the token.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | string | undefined |

### taxAddress

```solidity
function taxAddress() external view returns (address)
```



*Returns the deposit address for tax.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | address | undefined |

### taxFeePerMille

```solidity
function taxFeePerMille() external view returns (uint256)
```



*Returns the per mille rate for taxable mechanism.*


#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | uint256 | undefined |

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
function transfer(address to, uint256 amount) external nonpayable returns (bool)
```



*Transfers tokens to `to`. Overrides the base implementation to include tax processing.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| to | address | The address to transfer tokens to. |
| amount | uint256 | The amount of tokens to transfer. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### transferFrom

```solidity
function transferFrom(address from, address to, uint256 amount) external nonpayable returns (bool)
```



*Transfers tokens from `from` to `to` using the allowance mechanism. Overrides the base implementation to include tax processing.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| from | address | The address to transfer tokens from. |
| to | address | The address to transfer tokens to. |
| amount | uint256 | The amount of tokens to transfer. |

#### Returns

| Name | Type | Description |
|---|---|---|
| _0 | bool | undefined |

### transferOwnership

```solidity
function transferOwnership(address newOwner) external nonpayable
```



*Transfers ownership of the contract to a new account (`newOwner`). Can only be called by the current owner.*

#### Parameters

| Name | Type | Description |
|---|---|---|
| newOwner | address | undefined |



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

### FeeBasisPointsUpdated

```solidity
event FeeBasisPointsUpdated(uint256 newFeeBasisPoints)
```

Event emitted when the fee basis points are updated.



#### Parameters

| Name | Type | Description |
|---|---|---|
| newFeeBasisPoints  | uint256 | undefined |

### FeeRecipientUpdated

```solidity
event FeeRecipientUpdated(address newFeeRecipient)
```

Event emitted when the fee recipient is updated.



#### Parameters

| Name | Type | Description |
|---|---|---|
| newFeeRecipient  | address | undefined |

### OwnershipTransferred

```solidity
event OwnershipTransferred(address indexed previousOwner, address indexed newOwner)
```





#### Parameters

| Name | Type | Description |
|---|---|---|
| previousOwner `indexed` | address | undefined |
| newOwner `indexed` | address | undefined |

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



