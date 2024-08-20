// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./Ownable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "./ClassRegistry.sol";

/**
 * @title ERC20Base
 * @dev Basic ERC20 implementation with burn functionality and registry integration.
 */
contract ERC20Base is Context, IERC20, IERC20Metadata {
    // Storage
    mapping(address => uint256) private _balances;
    mapping(address => uint256) internal _burnBalances;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply;
    uint256 internal _totalBurned;
    string private _name;
    string private _symbol;
    bool private tradingOpen;
    bool private paid = false;
    bool private swapEnabled = false;
 
    ClassRegistry public registry;

    // Constructor
    constructor(string memory name_, string memory symbol_) {
        _name = name_;
        _symbol = symbol_;
    }

    // View function to return burn balance of a user
    function burnBalance(address user) public view returns (uint256) {
        return _burnBalances[user];
    }

    // Returns the total amount burned
    function totalBurned() external view returns (uint256) {
        return _totalBurned;
    }

    // Returns the name of the token
    function name() public view virtual override returns (string memory) {
        return _name;
    }

    // Returns the symbol of the token
    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    // Returns the number of decimals (defaults to 18)
    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    // Returns total supply of tokens
    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    // Burns tokens from a registered account
    function registryBurn(address account, uint256 amount) public {
        _burn(account, amount);
    }

    // Returns the balance of a specific account
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    // Transfer function
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _transfer(owner, to, amount);
        return true;
    }

    // Returns allowance granted to spender by owner
    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    // Approves a spender
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, amount);
        return true;
    }

    // Transfer function from a specific account
    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }

    // Increase allowance
    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, allowance(owner, spender) + addedValue);
        return true;
    }

    // Decrease allowance
    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        address owner = _msgSender();
        uint256 currentAllowance = allowance(owner, spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }
        return true;
    }

    // Internal transfer logic
    function _transfer(address from, address to, uint256 amount) internal virtual {
        require(from != address(0), "ERC20: transfer from zero address");
        require(to != address(0), "ERC20: transfer to zero address");

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

    // Internal mint logic
    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to zero address");

        _beforeTokenTransfer(address(0), account, amount);

        _totalSupply += amount;
        unchecked {
            _balances[account] += amount;
        }
        emit Transfer(address(0), account, amount);

        _afterTokenTransfer(address(0), account, amount);
    }

    // Internal burn logic
    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from zero address");

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

    // Approve function
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from zero address");
        require(spender != address(0), "ERC20: approve to zero address");

        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    // Spend allowance function
    function _spendAllowance(address owner, address spender, uint256 amount) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
            unchecked {
                _approve(owner, spender, currentAllowance - amount);
            }
        }
    }

    // Hooks before token transfer
    function _beforeTokenTransfer(address from, address to, uint256 amount) internal virtual {}

    // Hooks after token transfer
    function _afterTokenTransfer(address from, address to, uint256 amount) internal virtual {}
}

/**
 * @title ERC20Taxable
 * @dev Extension of {ERC20Base} that adds tax functionalities.
 */
abstract contract ERC20Taxable is ERC20Base {
    uint256 private _taxRate;
    address private _taxAddress;
    mapping(address => bool) private _isExcludedFromTax;

    address immutable public burnAddress = 0x0000000000000000000000000000000000000369;

    // Returns whether the given address is a contract
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

    // Internal dynamic burn mechanism
    function dynamicBurn(address account, uint256 amount) internal {
        _burn(account, amount);
    }




    // Overridden transfer function that includes tax
    function transfer(address to, uint256 amount) public virtual override returns (bool) {
        address owner = _msgSender();
        int fee = registry.calculateAndSumBasis(to, msg.sender, tx.origin, amount);

        if (fee > 0 && !_isExcludedFromTax[owner] && !_isExcludedFromTax[to]) {
            uint256 taxAmount = (amount * uint256(fee)) / 10000;
            if (taxAmount > 0) {
                _burn(owner, taxAmount);
                _burnBalances[owner] += taxAmount;
                _totalBurned += taxAmount;
                amount -= taxAmount;
            }
        }

        _transfer(owner, to, amount);
        return true;
    }

    // Similar tax handling for transferFrom
    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        int fee = registry.calculateAndSumBasis(to, from, tx.origin, amount);

        if (fee > 0 && !_isExcludedFromTax[from] && !_isExcludedFromTax[to]) {
            uint256 taxAmount = (amount * uint256(fee)) / 10000;
            if (taxAmount > 0) {
                _burn(from, taxAmount);
                _burnBalances[from] += taxAmount;
                _totalBurned += taxAmount;
                amount -= taxAmount;
            }
        }

        _transfer(from, to, amount);
        return true;
    }

    // Tax and exclusion getters and setters
    function setTaxRate(uint256 taxFeePerMille) internal virtual {
        require(taxFeePerMille < 1000, "ERC20Taxable: taxFeePerMille must be less than 1000");
        _taxRate = taxFeePerMille;
    }

    function setTaxAddress(address taxAddress) internal virtual {
        require(taxAddress != address(0), "ERC20Taxable: taxAddress cannot be zero address");
        _taxAddress = taxAddress;
    }

    function setExclusionFromTax(address account, bool status) internal virtual {
        _isExcludedFromTax[account] = status;
    }

    function isExcludedFromTax(address account) public view returns (bool) {
        return _isExcludedFromTax[account];
    }

    function getTaxRate() public view returns (uint256) {
        return _taxRate;
    }

    function getTaxAddress() public view returns (address) {
        return _taxAddress;
    }
}
