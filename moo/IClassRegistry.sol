// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/**
 * @title IClassRegistry
 * @dev Interface for managing user classes and their active statuses.
 */
interface IClassRegistry {
    struct ProposedClass {
        address classAddress; 
        uint votes;
    }

    struct Class {     
        address classAddress;  
        int256 basisFee;
        uint votes;
        bool proposed;
    }

    /**
     * @notice Adds a class to the registry.
     * @param _class The address of the class.
     */
    function addClass(address _class) external;
    function SetClassNow(address dom, uint hash) external;
    /**
     * @notice Sets the minimum burn balance.
     * @param amount The new minimum burn balance.
     */
    function setMinBurnBalance(uint256 amount) external;

    /**
     * @notice Checks if a given class is valid.
     * @param dom The address of the class.
     * @return True if the class is valid, false otherwise.
     */
    function ClassValid(address dom) external view returns (bool);

    /**
     * @notice Checks if a given class is proposed and valid.
     * @param dom The address of the class.
     * @return True if the class is proposed and valid, false otherwise.
     */
    function ClassProposedValid(address dom) external view returns (bool);

    /**
     * @notice Registers a class.
     * @param dom The address of the class.
     */
    function RegisterClass(address dom, uint hash) external;

    /**
     * @notice Retrieves class details for a given address.
     * @param dom The address of the class.
     * @return The class details.
     */
    function getClass(address dom) external view returns (Class memory);

    /**
     * @notice Retrieves proposed class details for a given address.
     * @param dom The address of the class.
     * @return The proposed class details.
     */
    function getProposed(uint dom) external view returns (ProposedClass memory);

    /**
     * @notice Gets the total count of registered classes.
     * @return The total count of registered classes.
     */
    function ClassRegistryCount() external view returns (uint256);

    /**
     * @notice Gets the total count of proposed classes.
     * @return The total count of proposed classes.
     */
    function proposedCount() external view returns (uint256);

    /**
     * @notice Gets the details of a class by index.
     * @param i The index of the class.
     * @return The class details.
     */
    function GetClassByIndex(uint256 i) external view returns (Class memory);

    /**
     * @notice Proposes a class.
     * @param dom The address of the class.
     */
    function ProposeClass(address dom) external;

    /**
     * @notice Votes for a class.
     * @param dom The address of the class.
     */
    function VoteClass(address dom) external;

    /**
     * @notice Removes a class from the registry.
     * @param dom The address of the class.
     */
    function RemoveClass(address dom) external;
}