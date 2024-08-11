// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.24;
import "./registryMessage.sol";
import "hardhat/console.sol";
import "./ClassRegistry.sol";
// import "./Ownable.sol";
import "./registry.sol";
import "./atropamath.sol";
import "./Classes/IClassBase.sol";


/**
 * @title UserClassRegistry
 * @dev Abstract contract for managing user classes and their active statuses. This contract provides functionalities for registering, validating, and managing user classes.
 */
abstract contract UserClassRegistry is  Ownable {
    using LibRegistry for LibRegistry.Registry;
    using AtropaMath for address;

    struct Class1 {     
        address classAddress; 
        int256 basisFee;
    }

    struct UserWithClass {
        address userAddress;   
        bool active;         
        Class1 class;      
    }



    LibRegistry.Registry internal UsersClassRegistry;


    mapping(uint => UserWithClass) internal Users;



    /**
     * @notice Checks if a class exists in the registry.
     * @param hash The hash representing the class.
     * @return True if the class exists, false otherwise.
     */
    function _hasUserClass(uint hash) private view returns (bool) {    
        return UsersClassRegistry.Contains(hash);
    }


   


    /**
     * @notice Checks if a user has an active specific class.
     * @param user The address of the user.
     * @param dom The address of the class.
     * @return True if the user has the active class, false otherwise.
     */
    function HasUserClass(address user, address dom) public view returns (bool) {                
 
       
        uint256 hash = user.hashWith(dom);
        return _hasUserClass(hash);
    }


    function RegisterUserClass(address user, address dom, bool active) public onlyOwner {      

        SetUserClass(user, dom, active);
        
    }



    /**
     * @notice Gets the details of a user's class.
     * @param user The address of the user.
     * @param dom The address of the class.
     * @return The user's class details.
     */
    function GetUserClass(address user, address dom) public view returns (UserWithClass memory) {
        uint256 hash = user.hashWith(dom);
        return Users[hash];
    }




    /**
     * @notice Gets the total count of registered users.
     * @return The total count of registered users.
     */
    function ClassRegistryCount() public view returns (uint256) {      
        return UsersClassRegistry.Count();
    }

  
    /**
     * @notice Gets the details of a user by index.
     * @param i The index of the user.
     * @return The user's class details.
     */
    function GetUserByIndex(uint256 i) public view returns (UserWithClass memory) {
        uint256 hash = UsersClassRegistry.GetHashByIndex(i);       
        return Users[hash];
    }


    /**
     * @notice Sets a user's class.
     * @param user The address of the user.
     * @param dom The address of the class.
     */
    function SetUserClass(address user, address dom, bool active) internal {
            //assert(ClassValid(dom));
       
            uint256 hash = user.hashWith(dom);
           
            UsersClassRegistry.Register(hash);
            Users[hash].userAddress = user;
            Users[hash].class.classAddress = dom;   
            Users[hash].class.basisFee = IClassBase(dom).getClassBasis();  
            Users[hash].active = active;     

    }



    /**
     * @notice Sets the active status of a user's class.
     * @param user The address of the user.
     * @param dom The address of the class.
     * @param active The active status to set.
     */
    function SetUserClassActiveStatus(address user, address dom, bool active) internal {
       
            uint256 hash = user.hashWith(dom);
            if(UsersClassRegistry.Contains(hash)) {
                Users[hash].active = active;           
            }
        
    }


  
    /**
     * @notice Removes a user's class.
     * @param user The address of the user.
     * @param dom The address of the class.
     */
    function RemoveUserClass(address user, address dom) internal {
        uint256 hash = user.hashWith(dom);
        UsersClassRegistry.Remove(hash);
        delete Users[hash];
    }

    
}