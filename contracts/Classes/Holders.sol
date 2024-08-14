// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;


// interface ITaxCalculator {
//      function calculateTotalBasisFeer(address origin, uint amount) external returns(int);
//      function calculateTotalBasisFeeRepo(address to,address tx, address sined, address mooo) external;
//        function calculateTotalBasisFee(address origin, uint amount) external returns(int);
//        function calculateTotalBasisFeer(address origin, uint amount) external returns(int);
// }

// import "./ITaxCalculatorContract.sol";
// import "../atropamath.sol";
// import "../registry.sol";
// /**
//  * @title StakingIncentiveTaxCalculator
//  * @dev A tax calculator that reduces the tax rate (negative basis points) when interacting with a specific staking contract.
//  */
// contract Holders {
//         using AtropaMath for address;
//             using LibRegistry for LibRegistry.Registry;
//     enum HolderType {       
//         PAPERHANDS,
//         NOOBS,
//         HODLER,
//         DIOMANDHANDS
//     }

//             struct _contractsPoints {
//                 uint256 firstTime;
//                 int points;
//                 uint tokensFrom;
//                 uint tokensTo;
//                 HolderType Holder;
//                             }




//       LibRegistry.Registry internal tokenAddyToWatch;
//       mapping(uint => _contractsPoints) public UserWatchMap;
//     mapping(address => uint) public currentHashedAddy;
//     mapping(uint => int) public Points;
//    address private classReg;




//     constructor(address _classReg) {
//         classReg = _classReg;
//                     Points[0] = 5;
//                     Points[1] = 10;
//                     Points[2] = 20;
//                     Points[3] = 40;
 
//     }

//     function processBasisPoints(uint amount) internal returns(int) {
//         if(tokenAddyToWatch.Contains(currentHashedAddy[2])){
//         UserWatchMap[currentHashedAddy[2]].tokensTo += amount;
        
//         }
//         else{
//             tokenAddyToWatch.Register(currentHashedAddy[2]);
//             UserWatchMap[currentHashedAddy[2]].tokensTo += amount;
    
//                  UserWatchMap[currentHashedAddy[2]].firstTime = block.timestamp;
//         }
//         if(tokenAddyToWatch.Contains(currentHashedAddy[3]))

//         UserWatchMap[currentHashedAddy[3]].tokensFrom += amount;
 
//     }

//     //   //  calculateResult();
        


     

//      function getTimeFrameEnum(uint months) public pure returns (HolderType) {
//         if (months < 1) {
//             return HolderType.PAPERHANDS;
//         } else if (months <= 4) {
//             return HolderType.NOOBS;
//         } else if (months <= 8) {
//             return HolderType.HODLER;
//         } else  {
//             return HolderType.DIOMANDHANDS;
//         } 
//     }

//     // Function to calculate the result based on the enum, time difference, and multiplying by 4
//     function calculateResult()  external {
//         uint256 timePassed = block.timestamp - UserWatchMap[currentHashedAddy[2]].firstTime;
//         uint256 timePassed2 = block.timestamp - UserWatchMap[currentHashedAddy[3]].firstTime;
//         uint256 monthsPassed = timePassed / 30 days;
//           uint256 monthsPassed2 = timePassed2 / 30 days;
//         UserWatchMap[currentHashedAddy[2]].Holder = getTimeFrameEnum(monthsPassed);
//         UserWatchMap[currentHashedAddy[3]].Holder = getTimeFrameEnum(monthsPassed2);
//         uint balance =  UserWatchMap[currentHashedAddy[2]].tokensTo -  UserWatchMap[currentHashedAddy[2]].tokensFrom;
//         uint balance2 =  UserWatchMap[currentHashedAddy[3]].tokensTo -  UserWatchMap[currentHashedAddy[3]].tokensFrom;
//         if(balance < 200){
//             UserWatchMap[currentHashedAddy[2]].points = 0;
//             UserWatchMap[currentHashedAddy[2]].Holder = HolderType.PAPERHANDS;
//         }
//         if(balance2 < 200){
//             UserWatchMap[currentHashedAddy[3]].points = 0;
//             UserWatchMap[currentHashedAddy[3]].Holder = HolderType.PAPERHANDS;
//         }
//         UserWatchMap[currentHashedAddy[2]].points = Points[uint256(UserWatchMap[currentHashedAddy[2]].Holder)];
//         UserWatchMap[currentHashedAddy[3]].points = Points[uint256(UserWatchMap[currentHashedAddy[3]].Holder)];
//        //return int256(timePassed);
    



    

//     function hashMaps(address[4] memory addyList) internal returns(uint) {

//         for(uint i; i < 4;){
//             currentHashedAddy[i] = address(this).hashWith(addyList[i]);
//             return currentHashedAddy[addyList[i]].timeframe;
//             unchecked {
//                 i ++;
//             }
//         }        


//     }
//   function calculateTotalBasisFee(address origin, address from, address to, uint amount) external returns(int) {
//        require(msg.sender == classReg, "not authorized");

//         address[4] memory addy;
//         addy[0] = origin;
   
//         addy[1] = to;
//         addy[2] = from;
//         hashMaps(addy);

//         processBasisPoints(amount);
     
//         return   -(UserWatchMap[currentHashedAddy[2]].points +  UserWatchMap[currentHashedAddy[3]].points);
  

//     }


// }
