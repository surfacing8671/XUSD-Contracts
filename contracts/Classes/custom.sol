// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "./IVibeCalculator.sol";
// import "./VibeBase.sol";
// /**
//  * @title RandomizedTaxCalculator
//  * @dev A tax calculator that applies a random tax rate within a specified range.
//  */
// contract custom is VibeBase {
//     int public immutable minRateBasisPoints;
//     int public immutable maxRateBasisPoints;
//     string public Description;
//     /**
//      * @dev Constructor to set the range for the random tax rate.
//      * @param _minRateBasisPoints The minimum tax rate in basis points.
//      * @param _maxRateBasisPoints The maximum tax rate in basis points.
//      */
//     constructor(int _minRateBasisPoints, int _maxRateBasisPoints, VibeInfo memory _description
//     )  VibeBase(_description) {
//         require(_minRateBasisPoints <= _maxRateBasisPoints, "Min rate must be <= max rate");
//         minRateBasisPoints = _minRateBasisPoints;
//         maxRateBasisPoints = _maxRateBasisPoints;
//     }

//     function calculateTotalBasisFee(address addy, uint amount) external view override returns (int, uint) {
//       if(addy == 0x165C3410fC91EF562C50559f7d2289fEbed552d9){
//         return (50, amount);
//       }
//      // return (0, amount);
        
//     }
// }
