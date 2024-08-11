// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface ILitPass {


    function getIdFromOwner(address user) external view returns (uint);
    function getOwner(uint tokenId) external  returns (address);
    function hasLitPass(address user ) external  returns (bool); 

}