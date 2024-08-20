// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ITaxCalculator.sol";
import "./BaseClass.sol";
/**
 * @title HoldingPeriodNegativeTaxCalculator
 * @dev A tax calculator that provides increasing rewards based on the holding period of an asset.
 */
contract HoldingPeriodNegativeTaxCalculator is VibeBase {
    int public immutable shortTermRewardBasisPoints;
    int public immutable longTermRewardBasisPoints;
    uint256 public immutable holdingPeriodThreshold; // Time in seconds for the threshold between short and long term

    mapping(address => uint256) public purchaseTimestamps;

    /**
     * @dev Constructor to set the reward rates and holding period threshold.
     * @param _shortTermRewardBasisPoints The reward rate for short-term holdings in negative basis points.
     * @param _longTermRewardBasisPoints The reward rate for long-term holdings in negative basis points.
     * @param _holdingPeriodThreshold The threshold in seconds to define short-term vs long-term holding.
     */
    constructor(
        int _shortTermRewardBasisPoints,
        int _longTermRewardBasisPoints,
        uint256 _holdingPeriodThreshold,
        string memory _description
    ) VibeBase(_description) {
        shortTermRewardBasisPoints = _shortTermRewardBasisPoints;
        longTermRewardBasisPoints = _longTermRewardBasisPoints;
        holdingPeriodThreshold = _holdingPeriodThreshold;
    }

    /**
     * @dev Record the timestamp when an asset is purchased.
     * @param _addy The address that purchased the asset.
     */
    function recordPurchase(address _addy) external {
        purchaseTimestamps[_addy] = block.timestamp;
    }

    function calculateTotalBasisFee(address addy, uint amount) external view override returns (int) {
        uint256 purchaseTimestamp = purchaseTimestamps[addy];
        if (block.timestamp - purchaseTimestamp >= holdingPeriodThreshold) {
            return longTermRewardBasisPoints;
        } else {
            return shortTermRewardBasisPoints;
        }
    }
}
