// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ITaxCalculatorContract.sol";

/**
 * @title StakingIncentiveTaxCalculator
 * @dev A tax calculator that reduces the tax rate (negative basis points) when interacting with a specific staking contract.
 */
contract StakingIncentiveTaxCalculator is ITaxCalculatorContract {
    address public immutable stakingContract;
    int256 public immutable incentiveBasisPoints; // Can be negative for tax reduction

    /**
     * @dev Constructor to set the staking contract address and incentive basis points.
     * @param _stakingContract The address of the staking contract.
     * @param _incentiveBasisPoints The incentive in basis points (e.g., -50 for a 0.5% reduction).
     */
    constructor(address _stakingContract, int256 _incentiveBasisPoints) {
        stakingContract = _stakingContract;
        incentiveBasisPoints = _incentiveBasisPoints;
    }

    function calculateTaxBasisPoints(
        address to,
        address from
    ) external view override returns (int) {
        if (from == stakingContract || to == stakingContract) {
            // If interacting with the staking contract, return the negative incentive
            return incentiveBasisPoints;
        }
        // No incentive applied if not interacting with the staking contract
        return 0;
    }

    function getContract()external view returns(address[] memory){
            
        address [] memory contracts = new address[](1);
        contracts[0] = stakingContract;
        return contracts;
    }
}
