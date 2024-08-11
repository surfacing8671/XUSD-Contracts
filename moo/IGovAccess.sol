// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;
import "./AccessGovernanceLibrary.sol";
/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IGovAccess {


    function hasAccess(address user, AccessGovernanceLibrary.AccessType min) external view returns (bool);


}