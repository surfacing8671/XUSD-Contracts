// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// interface ITaxCalculator {
//     function calculateTaxBasisPoints(address from, address to, address caller) external view returns (uint256);
// }

// /**
//  * @title VolumeBasedTaxCalculator
//  * @dev A tax calculator that imposes a higher tax rate for larger transactions.
//  */
// contract VolumeBasedTaxCalculator is ITaxCalculator {
//     uint256 public immutable baseRateBasisPoints;
//     uint256 public immutable volumeThreshold; // Threshold for larger transactions
//     uint256 public immutable highVolumeRateBasisPoints;

//     /**
//      * @dev Constructor to set the base rate, high volume rate, and threshold.
//      * @param _baseRateBasisPoints The base tax rate in basis points.
//      * @param _volumeThreshold The transaction amount threshold for the higher rate.
//      * @param _highVolumeRateBasisPoints The tax rate for transactions above the threshold.
//      */
//     constructor(uint256 _baseRateBasisPoints, uint256 _volumeThreshold, uint256 _highVolumeRateBasisPoints) {
//         baseRateBasisPoints = _baseRateBasisPoints;
//         volumeThreshold = _volumeThreshold;
//         highVolumeRateBasisPoints = _highVolumeRateBasisPoints;
//     }

//     /**
//      * @dev Returns the tax rate based on the transaction amount.
//      * @param from The sender of the tokens.
//      * @param to The recipient of the tokens.
//      * @param caller The address that initiated the transaction.
//      * @param amount The amount of tokens being transferred.
//      * @return uint256 The tax rate in basis points.
//      */
//     function calculateTaxBasisPoints(address from, address to, address caller, uint256 amount) external view override returns (uint256) {
//         if (amount > volumeThreshold) {
//             return highVolumeRateBasisPoints;
//         } else {
//             return baseRateBasisPoints;
//         }
//     }
// }
