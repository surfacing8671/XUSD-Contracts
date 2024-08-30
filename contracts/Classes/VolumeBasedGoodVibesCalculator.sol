// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "./ITaxCalculator.sol";

// /**
//  * @title VolumeBasedNegativeTaxCalculator
//  * @dev A tax calculator that provides increasing rewards based on the transaction volume.
//  */
// contract VolumeBasedNegativeTaxCalculator is ITaxCalculator {
//     int public immutable lowVolumeRewardBasisPoints;
//     int public immutable highVolumeRewardBasisPoints;
//     uint256 public immutable volumeThreshold;

//     /**
//      * @dev Constructor to set the reward rates and volume threshold.
//      * @param _lowVolumeRewardBasisPoints The reward rate for low-volume transactions in negative basis points.
//      * @param _highVolumeRewardBasisPoints The reward rate for high-volume transactions in negative basis points.
//      * @param _volumeThreshold The threshold for high-volume transactions.
//      */
//     constructor(
//         int _lowVolumeRewardBasisPoints,
//         int _highVolumeRewardBasisPoints,
//         uint256 _volumeThreshold
//     ) {
//         lowVolumeRewardBasisPoints = _lowVolumeRewardBasisPoints;
//         highVolumeRewardBasisPoints = _highVolumeRewardBasisPoints;
//         volumeThreshold = _volumeThreshold;
//     }

//     function calculateTotalBasisFee(address addy, uint amount) external view override returns (int) {
//         if (amount >= volumeThreshold) {
//             return highVolumeRewardBasisPoints;
//         } else {
//             return lowVolumeRewardBasisPoints;
//         }
//     }
// }
