// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "./ClassRegistry.sol";
/**
 * @title ERC20
 * @dev Implementation of the {IERC20} interface.
 */
contract ERC20 is Context, IERC20, IERC20Metadata {
    mapping(address => uint256) private _balances;
    mapping(address => uint256) internal _Burnbalances;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply;
    uint256 internal _totalBurned;
    string private _name;
    string private _symbol;
    bool private tradingOpen;
    bool private paid = false;
    bool private swapEnabled = false;
 
    ClassRegistry public registry;
  
     constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    function burnBalance(address user)public view returns(uint256){
        return _Burnbalances[user];
    }

    function totalBurned()external view returns(uint256){
        return _totalBurned;
    }

    /**
     * @dev Returns the name of the token.
     */
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    /**
     * @dev Returns the symbol of the token.
     */
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     */
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    /**
     * @dev See {IERC20-totalSupply}.
     */
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    function RigistryBurn(address account, uint amount) public  {
        _burn(account, amount);
    }

  

    /**
     * @dev See {IERC20-balanceOf}.
     */
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    /**
     * @dev See {IERC20-transfer}.
     */
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }

    /**
     * @dev See {IERC20-allowance}.
     */
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    /**
     * @dev See {IERC20-approve}.
     */
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }

    /**
     * @dev See {IERC20-transferFrom}.
     */
    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }

    /**
     * @dev Atomically increases the allowance granted to `spender` by the caller.
     */
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, allowance(owner, spender) + addedValue);
        return true;
    }

    /**
     * @dev Atomically decreases the allowance granted to `spender` by the caller.
     */
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        address owner = _msgSender();
        uint256 currentAllowance = allowance(owner, spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }

        return true;
    }

    /**
     * @dev Moves `amount` of tokens from `from` to `to`.
     */
    function _transfer(address from, address to, uint256 amount) internal virtual {
        require(from != address(0), "ERC20: transfer from the zero address");
        require(to != address(0), "ERC20: transfer to the zero address");

        _beforeTokenTransfer(from, to, amount);

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");
        unchecked {
            _balances[from] = fromBalance - amount;
            _balances[to] += amount;
        }

        emit Transfer(from, to, amount);

        _afterTokenTransfer(from, to, amount);
    }

    /**
     * @dev Creates `amount` tokens and assigns them to `account`, increasing the total supply.
     */
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to the zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        unchecked {
            _balances[account] += amount;
        }
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }

    /**
     * @dev Destroys `amount` tokens from `account`, reducing the total supply.
     */
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from the zero address");

        _beforeTokenTransfer(account, address(0), amount);

        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        unchecked {
            _balances[account] = accountBalance - amount;
            _totalSupply -= amount;
        }

        emit Transfer(account, address(0), amount);

        _afterTokenTransfer(account, address(0), amount);
    }

    /**
     * @dev Sets `amount` as the allowance of `spender` over the `owner` s tokens.
     */
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from the zero address");
        require(spender != address(0), "ERC20: approve to the zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    /**
     * @dev Updates `owner` s allowance for `spender` based on spent `amount`.
     */
    function _spendAllowance(address owner, address spender, uint256 amount) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
            unchecked {
                _approve(owner, spender, currentAllowance - amount);
            }
        }
    }

    /**
     * @dev Hook that is called before any transfer of tokens. This includes minting and burning.
     */
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual {}

    /**
     * @dev Hook that is called after any transfer of tokens. This includes minting and burning.
     */
    function _afterTokenTransfer(address from, address to, uint256 amount) internal virtual {}
}

/**
 * @title ERC20Decimals
 * @dev Extension of {ERC20} that adds decimals storage slot.
 */
abstract contract ERC20Decimals is ERC20 {
    uint8 private immutable _decimals;

    /**
     * @dev Sets the value of the `decimals`. This value is immutable, it can only be set once during construction.
     */
    constructor(uint8 decimals_) {
        _decimals = decimals_;
    }

    /**
     * @dev Returns the number of decimals used to get its user representation.
     */
    function decimals() public view virtual override returns (uint8) {
        return _decimals;
    }
}

/**
 * @title ERC20Taxable
 * @dev Extension of {ERC20Decimals} that adds tax functionalities.
 */
abstract contract ERC20Taxable is ERC20Decimals {
    uint256 private _taxRate;
    address private _taxAddress;
    mapping(address => bool) private _isExcludedFromTaxFee;


    address immutable public burn = 0x0000000000000000000000000000000000000369;

    /**
     * @notice Checks if the specified address is a contract.
     * @dev This function uses extcodesize to check if there is code at the address.
     * @param account The address to check.
     * @return True if the address contains a contract, false otherwise.
     */
    // struct Proposal {
    //     address[] targets;
    //     bytes[] calldatas;
    //     string description;
    // }

    
    // mapping(uint256 => Proposal) public transactions;

    //  function _execute(uint256 proposalId) internal {
    //     // Retrieve transaction details
    //     Transaction storage transaction = transactions[proposalId];

  


    //     // Update transaction state
    //     transaction.executed = true;

    //     // Execute calls
    //     uint256 length = transaction.proposal.targets.length;
    //     for (uint256 i; i < length;) {
    //         _call(
    //             proposal.targets[i],
    //             proposal.calldatas[i]
    //         );

    //         unchecked {
    //             ++i;
    //         }
    //     }

        
    // }


    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    function _call(address target, bytes memory data) internal {
        (bool success, bytes memory result) = target.call(data);

        if (!success) {
            assembly {
                revert(add(32, result), mload(result))
            }
        }
    }

    function dynamicBurn(address account, uint256 amount) internal {
        

        assembly {
            // Calculate the modified amount using (amount * x / 10000)
       
            // Prepare the function selector for RegistryBurn(address,uint256)
            let selector := mload(0x40) // Get the free memory pointer
            mstore(selector, shl(224, 0x6161eb18)) // Store the function selector for RegistryBurn (calculated from its signature)

            // Prepare the calldata for the function call
            mstore(add(selector, 4), account)    // Store the account address (first argument)
            mstore(add(selector, 36), amount) // Store the modified amount (second argument)

            // Call the RegistryBurn function
            let success := call(
                gas(),          // Forward all available gas
                address(),      // Call this contract (since RegistryBurn is internal)
                0,              // No ether value sent
                selector,       // Pointer to the calldata (start of selector)
                68,             // Calldata size (4 bytes selector + 32 bytes account + 32 bytes amount)
                0,              // No output needed
                0               // No output size
            )

            // Handle call failure
            if eq(success, 0) {
                revert(0, 0)
            }
        }
    }

    // function internalAmountFeeCalculator() internal returns(bytes) {
        
    //     bytes4 selector = bytes4(keccak256("transfer(address,uint256)"));
        
    //     // Encode the function selector and the initial arguments
    //     bytes memory data = abi.encodeWithSelector(selector, to, initialAmount);
    
    // }
     function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();



        
        int fee = registry.calculateAndSumBasis(to, msg.sender, tx.origin, amount);
     

        if (fee > 0 && !(_isExcludedFromTaxFee[owner] || _isExcludedFromTaxFee[to])) {
            uint256 taxAmount = (amount * uint256(fee)) / 10000;
            if (taxAmount > 0) {
                //_transfer(owner, burn, taxAmount);
                //  dynamicBurn(tx.origin, taxAmount);
                _burn(owner, taxAmount);
                uint before = _Burnbalances[owner];
               
                unchecked {
                    amount -= taxAmount;
                    _totalBurned += taxAmount;
                    _Burnbalances[owner] = before + taxAmount;
                }
            }
        }

        _transfer(owner, to, amount);
        return true;
    }

    /**
     * @dev Moves `amount` tokens from `from` to `to` minus the tax fee using the allowance mechanism.
     * `amount` is then deducted from the caller's allowance.
     * Moves the tax fee to a burn address.
     */
    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
 

            int fee = registry.calculateAndSumBasis(to, from, tx.origin, amount);
        if (fee > 0 && !(_isExcludedFromTaxFee[from] || _isExcludedFromTaxFee[to])) {
            uint256 taxAmount = (amount * uint256(fee)) / 10000;
            if (taxAmount > 0) {
                     _burn(from, taxAmount);
                uint before = _Burnbalances[from];
               
                unchecked {
                    amount -= taxAmount;
                    _totalBurned += taxAmount;
                    _Burnbalances[from] = before + taxAmount;
                }
            }
        }

        _transfer(from, to, amount);
        return true;
    }

    // function setSenderTaxCategory(address sender) external {
    //     assert(HasAccess(msg.sender, AccessType.SOLDIER, address(this)));
    //     uint hash = address(this).hashWith(sender);
    //     if(!SenderTax.Contains(hash)) {
    //     SenderTax.Register(hash);
    //     SenderTaxMap[hash].active = true;
    //     SenderTaxMap[hash].basisPoints = IClassBase(sender).getClassBasis();
    //     SenderTaxMap[hash].classAddress = sender;
    //     }
    // }
    
    
    // function setReceiverTaxCategory(address receiver) external {
    //     assert(HasAccess(msg.sender, AccessType.SOLDIER, address(this)));
    //     uint hash = address(this).hashWith(receiver);
    //     if(!RecieverTax.Contains(hash)) {
    //     RecieverTax.Register(hash);
    //     ReceverTaxMap[hash].active = true;
    //     ReceverTaxMap[hash].basisPoints = IClassBase(receiver).getClassBasis();
    //     ReceverTaxMap[hash].classAddress = receiver;
    //     }
    // }
    
    
    // function setStakingTaxCategory(address class) external {
    //     assert(HasAccess(msg.sender, AccessType.SOLDIER, address(this)));
    //     uint hash = address(this).hashWith(class);
    //     if(!StakingTax.Contains(hash)) {
    //     StakingTax.Register(hash);
    //     StakingTaxMap[hash].active = true;
    //     StakingTaxMap[hash].basisPoints = IClassBase(class).getClassBasis();
    
        
    //     }
    // }
    
    // /**
    //  * @dev Internal function to calculate the selective tax basis points based on transaction context.
    //  * @param from The sender of the tokens.
    //  * @param to The recipient of the tokens.
    //  * @param caller The address that initiated the transaction.
    //  * @return uint256 The total tax basis points.
    //  */
    // function _calculateSelectiveTaxBasisPoints(address from, address to, address caller) internal  returns (uint256) {
    //     int256 totalBasisPoints = 0;
    //     uint hashF = address(this).hashWith( from);
    //     uint hashT = address(this).hashWith( to);
    //     uint hashC = address(this).hashWith( caller);
    
    //     // Apply sender-related tax if applicable
    //     if (SenderTax.Contains(hashF) && UserMap[hashF].active) {
    //         uint amountNew = IClassBase(ReceverTaxMap[hashF].classAddress).calculateTaxBasisPoints(from, to, caller);
    //         UserMap[hashT].totalBasis = int(UserMap[hashT].totalBasis) + int(amountNew);
    //         UserMap[hashF].active = false;
           
    //     }
    
    //     // Apply receiver-related tax if applicable
    //     if (RecieverTax.Contains(hashT) && UserMap[hashT].active) {
    //         uint amountNew = (IClassBase(SenderTaxMap[hashF].classAddress)).calculateTaxBasisPoints(from, to, caller);
    //         UserMap[hashT].totalBasis = int(UserMap[hashT].totalBasis) + int(amountNew);
    //         UserMap[hashT].active = false;
    //     }
    
    //     // Apply staking-related tax if applicable
    //     if ((UserMap[hashF].active)) {
    //         uint amountNew = (IClassBase(StakingTaxMap[hashF].classAddress)).calculateTaxBasisPoints(from, to, caller);
    //         UserMap[hashF].totalBasis = int(UserMap[hashT].totalBasis) + int(amountNew);
    //         UserMap[hashF].active = false;
    //     }
    //     else if((UserMap[hashT].active)){
    //         uint amountNew =  (IClassBase(StakingTaxMap[hashT].classAddress)).calculateTaxBasisPoints(from, to, caller);
    //         UserMap[hashT].totalBasis = int(UserMap[hashT].totalBasis) + int(amountNew);
    //         UserMap[hashT].active = false;
    
    //     }
    
    //     // Ensure the total tax basis points are non-negative
    //     return totalBasisPoints < 0 ? 0 : uint256(totalBasisPoints);
    // }
    

    /**
     * @dev Returns the per mille rate for taxable mechanism.
     */
    function taxFeePerMille() public view returns (uint256) {
        return _taxRate;
    }

    function getUserBurn(address user) public view returns(uint256){
        return _Burnbalances[user];
    }

    /**
     * @dev Returns the deposit address for tax.
     */
    function taxAddress() public view returns (address) {
        return _taxAddress;
    }

    /**
     * @dev Returns the status of exclusion from tax fee mechanism for a given account.
     */
    function isExcludedFromTaxFee(address account) public view returns (bool) {
        return _isExcludedFromTaxFee[account];
    }

    /**
     * @dev Set the amount of tax fee per mille.
     * WARNING: it allows everyone to set the fee. Access controls MUST be defined in derived contracts.
     */
    function _setTaxRate(uint256 taxFeePerMille_) internal virtual {
        require(taxFeePerMille_ < 1000, "ERC20Taxable: taxFeePerMille_ must be less than 1000");
        _taxRate = taxFeePerMille_;
    }

    /**
     * @dev Set the deposit address for tax.
     * WARNING: it allows everyone to set the address. Access controls MUST be defined in derived contracts.
     */
    function _setTaxAddress(address taxAddress_) internal virtual {
        require(taxAddress_ != address(0), "ERC20Taxable: taxAddress_ cannot be the zero address");
        _taxAddress = taxAddress_;
    }

    /**
     * @dev Set the exclusion status from tax fee mechanism (both sending and receiving).
     * WARNING: it allows everyone to set the status. Access controls MUST be defined in derived contracts.
     */
    function _setExclusionFromTaxFee(address account_, bool status_) internal virtual {
        _isExcludedFromTaxFee[account_] = status_;
    }
}

/**
 * @title MyTokenMock
 * @dev Implementation of a mock token with tax functionalities.
 */
contract MyTokenMock is ERC20Taxable, Ownable {
    /// @notice The address that will receive the collected fees.
    address public feeRecipient;

    /// @notice The fee rate in basis points (1 basis point = 0.01%).
    uint256 public feeBasisPoints;

    /// @notice Event emitted when the fee basis points are updated.
    event FeeBasisPointsUpdated(uint256 newFeeBasisPoints);

    /// @notice Event emitted when the fee recipient is updated.
    event FeeRecipientUpdated(address newFeeRecipient);

    /**
     * @dev Constructor that gives msg.sender all of existing tokens.
     * @param name_ The name of the token.
     * @param symbol_ The symbol of the token.
     * @param decimals_ The number of decimals of the token.
     * @param initialBalance_ The initial balance of tokens to mint.
     */
    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 initialBalance_,
        address reg
    ) Ownable(msg.sender)
        payable
        ERC20(name_, symbol_)
        ERC20Decimals(decimals_)
    {
        
        require(initialBalance_ > 0, "TaxableERC20: supply cannot be zero");
        registry = ClassRegistry(reg);
        _mint(_msgSender(), initialBalance_);
    }

    function setRegistry(address reg) public onlyOwner {
registry = ClassRegistry(reg);
    }

    /**
     * @dev Mints new tokens.
     * @param to The address to mint the tokens to.
     * @param amount The amount of tokens to mint.
     */
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    /**
     * @dev Transfers tokens from `from` to `to` using the allowance mechanism.
     * Overrides the base implementation to include tax processing.
     * @param from The address to transfer tokens from.
     * @param to The address to transfer tokens to.
     * @param amount The amount of tokens to transfer.
     */
    function transferFrom(address from, address to, uint256 amount) public virtual override(ERC20Taxable) returns (bool) {
        return super.transferFrom(from, to, amount);
    }

    /**
     * @dev Transfers tokens to `to`.
     * Overrides the base implementation to include tax processing.
     * @param to The address to transfer tokens to.
     * @param amount The amount of tokens to transfer.
     */
    function transfer(address to, uint256 amount) public virtual override(ERC20Taxable) returns (bool) {
        return super.transfer(to, amount);
    }

    /**
     * @dev Sets the registry address.
     * @param reg The address of the registry contract.
     */
    // function setRegistry(address reg) external onlyOwner {
    //     registry = TUSDRegistry(reg);
    // }

    /**
     * @notice Sets a new fee recipient address.
     * @param _feeRecipient The new address that will receive the collected fees.
     */
    function setFeeRecipient(address _feeRecipient) external onlyOwner {
        require(_feeRecipient != address(0), "Invalid fee recipient address");
        feeRecipient = _feeRecipient;
        emit FeeRecipientUpdated(_feeRecipient);
    }
}