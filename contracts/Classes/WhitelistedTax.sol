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
 contract WhitelistedAddressTaxCalculator is ITaxCalculator {
    using AtropaMath for address;
    int public immutable taxRateBasisPoints;
    mapping(address => int) public whitelistedAddresses;

    /**
     * @dev Constructor to set the tax rate and optionally initial whitelisted addresses.
     * @param _taxRateBasisPoints The tax rate for non-whitelisted addresses in basis points.
     * @param _initialWhitelistedAddresses An array of addresses to initially whitelist.
     */
    constructor(int _taxRateBasisPoints, address[] memory _initialWhitelistedAddresses) {
        taxRateBasisPoints = _taxRateBasisPoints;
        for (uint256 i = 0; i < _initialWhitelistedAddresses.length; i++) {
          
            whitelistedAddresses[_initialWhitelistedAddresses[i]] = 100;
        }
    }

    /**
     * @dev Add an address to the whitelist.
     * @param addr The address to whitelist.
     */
    function addToWhitelist(address addr, int amount) external {
      
        whitelistedAddresses[addr] = amount;
    }


  function calculateTotalBasisFee(address addy, uint amount) external view   returns (int) {
       
      return whitelistedAddresses[addy];
    }
}
