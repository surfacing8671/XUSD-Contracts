// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./IVibeCalculator.sol";
import "../Access.sol";

/**
 * @title BaseClass
 * @dev This is an abstract base class contract that includes basic functionalities for user activation and class basis management.
 */
abstract contract VibeBase is IVibeCalculator {
    mapping(uint => bool) public UserActiveList;
 HierarchicalAccessControl private accessControl;
    string public description;
    enum Importance {
        Low,  // 0
        Medium, // 1
        High      // 2
    }
    struct VibeInfo {
        address creatorAddress;
        string info;
        Importance level;
    }

    VibeInfo public id;

    constructor(VibeInfo memory _id, address access) {
    accessControl = HierarchicalAccessControl(access);
        id = _id;

    }

    function setBaseImportance(Importance level) external {
    require(
            accessControl.hasRank(
                HierarchicalAccessControl.Rank.CONSUL,
                msg.sender
            ),
            "Caller does not have the required rank"
        );
        id.level = level;
    }

    function getLevel() public view returns(Importance){
        return id.level;
    }

    uint256 private locked = 1;

    modifier nonReentrant() virtual {
        require(locked == 1, "REENTRANCY");

        locked = 2;

        _;

        locked = 1;
    }

    function getDescription() external view returns (string memory) {
        return description;
    }

    function calculateTotalBasisFee(
        address addy,
        uint amount
    ) external virtual nonReentrant returns (int) {}
}
