// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./IVibeCalculator.sol";
import "./VibeBase.sol";
/**
 * @title RandomizedVibeCalculator
 * @dev A vibe calculator that applies a random vibe rate within a specified range.
 */
contract RandomizedVibeCalculator is VibeBase {
    int public immutable minRateBasisPoints;
    int public immutable maxRateBasisPoints;
    string public Description;
    /**
     * @dev Constructor to set the range for the random vibe rate.
     * @param _minRateBasisPoints The minimum vibe rate in basis points.
     * @param _maxRateBasisPoints The maximum vibe rate in basis points.
     */
    constructor(int _minRateBasisPoints, int _maxRateBasisPoints, VibeInfo memory _description, address _access
    )  VibeBase(_description, _access) {
        require(_minRateBasisPoints <= _maxRateBasisPoints, "Min rate must be <= max rate");
        minRateBasisPoints = _minRateBasisPoints;
        maxRateBasisPoints = _maxRateBasisPoints;
    }

    function calculateTotalBasisFee(address addy, uint amount) external view override returns (int) {
        uint256 random = uint256(keccak256(abi.encodePacked(block.timestamp, addy, amount))) % (uint256(maxRateBasisPoints) - uint256(minRateBasisPoints) + 1);
        return (minRateBasisPoints + int(random));
    }
}
