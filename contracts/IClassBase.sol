// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IClassBase {


function getClassBasis()external view returns(int256);
function getClassType()external view returns(uint);
function getActiveAdd(address user, address to, address from, address sender,  bytes4 sig, uint amount)external returns(bool);
function getActiveSub(address user, address to, address from, address sender,  bytes4 sig, uint amount)external returns(bool);
}