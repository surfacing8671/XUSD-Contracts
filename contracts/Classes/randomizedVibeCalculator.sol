// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ITaxCalculator.sol";
import "./VibeBase.sol";
/**
 * @title RandomizedTaxCalculator
 * @dev A tax calculator that applies a random tax rate within a specified range.
 */
contract RandomizedTaxCalculator is VibeBase {
    int public immutable minRateBasisPoints;
    int public immutable maxRateBasisPoints;
    string public Description;
    /**
     * @dev Constructor to set the range for the random tax rate.
     * @param _minRateBasisPoints The minimum tax rate in basis points.
     * @param _maxRateBasisPoints The maximum tax rate in basis points.
     */
    constructor(int _minRateBasisPoints, int _maxRateBasisPoints, string memory _description
    )  VibeBase(_description) {
        require(_minRateBasisPoints <= _maxRateBasisPoints, "Min rate must be <= max rate");
        minRateBasisPoints = _minRateBasisPoints;
        maxRateBasisPoints = _maxRateBasisPoints;
    }

    function calculateTotalBasisFee(address addy, uint amount) external view override returns (int) {
        uint256 random = uint256(keccak256(abi.encodePacked(block.timestamp, addy, amount))) % (uint256(maxRateBasisPoints) - uint256(minRateBasisPoints) + 1);
        return minRateBasisPoints + int(random);
    }
}
