// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IVibePass {
   function tokenIdByOwner(address _owner) external view returns (uint);
   function addClass(address class, bool active, uint classType, bool _process) external;
 function viewUrl(address user) external view returns(string memory); 
function totalSupply()external view returns(uint256);
 function getBurnAmounts(address user) external view  returns (uint256);

}