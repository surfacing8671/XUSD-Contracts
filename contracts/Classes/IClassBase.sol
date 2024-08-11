// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @dev Interface of the ERC20 standard as defined in the EIP.
 */
interface IClassBase {
    struct ClassTax {
        int bassis;
        bool activate;
        bool deActivate;
    }

function getClassBasis()external view returns(int256);
function getNote()external view returns (string memory);
function getTaxRecipientContract() external view  returns (address);
function calculateTaxBasisPoints(address from, address to, address caller)external view  returns (uint256) ;
function calcBasis(address caller, address to, address from, address sender, uint amount) external returns(bool);
}