// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./BaseClass.sol";
import "../atropamath.sol";

/**
 * @title AddSubSigActiveClass
 * @dev This contract extends the BaseClass and adds functionality for managing activation status based on function signatures.
 */
contract SenderActivateClass is BaseClass {
    using AtropaMath for address;

    /// @dev Mapping to keep track of add signatures for each contract address.
    mapping(uint =>  bool) public addSender;
    mapping(uint =>  mapping(address =>  bool)) public blockUserClassAdd;
    mapping(uint =>  mapping(address =>  bool)) public blockUserClassSub;

    /// @dev Mapping to keep track of subtract signatures for each contract address.
    mapping(uint => bool) public subSender;

    /**
     * @dev Constructor that sets the class basis fee.
     * @param _classBasis The basis fee for the class.
     */
    constructor(int _classBasis, uint _classType) BaseClass(_classBasis, _classType) {}

    /**
     * @notice Sets the active status of a user based on function signatures.
     * @dev This function can only be called by the class registry.
     * @param user The address of the user.
     * @param to The address of the recipient.
     * @param from The address of the sender.
     * @param sender The address of the original sender.
     * @param sig The function signature.
     * @return True if the user is active, false otherwise.
     */
    function getActiveAdd(
        address user,
        address to,
        address from,
        address sender,
        bytes4 sig,
        uint amount
    ) external override onlyRegistry returns (bool) {
    
        uint hash = address(this).hashWith(sender);
    
        uint hashU = user.hashWith(sender);
        if(amount >= 1 * 1e18){
          
        if(addSender[hash]){
            UserActiveList[hashU] = true;
        }
       
    }
        return UserActiveList[hashU];
    }

    function getActiveSub(
        address user,
        address to,
        address from,
        address sender,
        bytes4 sig,
        uint amount
    ) external override onlyRegistry returns (bool) {
        uint hash = address(this).hashWith(sender);
        uint hashU = user.hashWith(sender);
        if(amount >= 1 * 1e18){
          
        if(subSender[hash]){
            UserActiveList[hashU] = false;
            return true;
        }
        return false;
    }
        
    }


    function addSenderAdd(address sender) external onlyOwner {
        uint hash = address(this).hashWith(sender);
   
        addSender[hash] = true;
        
    }

    function letUserFromApplyingClass(address user, address sender) external onlyOwner {
        uint hash = address(this).hashWith(sender);
   
        blockUserClassAdd[hash][user] = false;
        
    }

    function blockUserFromApplyingClass(address user, address sender) external onlyOwner {
        uint hash = address(this).hashWith(sender);
   
        blockUserClassAdd[hash][user] = true;
        
    }


    function letUserFromApplyingSubClass(address user, address sender) external onlyOwner {
        uint hash = address(this).hashWith(sender);
   
        blockUserClassSub[hash][user] = false;
        
    }

    function blockUserFromApplyingSubClass(address user, address sender) external onlyOwner {
        uint hash = address(this).hashWith(sender);
   
        blockUserClassSub[hash][user] = true;
        
    }


    function deleteSenderAdd(address sender) external onlyOwner {
        uint hash = address(this).hashWith(sender);
   
        addSender[hash] = false;
    }


    function addSenderSub(address sender) external onlyOwner {
        uint hash = address(this).hashWith(sender);
   
        subSender[hash] = true;
        
    }


    function deleteSenderSub(address sender) external onlyOwner {
        uint hash = address(this).hashWith(sender);
   
        subSender[hash] = false;
    }

   
}
