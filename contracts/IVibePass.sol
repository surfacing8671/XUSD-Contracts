// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IVibePass {
   function tokenByOwner(address _owner) external view returns (address);
 function viewUrl(address user) external view returns(string memory); 
function totalSupply()external view returns(uint256);

}