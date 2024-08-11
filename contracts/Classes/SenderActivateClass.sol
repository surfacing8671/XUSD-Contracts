// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.26;

// import "./BaseClass.sol";
// import "../atropamath.sol";

// /**
//  * @title AddSubSigActiveClass
//  * @dev This contract extends the BaseClass and adds functionality for managing activation status based on function signatures.
//  */
// contract SenderActivateClass is BaseClass {
//   using AtropaMath for address;

//   address public trigger;
//   /**
//    * @dev Constructor that sets the class basis fee.
//    * @param _classBasis The basis fee for the class.
//    */
//   constructor(
//     address registry,
//     int _classBasis,
//     string memory _note,
//     address _trigger
//   ) BaseClass(registry, _classBasis, _note) {
//     trigger = _trigger;
//   }

//   function calcBasis(
//     address caller,
//     address to,
//     address from,
//     address sender,
//     uint amount
//   ) external virtual override returns (bool) {
//     return triggerTo(to, amount);
//   }

//   function triggerTo(address to, uint amount) internal virtual returns (bool) {
//     if (amount > 200 * 1e18) {
//       if (to == trigger) {
//         return true;
//       }
//     }
//   }

//   // function addSenderAdd(address sender) external onlyOwner {
//   //     uint hash = address(this).hashWith(sender);

//   //     userTriggerAdd[hash] = true;
//   //     userTriggerSub[hash] = false;
//   // }

//   // function subSenderAdd(address sender) external onlyOwner {
//   //     uint hash = address(this).hashWith(sender);

//   //     userTriggerAdd[hash] = false;
//   //     userTriggerSub[hash] = true;
//   // }

//   function getClassBasis() external view override returns (int256) {
//     return classBasis;
//   }
// }
