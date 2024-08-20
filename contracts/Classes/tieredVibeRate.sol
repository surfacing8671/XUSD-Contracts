// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ITaxCalculator.sol";

/**
 * @title TieredRateTaxCalculator
 * @dev A tax calculator that imposes a tiered tax rate based on the transaction amount.
 */
contract TieredRateTaxCalculator is ITaxCalculator {
    int public immutable baseRateBasisPoints;
    int public immutable middleTierRateBasisPoints;
    int public immutable highTierRateBasisPoints;
    uint256 public immutable middleTierThreshold;
    uint256 public immutable highTierThreshold;

    /**
     * @dev Constructor to set the tiered tax rates and thresholds.
     * @param _baseRateBasisPoints The base tax rate in basis points.
     * @param _middleTierRateBasisPoints The tax rate for middle-tier transactions in basis points.
     * @param _highTierRateBasisPoints The tax rate for high-tier transactions in basis points.
     * @param _middleTierThreshold The threshold for middle-tier transactions.
     * @param _highTierThreshold The threshold for high-tier transactions.
     */
    constructor(
        int _baseRateBasisPoints,
        int _middleTierRateBasisPoints,
        int _highTierRateBasisPoints,
        uint256 _middleTierThreshold,
        uint256 _highTierThreshold
    ) {
        baseRateBasisPoints = _baseRateBasisPoints;
        middleTierRateBasisPoints = _middleTierRateBasisPoints;
        highTierRateBasisPoints = _highTierRateBasisPoints;
        middleTierThreshold = _middleTierThreshold;
        highTierThreshold = _highTierThreshold;
    }

    function calculateTotalBasisFee(address addy, uint amount) external view override returns (int) {
        if (amount >= highTierThreshold) {
            return highTierRateBasisPoints;
        } else if (amount >= middleTierThreshold) {
            return middleTierRateBasisPoints;
        } else {
            return baseRateBasisPoints;
        }
    }
}
