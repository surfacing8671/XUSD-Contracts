// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

interface ITaxCalculator {
    /**
     * @dev Returns the tax rate in basis points for a specific transaction.
     * @param from The sender of the tokens.
     * @param to The recipient of the tokens.
     * @param caller The address that initiated the transaction.
     * @return uint256 The tax rate in basis points.
     */
    function calculateTaxBasisPoints(address from, address to, address caller) external view returns (uint256);

    /**
     * @dev Returns the contract address that should be interacted with for tax purposes.
     * @return address The contract address to interact with.
     */
    function getTaxRecipientContract() external view returns (address);
}

/**
 * @title StakingTaxCalculator
 * @dev A tax calculator that specifies a staking contract for tax collection.
 */
contract StakingTaxCalculator is ITaxCalculator {
    uint256 public immutable taxRateBasisPoints;
    address public immutable stakingContract;

    /**
     * @dev Constructor to set the tax rate and staking contract address.
     * @param _taxRateBasisPoints The tax rate in basis points.
     * @param _stakingContract The address of the staking contract to receive the tax.
     */
    constructor(uint256 _taxRateBasisPoints, address _stakingContract) {
        taxRateBasisPoints = _taxRateBasisPoints;
        stakingContract = _stakingContract;
    }

    /**
     * @dev Returns the tax rate for the transaction.
     * @param from The sender of the tokens.
     * @param to The recipient of the tokens.
     * @param caller The address that initiated the transaction.
     * @return uint256 The tax rate in basis points.
     */
    function calculateTaxBasisPoints(address from, address to, address caller) external view override returns (uint256) {
        return taxRateBasisPoints;
    }

    /**
     * @dev Returns the staking contract address where the tax should be sent.
     * @return address The staking contract address.
     */
    function getTaxRecipientContract() external view override returns (address) {
        return stakingContract;
    }
}