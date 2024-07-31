// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.24;

import "./Ownable.sol";
import "./registry.sol";
import "./atropamath.sol";
import "./IClassBase.sol";

/**
 * @title UserClassRegistry
 * @dev Abstract contract for managing user classes and their active statuses. This contract provides functionalities for registering, validating, and managing user classes.
 */
abstract contract ClassRegistry is Ownable {
    using LibRegistry for LibRegistry.Registry;
    using AtropaMath for address;

    enum ClassType {        
        USER,
        CONTRACT
    }

    struct Class {     
        address classAddress; 
        ClassType classType;
        int256 basisFee;
    }

   

   
    LibRegistry.Registry internal ClassRegistryList;
  
    mapping(uint => Class) internal Classes;


    /**
     * @notice Checks if a class exists in the registry.
     * @param hash The hash representing the class.
     * @return True if the class exists, false otherwise.
     */
    function _hasClass(uint256 hash) private view returns (bool) {    
        return ClassRegistryList.Contains(hash);
    }


    /**
     * @notice Checks if a given class is valid.
     * @param dom The address of the class.
     * @return True if the class is valid, false otherwise.
     */
    function ClassValid(address dom) public view returns (bool) {                
        uint256 hash = address(this).hashWith(dom);   
        return ClassRegistryList.Contains(hash);
    }


    function _hasAccess(uint256 hash, ClassType min) private view returns (bool) {    
       
        if(Classes[hash].classType <= min) return true;
        return false;
    }

    function HasAccess(address user, ClassType min, address dom) public view returns (bool) {                
     
        
        uint256 hash = user.hashWith(dom);
        if(ClassRegistryList.Contains(hash)) {
           
            return _hasAccess(hash, min);
        }
        return false;
    }

    function getClassType(address dom) public view returns (ClassType) {
        uint256 hash = address(this).hashWith(dom);  
        return Classes[hash].classType;
    }


    /**
     * @notice Registers a class.
     * @param dom The address of the class.
     */
    function RegisterClass(address dom) public {
        SetClass(dom);
    }

    /**
     * @notice Retrieves class details for a given address.
     * @param dom The address of the class.
     * @return The class details.
     */
    function getClass(address dom) public view returns (Class memory) {
        uint256 hash = address(this).hashWith(dom);  
        return Classes[hash];
    }



    function getBasis(address dom) public view returns (int) {
        uint256 hash = address(this).hashWith(dom);  
        return Classes[hash].basisFee;
    }



 
    /**
     * @notice Gets the total count of registered classes.
     * @return The total count of registered classes.
     */
    function ClassRegistryCount() public view returns (uint256) {      
        return ClassRegistryList.Count();
    }

   
    /**
     * @notice Gets the details of a class by index.
     * @param i The index of the class.
     * @return The class details.
     */
    function GetClassByIndex(uint256 i) public view returns (Class memory) {
        uint256 hash = ClassRegistryList.GetHashByIndex(i);       
        return Classes[hash];
    }




   


    function SetClass(address dom) internal {                
        uint256 hash = address(this).hashWith(dom);   
        if(ClassRegistryList.Contains(hash)) {        
           
        } else {
            ClassRegistryList.Register(hash);
            Classes[hash].classAddress = dom;      
            Classes[hash].basisFee = IClassBase(dom).getClassBasis();   
            Classes[hash].classType = IClassBase(dom).getClassType() == 0 ? ClassType.CONTRACT : ClassType.USER;   

         
        }
    }

    /**
     * @notice Removes a class from the registry.
     * @param dom The address of the class.
     */
    function RemoveClass(address dom) internal {
        uint256 hash = address(this).hashWith(dom);
        ClassRegistryList.Remove(hash);
        delete Classes[hash];

    }

  
}