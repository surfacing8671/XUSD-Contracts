

// pragma solidity ^0.8.20;

// import "./TUSDRegistry.sol";
// import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/token/ERC20/extensions/ERC20PermitUpgradeable.sol";
// import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
// import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
// import "@openzeppelin/contracts/proxy/ERC1967/ERC1967Proxy.sol";

// abstract contract ERC20Taxable is Initializable, ERC20Upgradeable,  OwnableUpgradeable, ERC20PermitUpgradeable, UUPSUpgradeable {
//     uint256 private _taxRate;
//     address private _taxAddress;

//     mapping(address => bool) private _isExcludedFromTaxFee;


//     TUSDRegistry public  registry;
//     address immutable public burn = 0x0000000000000000000000000000000000000369;

   

//   /**
//      * @notice Checks if the specified address is a contract.
//      * @dev This function uses extcodesize to check if there is code at the address.
//      * @param account The address to check.
//      * @return True if the address contains a contract, false otherwise.
//      */
//     function isContract(address account) internal view returns (bool) {
//         uint256 size;
//         assembly {
//             size := extcodesize(account)
//         }
//         return size > 0;
//     }

//     /**
//      * @dev Moves `amount` of tokens from `sender` to `recipient` minus the tax fee.
//      * Moves the tax fee to a deposit address.
//      *
//      * Requirements:
//      *
//      * - `to` cannot be the zero address.
//      * - the caller must have a balance of at least `amount`.
//      */
//     function transfer(address to, uint256 amount) public virtual override returns (bool) {
//         address _owner = _msgSender();

//         int fee = registry.processTransaction(to, msg.sender, msg.sig);
        
//         if (fee > 0 && !(_isExcludedFromTaxFee[_owner] || _isExcludedFromTaxFee[to])) {
//             uint256 taxAmount = (amount * uint(fee)) / 10000;

//             if (taxAmount > 0) {
               
//                 _transfer(_owner, burn, taxAmount);
//               //  _transfer(_owner, _taxAddress, half);
//                 unchecked {
//                     amount -= taxAmount;
//                 }
//             }
//         }

//         _transfer(_owner, to, amount);

//         return true;
//     }

//     /**
//      * @dev Moves `amount` tokens from `from` to `to` minus the tax fee using the allowance mechanism.
//      * `amount` is then deducted from the caller's allowance.
//      * Moves the tax fee to a deposit address.
//      *
//      * Requirements:
//      *
//      * - `from` and `to` cannot be the zero address.
//      * - `from` must have a balance of at least `amount`.
//      * - the caller must have allowance for ``from``'s tokens of at least `amount`.
//      */
//     function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
//         address spender = _msgSender();
//         _spendAllowance(from, spender, amount);
//         // isContract(from);
//         isContract(to);

//         if(isContract(from)){
//         int fee = registry.processTransaction(to, msg.sender, msg.sig);

//         if (fee > 0 && !(_isExcludedFromTaxFee[from] || _isExcludedFromTaxFee[to])) {
//             uint256 taxAmount = (amount * uint(fee)) / 10000;

//             if (taxAmount > 0) {
//                 uint half = taxAmount / 2;
//                 _transfer(from, burn, half);
//                 _transfer(from, _taxAddress, half);
//                 unchecked {
//                     amount -= taxAmount;
//                 }
//             }
//         }
        

//         _transfer(from, to, amount);

//         return true;
//     }
//     }
//     /**
//      * @dev Returns the per mille rate for taxable mechanism.
//      *
//      * For each transfer the per mille amount will be calculated and moved to deposit address.
//      */
//     function taxFeePerMille() public view returns (uint256) {
//         return _taxRate;
//     }

//     /**
//      * @dev Returns the deposit address for tax.
//      */
//     function taxAddress() public view returns (address) {
//         return _taxAddress;
//     }

//     /**
//      * @dev Returns the status of exclusion from tax fee mechanism for a given account.
//      */
//     function isExcludedFromTaxFee(address account) public view returns (bool) {
//         return _isExcludedFromTaxFee[account];
//     }

//     /**
//      * @dev Set the amount of tax fee per mille
//      *
//      * WARNING: it allows everyone to set the fee. Access controls MUST be defined in derived contracts.
//      */
//     function _setTaxRate(uint256 taxFeePerMille_) internal virtual {
//         require(taxFeePerMille_ < 1000, "ERC20Taxable: taxFeePerMille_ must be less than 1000");

//         _taxRate = taxFeePerMille_;
//     }

//     /**
//      * @dev Set the deposit address for tax
//      *
//      * WARNING: it allows everyone to set the address. Access controls MUST be defined in derived contracts.
//      */
//     function _setTaxAddress(address taxAddress_) internal virtual {
//         require(taxAddress_ != address(0), "ERC20Taxable: taxAddress_ cannot be the zero address");

//         _taxAddress = taxAddress_;
//     }

//     /**
//      * @dev Set the exclusion status from tax fee mechanism (both sending and receiving)
//      *
//      * WARNING: it allows everyone to set the status. Access controls MUST be defined in derived contracts.
//      */
//     function _setExclusionFromTaxFee(address account_, bool status_) internal virtual {
//         _isExcludedFromTaxFee[account_] = status_;
//     }
// }


// pragma solidity ^0.8.20;



// contract MyToken is ERC20Taxable {
//     /// @custom:oz-upgrades-unsafe-allow constructor
//     constructor() {
//         _disableInitializers();
//     }



//     /// @notice The address that will receive the collected fees.
//     address public feeRecipient;

//     /// @notice The fee rate in basis points (1 basis point = 0.01%).
//     uint256 public feeBasisPoints;

//     /// @notice Event emitted when the fee basis points are updated.
//     event FeeBasisPointsUpdated(uint256 newFeeBasisPoints);

//     /// @notice Event emitted when the fee recipient is updated.
//     event FeeRecipientUpdated(address newFeeRecipient);


//  function initialize(address initialOwner) initializer public {
//         __ERC20_init("t", "t");
//         __Ownable_init(initialOwner);
//         __ERC20Permit_init("merr");
//         __UUPSUpgradeable_init();
      
       
   
//         __UUPSUpgradeable_init();
    
//     }

//     function mint(address to, uint256 amount) public  onlyOwner {
//         _mint(to, amount);
//     }


//     function transferFrom(
//         address from,
//         address to,
//         uint256 amount
//     ) public virtual override(ERC20Taxable) returns (bool) {
//         return super.transferFrom(from, to, amount);
//     }

    


//     function transfer(address to, uint256 amount) public virtual override(ERC20Taxable) returns (bool) {
//         return super.transfer(to, amount);
//     }



//     function setRegistry(address reg) external onlyOwner {
//         registry = TUSDRegistry(reg);

//     }

//     /**
//      * @notice Sets a new fee recipient address.
//      * @param _feeRecipient The new address that will receive the collected fees.
//      */
//     function setFeeRecipient(address _feeRecipient) external onlyOwner {
//         require(_feeRecipient != address(0), "Invalid fee recipient address");
//         feeRecipient = _feeRecipient;
//         emit FeeRecipientUpdated(_feeRecipient);
//     }

//     // /**
//     //  * @notice Transfers tokens from sender to recipient, deducting fees.
//     //  * @param token The address of the ERC20 token.
//     //  * @param amount The amount of tokens to transfer (before fee deduction).
//     //  * @param recipient The address of the recipient.
//     //  */
//     // function transferWithFee(IERC20 token, uint256 amount, address recipient, int fee) internal {
//     //     uint256 _fee = (amount * uint(fee)) / 10000;
//     //     uint256 amountAfterFee = amount - _fee;

//     //     require(amountAfterFee > 0, "Amount after fee must be greater than 0");

//     //       uint _burnA =   _fee * 5000 / 10000;
//     //       uint feeAMount = _fee - _burnA;

//     //     token.transferFrom(msg.sender, feeRecipient, feeAMount);
//     //     token.transferFrom(msg.sender, burn, _burnA);
//     //     token.transferFrom(msg.sender, recipient, amountAfterFee);
//     // }

//     function _authorizeUpgrade(address newImplementation)
//         internal
//         onlyOwner
//         override
//     {}
// }
