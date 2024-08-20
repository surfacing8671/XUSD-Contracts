// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
import "./registry.sol";
import "./atropamath.sol";
contract HierarchicalAccessControl {
    // Define ranks
    using LibRegistry for LibRegistry.Registry;
    using AtropaMath for address;
    enum Rank {
        PREATORMAXIMUS,
        CONSUL,
        SENATOR,
        LEGATUS,
        GLADIATOR,
        PRINCEPS
        
    }

    // Mapping to store the rank of each contract address
    LibRegistry.Registry private Registry;
    mapping(address => Rank) internal Ranks;

    // Events
    event RankAssigned(address indexed account, Rank rank);

    // Constructor to assign the deployer the highest rank
    constructor() {
        _assignRank(msg.sender, Rank.PREATORMAXIMUS);
    }

    // Modifier to check for rank access
    modifier onlyRank(Rank requiredRank) {
        require(hasRank(requiredRank, msg.sender), "Access denied: insufficient rank");
        _;
    }

    // Function to check if a contract has the required rank or higher
    function hasRank(Rank requiredRank, address account) public view returns (bool) {
   
        return Ranks[account] <= requiredRank;
    }

    // Function to assign a rank to a contract
    function assignRank(address account, Rank rank) public onlyRank(Rank.SENATOR) {
        _assignRank(account, rank);
    }

    // Internal function to assign a rank
    function _assignRank(address account, Rank rank) internal {
        Ranks[account] = rank;
        emit RankAssigned(account, rank);
    }

    function getRank(address account) public view returns (Rank) {
    return Ranks[account];
}

function revokeRank(address account) public onlyRank(Rank.SENATOR) {

    delete Ranks[account];
    emit RankAssigned(account, Rank(uint8(0))); // Log with no rank
}

function upgradeRank(address account) public onlyRank(Rank.SENATOR) {
    require(Ranks[account] < Rank.PREATORMAXIMUS, "Already at highest rank");
    Ranks[account] = Rank(uint(Ranks[account]) + 1);
    emit RankAssigned(account, Ranks[account]);
}

function downgradeRank(address account) public onlyRank(Rank.SENATOR) {
    require(Ranks[account] > Rank.PRINCEPS, "Already at lowest rank");
    Ranks[account] = Rank(uint(Ranks[account]) - 1);
    emit RankAssigned(account, Ranks[account]);
}

   
}