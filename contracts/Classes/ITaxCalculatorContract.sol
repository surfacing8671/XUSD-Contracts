// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

interface ITaxCalculatorContract {
    function calculateTaxBasisPoints(address to, address from) external view returns (int);
    function getContract()external view returns(address[] memory);
}