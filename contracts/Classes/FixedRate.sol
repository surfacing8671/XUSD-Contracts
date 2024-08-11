// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "./ITaxCalculator.sol";

/**
 * @title FlatRateTaxCalculator
 * @dev A tax calculator that imposes a flat rate on all transactions.
 */
contract FlatRateTaxCalculator is ITaxCalculator {
    uint256 public immutable flatRateBasisPoints;

    /**
     * @dev Constructor to set the flat tax rate.
     * @param _flatRateBasisPoints The flat tax rate in basis points (1 basis point = 0.01%).
     */
    constructor(uint256 _flatRateBasisPoints) {
        flatRateBasisPoints = _flatRateBasisPoints;
    }

    function calculateTaxBasisPoints(address addy) external view override returns (int) {
        return int256(flatRateBasisPoints);
    }
}
