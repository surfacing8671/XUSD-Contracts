
pragma solidity ^0.8.26;




      


interface IVibeCalculator{
//function isRewards() external returns (bool);

function calculateTotalBasisFee(address addy, uint amount) external  returns (int); 

}
interface IRewardsModule{
//function isRewards() external returns (bool);

function calculateRewards(address to, address from, address caller, address sender, uint amount, int vibes) external ; 

}