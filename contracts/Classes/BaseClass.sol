// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "../Ownable.sol";


/**
 * @title BaseClass
 * @dev This is an abstract base class contract that includes basic functionalities for user activation and class basis management.
 */
abstract contract BaseClass is Ownable {
 
    mapping(uint => bool) public UserActiveList;

    address public classRegistry;
    int256 public classBasis;
    // 0 = contract 1 = user
    uint public classType;

    /**
     * @dev Sets the initial class basis.
     * @param _classBasis The initial basis fee for the class.
     */
    constructor(int _classBasis, uint _classType) {
        classBasis = _classBasis;
        classType = _classType;
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
    function getClassBasis() public view returns (int256) {
        return classBasis;
    }

    /**
     * @notice Sets the active status of a user.
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
    ) external virtual onlyRegistry returns (bool) {return false;}
    function getActiveSub(
        address user,
        address to,
        address from,
        address sender,
        bytes4 sig,
        uint amount
    ) external virtual onlyRegistry returns (bool) {return false;}
}
