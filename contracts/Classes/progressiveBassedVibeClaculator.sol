// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./IVibeCalculator.sol";
import "./VibeBase.sol";
/**
 * @title ProgressiveTaxCalculator
 * @dev A tax calculator that imposes a progressively increasing tax rate based on the cumulative transaction amount.
 */
contract ProgressiveTaxCalculator is VibeBase {
    mapping(address => uint256) public cumulativeTransfers;
    int public immutable baseRateBasisPoints;
    int public immutable rateIncrementBasisPoints;
    uint256 public immutable incrementThreshold; // Threshold at which the tax rate increases
       string public Description;
    /**
     * @dev Constructor to set the base rate, rate increment, and increment threshold.
     * @param _baseRateBasisPoints The base tax rate in basis points.
     * @param _rateIncrementBasisPoints The amount the tax rate increases per threshold.
     * @param _incrementThreshold The transaction volume threshold at which the tax rate increases.
     */
    constructor(
        int _baseRateBasisPoints,
        int _rateIncrementBasisPoints,
        uint256 _incrementThreshold,
  VibeInfo memory _description,
   address _access
    ) VibeBase(_description, _access){
        baseRateBasisPoints = _baseRateBasisPoints;
        rateIncrementBasisPoints = _rateIncrementBasisPoints;
        incrementThreshold = _incrementThreshold;
    }

    function calculateTotalBasisFee(address addy, uint amount) external  override returns (int) {
        uint256 cumulativeAmount = cumulativeTransfers[addy];
        recordTransfer(addy, amount);
        int increment = int256(cumulativeAmount / incrementThreshold) * rateIncrementBasisPoints;
        return (baseRateBasisPoints + increment);
    }
    /**
     * @dev Record the amount transferred by an address to update cumulative transfers.
     * @param _addy The address that transferred the amount.
     * @param _amount The amount that was transferred.
     */
    function recordTransfer(address _addy, uint256 _amount) internal {
        cumulativeTransfers[_addy] += _amount;
    }
}
