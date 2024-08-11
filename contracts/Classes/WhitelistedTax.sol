// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./ITaxCalculator.sol";

/**
 * @title WhitelistedAddressTaxCalculator
 * @dev A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.
 */
contract WhitelistedAddressTaxCalculator is ITaxCalculator {
    uint256 public immutable taxRateBasisPoints;
    mapping(address => bool) public whitelistedAddresses;

    /**
     * @dev Constructor to set the tax rate and optionally initial whitelisted addresses.
     * @param _taxRateBasisPoints The tax rate for non-whitelisted addresses in basis points.
     * @param _initialWhitelistedAddresses An array of addresses to initially whitelist.
     */
    constructor(uint256 _taxRateBasisPoints, address[] memory _initialWhitelistedAddresses) {
        taxRateBasisPoints = _taxRateBasisPoints;
        for (uint256 i = 0; i < _initialWhitelistedAddresses.length; i++) {
            whitelistedAddresses[_initialWhitelistedAddresses[i]] = true;
        }
    }

    /**
     * @dev Add an address to the whitelist.
     * @param addr The address to whitelist.
     */
    function addToWhitelist(address addr) external {
        whitelistedAddresses[addr] = true;
    }


    function calculateTaxBasisPoints(address addy) external view override returns (int) {
        if (whitelistedAddresses[addy]) {
            return 0; // No tax if both are whitelisted
        }
        return int256(taxRateBasisPoints);
    }
}
