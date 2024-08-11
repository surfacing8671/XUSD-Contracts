// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.18;

// import {IERC20} from "@openzeppelin-5.0.1/contracts/token/ERC20/IERC20.sol";
// import {ERC20} from "@openzeppelin-5.0.1/contracts/token/ERC20/ERC20.sol";
// import {SafeMath} from "@openzeppelin-5.0.1/contracts/utils/math/SafeMath.sol";

// /**
//  * @title ITaxCalculator
//  * @dev Interface for tax calculation modules.
//  */
// interface ITaxCalculator {
//     function calculateTaxBasisPoints(address from, address to, address caller) external view returns (uint256);
// }

// /**
//  * @title DynamicTaxToken
//  * @dev An ERC20 token with dynamic tax calculation using multiple external tax contracts.
//  */
// contract DynamicTaxToken is ERC20 {
//     using SafeMath for uint256;

//     address public taxCollector;
//     ITaxCalculator[] public taxCalculators;

//     event TaxApplied(address indexed from, address indexed to, address indexed caller, uint256 taxAmount);

//     /**
//      * @dev Constructor to set initial supply, tax collector address, and initial tax calculators.
//      * @param _name The name of the token.
//      * @param _symbol The symbol of the token.
//      * @param _initialSupply The initial token supply.
//      * @param _taxCollector The address to collect the tax.
//      */
//     constructor(
//         string memory _name, 
//         string memory _symbol, 
//         uint256 _initialSupply, 
//         address _taxCollector,
//         ITaxCalculator[] memory _taxCalculators
//     ) ERC20(_name, _symbol) {
//         _mint(msg.sender, _initialSupply);
//         taxCollector = _taxCollector;
//         for (uint256 i = 0; i < _taxCalculators.length; i++) {
//             taxCalculators.push(_taxCalculators[i]);
//         }
//     }

//     /**
//      * @dev Add a new tax calculator to the list.
//      * @param calculator The address of the new tax calculator contract.
//      */
//     function addTaxCalculator(ITaxCalculator calculator) external {
//         taxCalculators.push(calculator);
//     }

//     /**
//      * @dev Override of the `transfer` function to include dynamic tax.
//      * @param to The recipient of the transfer.
//      * @param amount The amount to transfer.
//      * @return bool Returns true if the transfer was successful.
//      */
//     function transfer(address to, uint256 amount) public override returns (bool) {
//         uint256 taxBasisPoints = _calculateTotalTaxBasisPoints(msg.sender, to, msg.sender);
//         uint256 taxAmount = amount.mul(taxBasisPoints).div(10000);
//         uint256 amountAfterTax = amount.sub(taxAmount);

//         _transfer(msg.sender, taxCollector, taxAmount);
//         _transfer(msg.sender, to, amountAfterTax);

//         emit TaxApplied(msg.sender, to, msg.sender, taxAmount);
//         return true;
//     }

//     /**
//      * @dev Override of the `transferFrom` function to include dynamic tax.
//      * @param from The address from which the tokens are transferred.
//      * @param to The recipient of the transfer.
//      * @param amount The amount to transfer.
//      * @return bool Returns true if the transfer was successful.
//      */
//     function transferFrom(address from, address to, uint256 amount) public override returns (bool) {
//         address spender = _msgSender();
//         _spendAllowance(from, spender, amount);

//         uint256 taxBasisPoints = _calculateTotalTaxBasisPoints(from, to, spender);
//         uint256 taxAmount = amount.mul(taxBasisPoints).div(10000);
//         uint256 amountAfterTax = amount.sub(taxAmount);

//         _transfer(from, taxCollector, taxAmount);
//         _transfer(from, to, amountAfterTax);

//         emit TaxApplied(from, to, spender, taxAmount);
//         return true;
//     }

//     /**
//      * @dev Internal function to calculate the total tax basis points by querying all tax calculators.
//      * @param from The sender of the tokens.
//      * @param to The recipient of the tokens.
//      * @param caller The address that initiated the transaction.
//      * @return uint256 The total tax basis points.
//      */
//     function _calculateTotalTaxBasisPoints(address from, address to, address caller) internal view returns (uint256) {
//         uint256 totalBasisPoints = 0;

//         for (uint256 i = 0; i < taxCalculators.length; i++) {
//             totalBasisPoints = totalBasisPoints.add(taxCalculators[i].calculateTaxBasisPoints(from, to, caller));
//         }

//         return totalBasisPoints;
//     }
// }
