// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./IVibeCalculator.sol";
import "./VibeBase.sol";
/**
 * @title ReferralBasedTaxCalculator
 * @dev A tax calculator that provides a discount for referred addresses.
 */
contract ReferralBasedTaxCalculator is IVibeCalculator {
    int public immutable baseRateBasisPoints;
    int public immutable referralDiscountBasisPoints;
    mapping(address => address) public referrals;
       string public Description;

    /**
     * @dev Constructor to set the base rate and referral discount.
     * @param _baseRateBasisPoints The base tax rate in basis points.
     * @param _referralDiscountBasisPoints The discount applied if a referral is involved, in basis points.
     */
    constructor(
        int _baseRateBasisPoints,
        int _referralDiscountBasisPoints,
        string memory _description
    ) {
        baseRateBasisPoints = _baseRateBasisPoints;
        referralDiscountBasisPoints = _referralDiscountBasisPoints;
        Description = _description;
    }

    /**
     * @dev Registers a referral relationship.
     * @param referrer The address that referred the new address.
     * @param referred The address being referred.
     */
    function registerReferral(address referrer, address referred) external {
        referrals[referred] = referrer;
    }

        function getDescription() external view returns(string memory){
        return Description;
    }

    function calculateTotalBasisFee(address addy, uint amount) external view override returns (int) {
        if (referrals[addy] != address(0)) {
            return (baseRateBasisPoints - referralDiscountBasisPoints);
        } else {
            return (baseRateBasisPoints);
        }
    }
}
