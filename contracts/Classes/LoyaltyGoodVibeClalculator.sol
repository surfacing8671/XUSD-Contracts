// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "./IVibeCalculator.sol";
// import "./VibeBase.sol";
// /**
//  * @title LoyaltyBasedNegativeTaxCalculator
//  * @dev A tax calculator that gives progressively higher rewards for loyal addresses based on transaction count.
//  */
// contract LoyaltyBasedNegativeTaxCalculator is VibeBase {
//     int public immutable baseRewardBasisPoints;
//     int public immutable loyaltyIncrementBasisPoints;
//     uint256 public immutable loyaltyThreshold;
//     mapping(address => uint256) public transactionCounts;
//        string public Description;
//     /**
//      * @dev Constructor to set the base reward rate, incremental reward, and loyalty threshold.
//      * @param _baseRewardBasisPoints The base reward rate in negative basis points.
//      * @param _loyaltyIncrementBasisPoints The additional reward for each threshold passed, in negative basis points.
//      * @param _loyaltyThreshold The number of transactions required to increase the reward.
//      */
//     constructor(
//         int _baseRewardBasisPoints,
//         int _loyaltyIncrementBasisPoints,
//         uint256 _loyaltyThreshold,
//   VibeInfo memory _description
//     )  VibeBase(_description) {
//         baseRewardBasisPoints = _baseRewardBasisPoints;
//         loyaltyIncrementBasisPoints = _loyaltyIncrementBasisPoints;
//         loyaltyThreshold = _loyaltyThreshold;
//     }

//     function calculateTotalBasisFee(address addy, uint amount) external view override returns (int, uint) {
//         uint256 count = transactionCounts[addy];
//         int increment = int256(count / loyaltyThreshold) * loyaltyIncrementBasisPoints;
//         return (baseRewardBasisPoints - increment, amount);
//     }

//     /**
//      * @dev Records a transaction to count towards loyalty rewards.
//      * @param _addy The address making the transaction.
//      */
//     function recordTransaction(address _addy) external {
//         transactionCounts[_addy]++;
//     }
// }
