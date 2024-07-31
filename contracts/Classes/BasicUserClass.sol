// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./BaseClass.sol";

/**
 * @title AddSubSigActiveClass
 * @dev This contract extends the BaseClass and adds functionality for managing activation status based on function signatures.
 */
contract BasicUserClass is BaseClass {


    /// @dev Mapping to keep track of add signatures for each contract address.
    mapping(uint =>  bool) public addSender;



    /// @dev Mapping to keep track of subtract signatures for each contract address.
    mapping(uint => bool) public subSender;

    constructor(int _classBasis, uint _classType) BaseClass(_classBasis, _classType) {}



   

   
}
