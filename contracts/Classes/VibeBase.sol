// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./ITaxCalculator.sol";



/**
 * @title BaseClass
 * @dev This is an abstract base class contract that includes basic functionalities for user activation and class basis management.
 */
abstract contract VibeBase is ITaxCalculator {
 
    mapping(uint => bool) public UserActiveList;

    string public description;

    struct VibeInfo {
        address creatorAddress;
        string info;
    }

    constructor(string memory _note)  {
        
        description = _note; 
  
    }

    function getDescription()external view returns (string memory){
        return description;
    }
    function calculateTotalBasisFee(address addy, uint amount) external virtual  returns (int) {}


}
