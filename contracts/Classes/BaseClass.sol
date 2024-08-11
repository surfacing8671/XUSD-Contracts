// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../Ownable.sol";
import "./IClassBase.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";


/**
 * @title BaseClass
 * @dev This is an abstract base class contract that includes basic functionalities for user activation and class basis management.
 */
abstract contract BaseClass is Ownable, ERC165, IClassBase {
 
    mapping(uint => bool) public UserActiveList;

    address public classRegistry;
    int256 public classBasis;
    // 0 = contract 1 = user
    uint public classType;
    string public note;

    struct UserChoice {
        bool activate;
        bool deactivate;
    }
    /**
     * @dev Sets the initial class basis.
     * @param _classBasis The initial basis fee for the class.
     */
    constructor(address registry, int _classBasis, string memory _note)  {
        classBasis = _classBasis;      
        note = _note; 
        classRegistry = registry;    
    }

    /**
     * @dev Modifier to restrict functions to be callable only by the class registry.
     */
    modifier onlyRegistry() {
        require(msg.sender == classRegistry, "Only registry can call");
        _;
    }


    function getClassType()external view returns (uint){
        return classType;
    }

    function getNote()external view returns (string memory){
        return note;
    }

    /**
     * @notice Updates the class registry address.
     * @param registry The new class registry address.
     */
    function updateClassRegistry(address registry) external onlyOwner {
        classRegistry = registry;
    }

    /**
     * @notice Gets the class basis fee.
     * @return The class basis fee.
     */




    // function triggerTo(address to, uint amount, address caller) internal virtual {
        

    // }

    // function triggerFrom(address from, uint amount, address caller) internal virtual {


    // }

    // function triggerCaller(address caller, uint amount, address _caller) internal virtual {


    // }
}
