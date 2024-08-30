// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "./ITaxCalculator.sol";
// import "./VibeBase.sol";
// /**
//  * @title HoldingPeriodBasedTaxCalculator
//  * @dev A tax calculator that imposes different tax rates based on the holding period of an asset.
//  */
// contract HoldingPeriodBasedTaxCalculator is VibeBase {
//     int public immutable shortTermRateBasisPoints;
//     int public immutable longTermRateBasisPoints;
//     uint256 public immutable holdingPeriodThreshold; // Time in seconds for the threshold between short and long term
//        string public Description;
//     mapping(address => uint256) public purchaseTimestamps;

//     /**
//      * @dev Constructor to set the tax rates and holding period threshold.
//      * @param _shortTermRateBasisPoints The tax rate for short-term holdings in basis points.
//      * @param _longTermRateBasisPoints The tax rate for long-term holdings in basis points.
//      * @param _holdingPeriodThreshold The threshold in seconds to define short-term vs long-term holding.
//      */
//     constructor(
//         int _shortTermRateBasisPoints,
//         int _longTermRateBasisPoints,
//         uint256 _holdingPeriodThreshold,
//  string memory _description
//     )  VibeBase(_description) {
//         shortTermRateBasisPoints = _shortTermRateBasisPoints;
//         longTermRateBasisPoints = _longTermRateBasisPoints;
//         holdingPeriodThreshold = _holdingPeriodThreshold;
//     }

//     /**
//      * @dev Record the timestamp when an asset is purchased.
//      * @param _addy The address that purchased the asset.
//      */
//     function recordPurchase(address _addy) external {
//         purchaseTimestamps[_addy] = block.timestamp;
//     }

//     function calculateTotalBasisFee(address addy, uint amount) external view override returns (int) {
//         uint256 purchaseTimestamp = purchaseTimestamps[addy];
//         if (block.timestamp - purchaseTimestamp >= holdingPeriodThreshold) {
//             return longTermRateBasisPoints;
//         } else {
//             return shortTermRateBasisPoints;
//         }
//     }
// }
