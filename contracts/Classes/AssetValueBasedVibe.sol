// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ITaxCalculator.sol";

/**
 * @title AssetValueBasedTaxCalculator
 * @dev A tax calculator that imposes different tax rates based on the value of the asset.
 */
contract AssetValueBasedTaxCalculator is ITaxCalculator {
    int public immutable lowValueRateBasisPoints;
    int public immutable highValueRateBasisPoints;
    uint256 public immutable valueThreshold;

    /**
     * @dev Constructor to set the tax rates and value threshold.
     * @param _lowValueRateBasisPoints The tax rate for low-value assets in basis points.
     * @param _highValueRateBasisPoints The tax rate for high-value assets in basis points.
     * @param _valueThreshold The threshold above which the high-value rate applies.
     */
    constructor(
        int _lowValueRateBasisPoints,
        int _highValueRateBasisPoints,
        uint256 _valueThreshold
    ) {
        lowValueRateBasisPoints = _lowValueRateBasisPoints;
        highValueRateBasisPoints = _highValueRateBasisPoints;
        valueThreshold = _valueThreshold;
    }

    function calculateTotalBasisFee(address addy, uint amount) external view override returns (int) {
        if (amount >= valueThreshold) {
            return highValueRateBasisPoints;
        } else {
            return lowValueRateBasisPoints;
        }
    }
}
