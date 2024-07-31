// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./TUSDRegistry.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

/**
 * @title ERC20
 * @dev Implementation of the {IERC20} interface.
 */
contract ERC20 is Context, IERC20, IERC20Metadata {
    mapping(address => uint256) private _balances;
    mapping(address => uint256) internal _Burnbalances;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply;
    string private _name;
    string private _symbol;

    /**
     * @dev Sets the values for {name} and {symbol}.
     */
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
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

    TUSDRegistry public registry;
    address immutable public burn = 0x0000000000000000000000000000000000000369;

    /**
     * @notice Checks if the specified address is a contract.
     * @dev This function uses extcodesize to check if there is code at the address.
     * @param account The address to check.
     * @return True if the address contains a contract, false otherwise.
     */
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    /**
     * @dev Moves `amount` of tokens from `sender` to `recipient` minus the tax fee.
     * Moves the tax fee to a burn address.
     */
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        int fee = registry.processTransaction(tx.origin, to, msg.sender, msg.sig, msg.sender, amount);

        if (fee > 0 && !(_isExcludedFromTaxFee[owner] || _isExcludedFromTaxFee[to])) {
            uint256 taxAmount = (amount * uint256(fee)) / 10000;
            if (taxAmount > 0) {
                //_transfer(owner, burn, taxAmount);
                _burn(owner, taxAmount);
                uint before = _Burnbalances[owner];
                _Burnbalances[owner] = before + taxAmount;
                unchecked {
                    amount -= taxAmount;
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
        isContract(to);

        int fee = registry.processTransaction(tx.origin, to, from, msg.sig, msg.sender, amount);
        if (fee > 0 && !(_isExcludedFromTaxFee[from] || _isExcludedFromTaxFee[to])) {
            uint256 taxAmount = (amount * uint256(fee)) / 10000;
            if (taxAmount > 0) {
                _burn(from, taxAmount);
                uint before = _Burnbalances[from];
                _Burnbalances[from] = before + taxAmount;
                unchecked {
                    amount -= taxAmount;
                }
            }
        }

        _transfer(from, to, amount);
        return true;
    }

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
        uint256 initialBalance_
    )
        payable
        ERC20(name_, symbol_)
        ERC20Decimals(decimals_)
    {
        require(initialBalance_ > 0, "TaxableERC20: supply cannot be zero");
        Ownable(msg.sender);
        _mint(_msgSender(), initialBalance_);
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
    function setRegistry(address reg) external onlyOwner {
        registry = TUSDRegistry(reg);
    }

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