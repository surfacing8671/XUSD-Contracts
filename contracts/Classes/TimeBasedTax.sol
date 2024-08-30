// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "./ITaxCalculator.sol";

// /**
//  * @title TimeBasedTaxCalculator
//  * @dev A tax calculator that imposes different tax rates based on the time of day.
//  */
// contract TimeBasedTaxCalculator is ITaxCalculator {
//     int public immutable peakRateBasisPoints;
//     int public immutable offPeakRateBasisPoints;
//     uint256 public immutable peakStartHour; // Start hour for peak time (0-23)
//     uint256 public immutable peakEndHour; // End hour for peak time (0-23)

//     /**
//      * @dev Constructor to set the peak/off-peak tax rates and peak hours.
//      * @param _peakRateBasisPoints The tax rate during peak hours in basis points.
//      * @param _offPeakRateBasisPoints The tax rate during off-peak hours in basis points.
//      * @param _peakStartHour The starting hour for peak time.
//      * @param _peakEndHour The ending hour for peak time.
//      */
//     constructor(
//         int _peakRateBasisPoints,
//         int _offPeakRateBasisPoints,
//         uint256 _peakStartHour,
//         uint256 _peakEndHour
//     ) {
//         require(_peakStartHour < 24 && _peakEndHour < 24, "Invalid peak hours");
//         peakRateBasisPoints = _peakRateBasisPoints;
//         offPeakRateBasisPoints = _offPeakRateBasisPoints;
//         peakStartHour = _peakStartHour;
//         peakEndHour = _peakEndHour;
//     }

//     function calculateTotalBasisFee(address addy, uint amount) external view  returns (int) {
//         uint256 currentHour = (block.timestamp / 60 / 60) % 24; // UTC hour
//         if (currentHour >= peakStartHour && currentHour < peakEndHour) {
//             return int256(peakRateBasisPoints);
//         } else {
//             return int256(offPeakRateBasisPoints);
//         }
//     }


// }
