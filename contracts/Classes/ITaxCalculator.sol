
pragma solidity ^0.8.26;

interface ITaxCalculator1 {
function calculateTotalBasisFee(address origin, uint amount) external returns(int);
}


pragma solidity ^0.8.26;

interface ITaxCalculatorContract {
function calculateTotalBasisFee(address origin, uint amount) external returns(int);
}




interface ITaxCalculator{
function calculateTotalBasisFee(address origin, uint amount) external returns(int);

}