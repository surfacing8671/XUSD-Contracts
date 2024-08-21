// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "./ClassRegistry.sol";
import "./IVibePass.sol";
import "./AddressReg.sol";
import "./Access.sol";

contract MyGovernor {
    using LibRegistryAdd for LibRegistryAdd.Registry;
    using Address for address;

    // Custom errors for specific conditions
    error AlreadyProposed();
    error NotAllowedAccess();
    error AlreadyPassed();
    error NeedAVibePass();

    /// @notice Struct representing a vote proposal
    /// @param classAddress The address associated with the class
    /// @param description The description of the proposal
    /// @param name The name of the proposal
    /// @param process A boolean indicating if the process is ongoing
    /// @param rewards A boolean indicating if rewards are associated with the proposal
    /// @param classType The type of the class in the proposal
    struct VoteProposal {
        address classAddress;
        string description;
        string name;
        bool process;
        bool rewards;
        uint classType;
    }

    /// @notice Struct representing a tally of votes
    /// @param classAddress The address associated with the class
    /// @param voteTotal The total number of votes
    /// @param index The index of the vote tally in the registry
    /// @param hashes Array of hashes associated with the votes
    /// @param timestampStart The start timestamp of the voting
    /// @param totalNft The total number of NFTs involved in the vote
    /// @param name The name of the vote tally
    /// @param description The description of the vote tally
    /// @param approved A boolean indicating if the proposal has been approved
    /// @param rewards A boolean indicating if rewards are associated with the vote
    /// @param process A boolean indicating if the process is ongoing
    /// @param classType The type of the class in the vote tally
    struct VoteTally {
        address classAddress;
        uint voteTotal;
        uint index;
        uint[] hashes;
        uint timestampStart;
        uint totalNft;
        string name;
        string description;
        bool approved;
        bool rewards;
        bool process;
        uint classType;
    }

    uint public denominator = 2;

    /// @notice Registry of all vote tallies
    LibRegistryAdd.Registry internal VoterTallyRegistry;

    /// @notice Mapping of voters by vote index and user address to prevent double voting
    mapping(uint => mapping(address => bool)) private voterRegistryMap;

    /// @notice Mapping of vote tallies by class address
    mapping(address => VoteTally) public VoterTallyMap;

    HierarchicalAccessControl private access;
    IVibePass private vibePass;
    ClassRegistry private classReg;

    /// @notice Constructor to initialize the MyGovernor contract
    /// @param _access The address of the HierarchicalAccessControl contract
    /// @param Nft The address of the IVibePass contract
    /// @param _classReg The address of the ClassRegistry contract
    constructor(address _access, address Nft, address _classReg) {
        access = HierarchicalAccessControl(_access);
        vibePass = IVibePass(Nft);
        classReg = ClassRegistry(_classReg);
    }

    function updateVoteDen(uint _denominator) external {
        assert( access.hasRank(HierarchicalAccessControl.Rank.SENATOR, msg.sender));
        denominator = _denominator;
    }

    /// @notice Retrieves all active vote proposals
    /// @return voters An array of VoteTally structs representing all active vote proposals
    function showAllProposals() external view returns (VoteTally[] memory) {
        uint tallyCount = VoterTallyRegistry.Count();
        uint activeCount;
        for (uint i; i < tallyCount; ) {
            if (!VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)].approved) {
                activeCount++;
            }
            unchecked {
                i++;
            }
        }



        VoteTally[] memory voters = new VoteTally[](activeCount);
        uint index = 0;
        for (uint i; i < tallyCount; ) {
            if (!VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)].approved) {
                voters[index] = VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)];
                index++;
            }
            unchecked {
                i++;
            }
        }
        return voters;
    }

    /// @notice Retrieves all approved vote proposals (active vibes)
    /// @return voters An array of VoteTally structs representing all approved vote proposals
    function showActiveVibes() external view returns (VoteTally[] memory) {
        uint tallyCount = VoterTallyRegistry.Count();
        uint approvedCount;
        for (uint i; i < tallyCount; ) {
            if (VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)].approved) {
                approvedCount++;
            }
            unchecked {
                i++;
            }
        }

        VoteTally[] memory voters = new VoteTally[](approvedCount);
        uint index = 0;
        for (uint i; i < tallyCount; ) {
            if (VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)].approved) {
                voters[index] = VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)];
                index++;
            }
            unchecked {
                i++;
            }
        }
        return voters;
    }

    /// @notice Cast a vote for a specific class address
    /// @param classAddress The address of the class being voted on
    function vote(address classAddress) external {
        VoteTally storage Vote = VoterTallyMap[classAddress];

        if (vibePass.tokenIdByOwner(msg.sender) == 0) {
            revert NeedAVibePass();
        }
        else{
        
        if (!voterRegistryMap[Vote.index][msg.sender]) {

            voterRegistryMap[Vote.index][msg.sender] = true;

            // Increment voteTotal based on the rank of the voter
            if (access.hasRank(HierarchicalAccessControl.Rank.GLADIATOR, msg.sender)) {
                Vote.voteTotal += 1;
            }
            if (access.hasRank(HierarchicalAccessControl.Rank.LEGATUS, msg.sender)) {
                Vote.voteTotal += 1;
            }
            if (access.hasRank(HierarchicalAccessControl.Rank.SENATOR, msg.sender)) {
                Vote.voteTotal += 1;
            }
            if (access.hasRank(HierarchicalAccessControl.Rank.PREATORMAXIMUS, msg.sender)) {
                Vote.voteTotal += 1;
            }
        }
        }
    }

    /// @notice Check the votes for a specific class address and finalize the proposal if the vote passes
    /// @param classAddress The address of the class being voted on
    function checkVotes(address classAddress) external {
        VoteTally storage Vote = VoterTallyMap[classAddress];
        console.logUint(Vote.voteTotal);

        if (!Vote.approved) {
            if (Vote.voteTotal > Vote.totalNft / denominator) {
                console.logBool(Vote.rewards);
                if (Vote.rewards) {
                    classReg.addClass(classAddress, true, 3, Vote.process);
                } else {
                    classReg.addClass(classAddress, true, Vote.classType, Vote.process);
                }
                Vote.approved = true;
            }
        } else {
            revert AlreadyPassed();
        }
    }

    /// @notice Propose a new vote for a specific class address
    /// @param proposal The VoteProposal struct containing the proposal details
    /// @param classAddress The address of the class being proposed
    function propose(VoteProposal memory proposal, address classAddress) external {
        if (vibePass.tokenIdByOwner(msg.sender) == 0) {
            revert NeedAVibePass();
        }
        
        if (!VoterTallyRegistry.Contains(classAddress)) {
            VoterTallyRegistry.Register(classAddress);

            VoteTally storage newVote = VoterTallyMap[classAddress];
            newVote.index = VoterTallyRegistry.Count();
            newVote.classAddress = classAddress;
            newVote.totalNft = vibePass.totalSupply();
            newVote.timestampStart = block.timestamp;
            newVote.name = proposal.name;
            newVote.process = proposal.process;
            newVote.description = proposal.description;
            newVote.classType = proposal.classType;
            newVote.rewards = proposal.rewards;
        }
        else revert AlreadyProposed();
    }
}
