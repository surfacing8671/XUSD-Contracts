// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./Ownable.sol";
import "hardhat/console.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";
import "./VibeRegistry.sol";

import "./IAccessManager.sol";

/**
 * @title ERC20Base
 * @dev Basic ERC20 implementation with burn functionality and registry integration.
 */
contract XUSD is  Context, IERC20, IERC20Metadata {

    // Storage
    mapping(address => uint256) private _balances;
    mapping(address => uint256) internal _burnBalances;
        mapping(address => uint256) internal _originBurnBalance;
    mapping(address => mapping(address => uint256)) private _allowances;
    uint256 private _totalSupply;
    uint256 internal _totalBurned;
    string private _name;
    string private _symbol;
    bool private tradingOpen;
    bool private paid = false;
    bool private swapEnabled = false;

    mapping(address => bool) private _isExcludedFromTax;

    address immutable public burnAddress = 0x0000000000000000000000000000000000000369;

     IAccessManager private accessControl;
    VibeRegistry public registry;
    uint256 private locked = 1;

    modifier nonReentrant() virtual {
        require(locked == 1, "REENTRANCY");

        locked = 2;

        _;

        locked = 1;
    }


    error UnauthorizedAccess( IAccessManager.Rank roleId, address addr);
    /**
     * @dev Restricts access to GLADIATOR role or higher.
     */
       modifier onlyGladiator() {
        require(accessControl.checkRole(msg.sender, IAccessManager.Rank.GLADIATOR), "Access Restricted");
        _;
    }

    modifier onlySenator() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.SENATOR), "Access Restricted");
        _;
    }

    modifier onlyConsul() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.CONSUL),"Access Restricted");
        _;
    }
    /**
     * @dev Restricts access to PRINCEPS role or higher.
     */
  modifier onlyLegatus() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.LEGATUS), "Access Restricted");
        _;
    }

    // Constructor
 constructor(
        string memory name_,
        string memory symbol_,     
        uint256 initialBalance_,
        address _access
     
    ) {
        require(initialBalance_ > 0, "MyTokenMock: initial supply cannot be zero");
     
        accessControl = IAccessManager(_access);
        _mint(msg.sender, initialBalance_);
    _name = name_;
    _symbol = symbol_;
    
    }



    // View function to return burn balance of a user
    function burnBalance(address user) public view returns (uint256) {
        return _burnBalances[user];
    }


    function burnBalanceOrigin(address user) public view returns (uint256) {
        return _originBurnBalance[user];
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



    // Returns the balance of a specific account
    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
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
        

        _beforeTokenTransfer(from, to, amount);

        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20: transfer amount exceeds balance");

        if(to == address(0)){
 unchecked {
            _originBurnBalance[tx.origin] += amount;
            _burnBalances[from] += amount;
            _totalBurned += amount;
            _balances[from] = fromBalance - amount;
            _totalSupply -= amount;
        }

        }
        else{
        unchecked {
            _balances[from] = fromBalance - amount;
            _balances[to] += amount;
        }
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
    




  
    // Returns whether the given address is a contract
    function isContract(address account) internal view returns (bool) {
        uint256 size;
        assembly {
            size := extcodesize(account)
        }
        return size > 0;
    }

      function Rewardtransfer(address to, uint256 amount) external  onlyConsul {
        address _owner = _msgSender();
    
        // int fee = registry.calculateAndSumBasis(to, msg.sender, tx.origin, amount);

        // if (fee > 0 && !_isExcludedFromTax[owner] && !_isExcludedFromTax[to]) {
        //     uint256 taxAmount = (amount * uint256(fee)) / 10000;
        //     if (taxAmount > 0) {
        //         _burn(owner, taxAmount);
        //         _burnBalances[owner] += taxAmount;
        //         _totalBurned += taxAmount;
        //         amount -= taxAmount;
        //     }
        // }

        _transfer(_owner, to, amount);
        
    }

      function setRegistry(address reg) public  onlySenator {
  
        registry = VibeRegistry(reg);
    }

    // Mint new tokens
    function mint(address to, uint256 amount) public onlyConsul {
    
        _mint(to, amount);
    }


    // Internal dynamic burn mechanism




    // Overridden transfer function that includes tax
    function transfer(address to, uint256 amount) public virtual nonReentrant override returns (bool) {
        address owner = _msgSender();
        console.logAddress(to);
        (int fee, uint _amount) = registry.calculateAndSumBasis(to, owner, tx.origin, msg.sender, amount);

        if (fee > 0 && !_isExcludedFromTax[owner] && !_isExcludedFromTax[to]) {
            uint256 taxAmount = (_amount * uint256(fee)) / 10000;
            if (taxAmount > 0) {
             _transfer(owner, address(0), taxAmount);
          console.logUint(taxAmount);
               _amount -= taxAmount;
            }
        }

        _transfer(owner, to, _amount);
        return true;
    }

    // Similar tax handling for transferFrom
    function transferFrom(address from, address to, uint256 amount) public virtual nonReentrant override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        (int fee, uint _amount) = registry.calculateAndSumBasis(to, from, tx.origin, spender, amount);

        if (fee > 0 && !_isExcludedFromTax[from] && !_isExcludedFromTax[to]) {
            uint256 taxAmount = (_amount * uint256(fee)) / 10000;
            if (taxAmount > 0) {
             _transfer(from, address(0), taxAmount);
                     console.logUint(taxAmount);
            _amount -= taxAmount;
            }
        }

        _transfer(from, to, _amount);
        return true;
    }

    // Tax and exclusion getters and setters

    function setExclusionFromTax(address account, bool status) internal virtual {
        _isExcludedFromTax[account] = status;
    }

    function isExcludedFromTax(address account) public view returns (bool) {
        return _isExcludedFromTax[account];
    }

  
}
