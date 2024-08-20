// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ITaxCalculator.sol";

/**
 * @title VolumeBasedTaxCalculator
 * @dev A tax calculator that imposes different tax rates based on the transaction volume.
 */
contract VolumeBasedTaxCalculator is ITaxCalculator {
    int public immutable lowVolumeRateBasisPoints;
    int public immutable highVolumeRateBasisPoints;
    uint256 public immutable volumeThreshold; // Threshold for high-volume transactions

    /**
     * @dev Constructor to set the tax rates and volume threshold.
     * @param _lowVolumeRateBasisPoints The tax rate for low-volume transactions in basis points.
     * @param _highVolumeRateBasisPoints The tax rate for high-volume transactions in basis points.
     * @param _volumeThreshold The threshold for high-volume transactions.
     */
    constructor(
        int _lowVolumeRateBasisPoints,
        int _highVolumeRateBasisPoints,
        uint256 _volumeThreshold
    ) {
        lowVolumeRateBasisPoints = _lowVolumeRateBasisPoints;
        highVolumeRateBasisPoints = _highVolumeRateBasisPoints;
        volumeThreshold = _volumeThreshold;
    }

    function calculateTotalBasisFee(address addy, uint amount) external view override returns (int) {
        if (amount >= volumeThreshold) {
            return highVolumeRateBasisPoints;
        } else {
            return lowVolumeRateBasisPoints;
        }
    }
}
