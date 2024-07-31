// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.24;

import "hardhat/console.sol";
import "./Ownable.sol";
import "./Address.sol";
import "./registry.sol";
import "./IClassBase.sol";
import "./UserClassRegistry.sol";
import "./atropamath.sol";
import "./ClassRegistry.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC20/ERC20Upgradeable.sol";

/**
 * @title TUSDRegistry
 * @dev This contract manages fee structures for different classes and their functions,
 * allowing for user and class registration, as well as fee retrieval and updates.
 */
contract TUSDRegistry is UserClassRegistry, ClassRegistry {
    using Address for address;
    using AtropaMath for address;
    using LibRegistry for LibRegistry.Registry;

    /// @notice Address used for burning
    address public immutable burn = 0x0000000000000000000000000000000000000369;

    error ArrayLengthMismatch(); // 0xa24a13a6
    error FeeAboveMaxLimit(); // 0xd6cf7b5e

    event ClassFeeRegistered(bytes32 indexed feeId, address indexed classContract, bytes4 indexed functionSig, int256 fee);
    event TotalFee(int256 fee);

    mapping(uint256 => Class) public classes;
    mapping(uint256 => bool) public userList;

    struct UsersClass {
        address[] ClassAddress;
    }

    uint256 public immutable userIndex = 0;
    address public XUSD;

    mapping(uint256 => UsersClass) internal UsersClassList;
    mapping(uint256 => bool) internal ClassUserActive;
    mapping(uint256 => UsersClass) internal UsersActiveClassList;
    mapping(bytes4 => bool) feeRegistry;

    constructor() {
        Ownable(msg.sender);
    }

    /**
     * @notice Adds a new class contract address to the registry.
     * @param class The address of the class contract.
     */
    function addClass(address class) external onlyOwner {
        SetClass(class);
    }



    /**
     * @notice Gets the classes associated with a user.
     * @param user The address of the user.
     * @return An array of class addresses.
     */
    function getUserClasses(address user) external view returns (address[] memory) {
        uint hash = address(this).hashWith(user);
        return UsersClassList[hash].ClassAddress;
    }

    /**
     * @notice Processes a transaction and calculates the total basis fee.
     * @param caller The address of the caller.
     * @param to The recipient address.
     * @param from The sender address.
     * @param selector The function selector.
     * @param sender The sender address.
     * @return The total basis fee or a default fee if no fee is applicable.
     */
    function processTransaction(address caller, address to, address from, bytes4 selector, address sender, uint amount) external returns (int) {
        console.logAddress(sender);
        console.logBytes4(selector);
        console.logBytes(msg.data);

        int totalBasisFee = 0;
        // if(feeRegistry[selector]) {
            uint hash = address(this).hashWith(caller);
            if(!userList[hash]) {
                _addUser(caller);
            }

            for (uint256 i = 0; i < ClassRegistryCount(); i++) {
                console.log(GetClassByIndex(i).classAddress);
                uint hashU = caller.hashWith(GetClassByIndex(i).classAddress);
                
                    console.log(caller);            
                bool add = IClassBase(GetClassByIndex(i).classAddress).getActiveAdd(caller, to, from, sender, selector, amount);
                bool sub = IClassBase(GetClassByIndex(i).classAddress).getActiveSub(caller, to, from, sender, selector, amount);
                if(add) {
                    console.log(add);   
 
                
                    Users[hashU].active = true;
                    console.logInt(totalBasisFee);
                }
                if(sub) {
                    console.log(sub); 
     
                    Users[hashU].active = false;
                
                              
                }

               

            

                
                    console.log(Users[hashU].active);
                    if(Users[hashU].active){
                    totalBasisFee += IClassBase(GetClassByIndex(i).classAddress).getClassBasis();
                    }

                
            }
           
            if(totalBasisFee >= 10000) {
                return 9999;
            }
            if(totalBasisFee <= 0) {
                return 250;
            }
            return totalBasisFee;
       // }
       // return 5000;
    }

    /**
     * @notice Checks if a given signed integer is negative.
     * @param value The signed integer to check.
     * @return True if the value is negative, false otherwise.
     */
    function isNegative(int256 value) internal pure returns (bool) {
        return value < 0;
    }

  
   


    /**
     * @notice Internal function to add a new user.
     * @param user The address of the user.
     */
    function _addUser(address user) internal { 
       
        SetUserClass(user, GetClassByIndex(0).classAddress, true);

    }

    function addUser(address user) external onlyOwner { 
        _addUser(user);
       

    }

    /**
     * @notice Converts a function signature string to its bytes4 selector.
     * @param functionName The function signature in string format.
     * @return The function selector as bytes4.
     */
    function selectFromSigInternal(string calldata functionName) internal pure returns (bytes4) {
        return bytes4(keccak256(abi.encodePacked(functionName)));
    }

    /**
     * @notice Public function to convert a function signature string to its bytes4 selector.
     * @param functionName The function signature in string format.
     * @return The function selector as bytes4.
     */
    function returnFunctionSelectorFromSignature(string calldata functionName) public pure returns (bytes4) {
        return bytes4(keccak256(abi.encodePacked(functionName)));
    }
}
