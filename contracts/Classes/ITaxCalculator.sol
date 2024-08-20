
pragma solidity ^0.8.26;

interface ITaxCalculator1 {
function calculateTotalBasisFee(address origin, uint amount) external returns(int);
}


pragma solidity ^0.8.26;


interface IVibeCalculatorContract{
function calculateTotalBasisFeeContract(address to, address from, address caller, uint amount) external  returns (int);
}
interface IVibeCalculatorNow{
function calculateTotalBasisFeeNow(address to, address from, address caller, uint amount) external  returns (int);
}
      


interface ITaxCalculator{
function calculateTotalBasisFee(address addy, uint amount) external  returns (int); 

}