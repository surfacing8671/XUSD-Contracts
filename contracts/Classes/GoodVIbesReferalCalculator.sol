// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "./ITaxCalculator.sol";
// import "./VibeBase.sol";
// /**
//  * @title NegativeReferralBasedTaxCalculator
//  * @dev A tax calculator that provides rewards for both referrers and referred addresses.
//  */
// contract NegativeReferralBasedTaxCalculator is VibeBase {
//     int public immutable baseRewardBasisPoints;
//     int public immutable referralBonusBasisPoints;
//     mapping(address => address) public referrals;
//        string public Description;
//     /**
//      * @dev Constructor to set the base reward and referral bonus.
//      * @param _baseRewardBasisPoints The base reward rate in negative basis points.
//      * @param _referralBonusBasisPoints The additional reward when a referral is used, in negative basis points.
//      */
//     constructor(
//         int _baseRewardBasisPoints,
//         int _referralBonusBasisPoints,
//          string memory _description
//     )  VibeBase(_description) {
//         baseRewardBasisPoints = _baseRewardBasisPoints;
//         referralBonusBasisPoints = _referralBonusBasisPoints;
//     }

//     /**
//      * @dev Registers a referral relationship.
//      * @param referrer The address that referred the new user.
//      * @param referred The address being referred.
//      */
//     function registerReferral(address referrer, address referred) external {
//         referrals[referred] = referrer;
//     }

//     function calculateTotalBasisFee(address addy, uint amount) external view override returns (int) {
//         if (referrals[addy] != address(0)) {
//             return baseRewardBasisPoints - referralBonusBasisPoints;
//         } else {
//             return baseRewardBasisPoints;
//         }
//     }
// }
