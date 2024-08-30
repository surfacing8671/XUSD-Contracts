// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "./IVibeCalculator.sol";
// import "./VibeBase.sol";
// /**
//  * @title LoyaltyBasedTaxCalculator
//  * @dev A tax calculator that reduces the tax rate for loyal addresses based on transaction count.
//  */
// contract LoyaltyBasedTaxCalculator is VibeBase {
//     int public immutable baseRateBasisPoints;
//     int public immutable loyaltyDiscountBasisPoints;
//     uint256 public immutable loyaltyThreshold;
//     mapping(address => uint256) public transactionCounts;
//        string public Description;
//     /**
//      * @dev Constructor to set the base rate, discount, and loyalty threshold.
//      * @param _baseRateBasisPoints The base tax rate in basis points.
//      * @param _loyaltyDiscountBasisPoints The discount applied after reaching the loyalty threshold, in basis points.
//      * @param _loyaltyThreshold The number of transactions required to receive the loyalty discount.
//      */
//     constructor(
//         int _baseRateBasisPoints,
//         int _loyaltyDiscountBasisPoints,
//         uint256 _loyaltyThreshold,
//    VibeInfo memory _description
//     )  VibeBase(_description) {
//         baseRateBasisPoints = _baseRateBasisPoints;
//         loyaltyDiscountBasisPoints = _loyaltyDiscountBasisPoints;
//         loyaltyThreshold = _loyaltyThreshold;
//     }

//     /**
//      * @dev Records a transaction for an address.
//      * @param _addy The address conducting the transaction.
//      */
//     function recordTransaction(address _addy) external {
//         transactionCounts[_addy]++;
//     }

//     function calculateTotalBasisFee(address addy, uint amount) external view override returns (int, uint) {
//         if (transactionCounts[addy] >= loyaltyThreshold) {
//             return (baseRateBasisPoints - loyaltyDiscountBasisPoints, amount);
//         } else {
//             return (baseRateBasisPoints, amount);
//         }
//     }
// }
