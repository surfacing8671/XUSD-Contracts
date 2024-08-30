// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

import "./Ownable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

import "./VibeRegistry.sol";
import "./Access.sol";

/**
 * @title XUSD
 * @dev ERC20 implementation with burn functionality and registry integration.
 */
contract XUSD is Context, IERC20, IERC20Metadata {
    // Storage
    mapping(address => uint256) private _balances;
    mapping(address => uint256) internal _burnBalances;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply;
    uint256 internal _totalBurned;
    string private _name;
    string private _symbol;
    bool private specialFunctionCalled;
    bool private tradingOpen;
    bool private swapEnabled;
    uint256 private locked = 1;

    VibeRegistry public registry;
    HierarchicalAccessControl private access;

    address public constant BURN_ADDRESS = 0x0000000000000000000000000000000000000369;
    mapping(address => bool) private _isExcludedFromTax;

    modifier nonReentrant() {
        require(locked == 1, "REENTRANCY");
        locked = 2;
        _;
        locked = 1;
    }

    constructor(
        string memory name_,
        string memory symbol_,
        uint256 initialBalance_,
        address _access
    ) {
        require(initialBalance_ > 0, "XUSD: initial supply cannot be zero");
        _name = name_;
        _symbol = symbol_;
        access = HierarchicalAccessControl(_access);
        _mint(_msgSender(), initialBalance_);
    }

    // View functions
    function burnBalance(address user) public view returns (uint256) {
        return _burnBalances[user];
    }

    function totalBurned() external view returns (uint256) {
        return _totalBurned;
    }

    function name() public view virtual override returns (string memory) {
        return _name;
    }

    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    function totalSupply() public view virtual override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    function isExcludedFromTax(address account) public view returns (bool) {
        return _isExcludedFromTax[account];
    }

    // Public functions
    function approve(address spender, uint256 amount) public virtual override returns (bool) {
        _approve(_msgSender(), spender, amount);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        _approve(_msgSender(), spender, allowance(_msgSender(), spender) + addedValue);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        uint256 currentAllowance = allowance(_msgSender(), spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        _approve(_msgSender(), spender, currentAllowance - subtractedValue);
        return true;
    }

    function transfer(address to, uint256 amount) public virtual override nonReentrant returns (bool) {
        _taxAndTransfer(_msgSender(), to, amount);
        return true;
    }

    function Rewardtransfer(address to, uint256 amount) public virtual nonReentrant returns (bool) {
          require(access.hasRank(HierarchicalAccessControl.Rank.CONSUL, _msgSender()), "XUSD: insufficient rank");
         _transfer(_msgSender(), to, amount);
     
        return true;
    }

    function transferFrom(address from, address to, uint256 amount) public virtual override nonReentrant returns (bool) {
        _spendAllowance(from, _msgSender(), amount);
        _taxAndTransfer(from, to, amount);
        return true;
    }

    function mint(address to, uint256 amount) public {
        require(access.hasRank(HierarchicalAccessControl.Rank.CONSUL, _msgSender()), "XUSD: insufficient rank");
        _mint(to, amount);
    }

    function registryBurn(address account, uint256 amount) public {
        _burn(account, amount);
    }

    function setRegistry(address reg) public {
        require(access.hasRank(HierarchicalAccessControl.Rank.SENATOR, _msgSender()), "XUSD: insufficient rank");
        registry = VibeRegistry(reg);
    }

    function setExclusionFromTax(address account, bool status) public {
        _isExcludedFromTax[account] = status;
    }

    // Internal functions
    function _approve(address owner, address spender, uint256 amount) internal virtual {
        require(owner != address(0), "ERC20: approve from zero address");
        require(spender != address(0), "ERC20: approve to zero address");
        _allowances[owner][spender] = amount;
        emit Approval(owner, spender, amount);
    }

    function _taxAndTransfer(address from, address to, uint256 amount) internal virtual {
        uint256 adjustedAmount = amount;
        int fee = 0;

        try registry.calculateAndSumBasis(to, from, tx.origin, _msgSender(), amount) returns (int calcFee, uint256 calcAmount) {
            fee = calcFee;
            adjustedAmount = calcAmount;
        } catch {
            _transfer(from, to, adjustedAmount);
            return;
        }

        if (fee > 0 && !_isExcludedFromTax[from] && !_isExcludedFromTax[to]) {
            uint256 taxAmount = (adjustedAmount * uint256(fee)) / 10000;
            if (taxAmount > 0) {
                _transfer(from, address(0), taxAmount);
                adjustedAmount -= taxAmount;
            }
        }

        _transfer(from, to, adjustedAmount);
    }

    function _transfer(address from, address to, uint256 amount) internal virtual {
        require(from != address(0), "ERC20: transfer from zero address");

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");

        _balances[from] = fromBalance - amount;
        if (to == address(0)) {
            _burnBalances[from] += amount;
            _totalBurned += amount;
            _totalSupply -= amount;
        } else {
            _balances[to] += amount;
        }

        emit Transfer(from, to, amount);
    }

    function _mint(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: mint to zero address");
        _totalSupply += amount;
        _balances[account] += amount;
        emit Transfer(address(0), account, amount);
    }

    function _burn(address account, uint256 amount) internal virtual {
        require(account != address(0), "ERC20: burn from zero address");
        uint256 accountBalance = _balances[account];
        require(accountBalance >= amount, "ERC20: burn amount exceeds balance");
        _balances[account] = accountBalance - amount;
        _totalSupply -= amount;
        emit Transfer(account, address(0), amount);
    }

    function _spendAllowance(address owner, address spender, uint256 amount) internal virtual {
        uint256 currentAllowance = allowance(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(currentAllowance >= amount, "ERC20: insufficient allowance");
            _approve(owner, spender, currentAllowance - amount);
        }
    }
}