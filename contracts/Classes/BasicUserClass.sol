// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.24;

// import "./BaseClass.sol";

// /**
//  * @title AddSubSigActiveClass
//  * @dev This contract extends the BaseClass and adds functionality for managing activation status based on function signatures.
//  */
// contract BasicUserClass is BaseClass {
//     /// @dev Mapping to keep track of add signatures for each contract address.
//     mapping(uint => bool) public addSender;

//     /// @dev Mapping to keep track of subtract signatures for each contract address.
//     mapping(uint => bool) public subSender;
    
// address public trigger;
//     constructor(
//         address registry,
//         int _classBasis,      
//         string memory _note,
//         address classReg
      
//     ) BaseClass(registry, _classBasis, _note) {
    
//     }

//     function calcBasis(
//         address caller,
//         address to,
//         address from,
//         address sender,
//         uint amount
//     ) external virtual returns (bool) {
//        return true;
 
  
//     }

//     function triggerTo(
//         address to,
//         uint amount,
//         address caller
//     ) internal virtual  {}

//     function triggerFrom(
//         address from,
//         uint amount,
//         address caller
//     ) internal virtual  {}

//     function triggerCaller(
//         address caller,
//         uint amount,
//         address _caller
//     ) internal virtual  {}

//     function getClassBasis() external view override returns (int256) {
//         return classBasis;
//     }
// }
