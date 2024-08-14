// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;


import "../atropamath.sol";
import "../registry.sol";
interface ITaxCalculator {

  
       function calculateTotalBasisFee(address origin, uint amount) external returns(int);
   
}
/**
 * @title WhitelistedAddressTaxCalculator
 * @dev A tax calculator that imposes a tax unless both the sender and recipient are whitelisted.
 */
abstract contract WhitelistedAddressTaxCalculator is ITaxCalculator {
    using AtropaMath for address;
    int public immutable taxRateBasisPoints;
    mapping(uint => bool) public whitelistedAddresses;

    /**
     * @dev Constructor to set the tax rate and optionally initial whitelisted addresses.
     * @param _taxRateBasisPoints The tax rate for non-whitelisted addresses in basis points.
     * @param _initialWhitelistedAddresses An array of addresses to initially whitelist.
     */
    constructor(int _taxRateBasisPoints, address[] memory _initialWhitelistedAddresses) {
        taxRateBasisPoints = _taxRateBasisPoints;
        for (uint256 i = 0; i < _initialWhitelistedAddresses.length; i++) {
            uint hash = address(this).hashWith(_initialWhitelistedAddresses[i]);
            whitelistedAddresses[hash] = true;
        }
    }

    /**
     * @dev Add an address to the whitelist.
     * @param addr The address to whitelist.
     */
    function addToWhitelist(address addr) external {
        uint hash = address(this).hashWith(addr);
        whitelistedAddresses[hash] = true;
    }


   function calculateTotalBasisFee(address origin, address from, address to, uint amount) external returns(int) {
        // uint hash = address(this).hashWith(addy);
        // if (whitelistedAddresses[hash]) {
        //     return 0; // No tax if both are whitelisted
        // }
        // return int256(taxRateBasisPoints);
    }
}
