// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;



/**
 * @title FlatRateTaxCalculator
 * @dev A tax calculator that imposes a flat rate on all transactions.
 */
contract FlatRateTaxCalculator  {
    int public immutable flatRateBasisPoints;

    /**
     * @dev Constructor to set the flat tax rate.
     * @param _flatRateBasisPoints The flat tax rate in basis points (1 basis point = 0.01%).
     */
    constructor(int _flatRateBasisPoints) {
        flatRateBasisPoints = _flatRateBasisPoints;
    }

    function calculateTotalBasisFee(address addy, uint amount) external view  returns (int) {
        return int256(flatRateBasisPoints);
    }
}