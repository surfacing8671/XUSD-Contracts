// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "./VibeRegistry.sol";
import "./IVibePass.sol";
import "./Classes/VibeBase.sol";
import "./AddressReg.sol";

import "@openzeppelin/contracts/utils/ReentrancyGuard.sol";
import "./IAccessManager.sol";
contract MyGovernor is ReentrancyGuard {

    using LibRegistryAdd for LibRegistryAdd.Registry;
    using Address for address;

    // Custom errors for specific conditions
    error AlreadyProposed();
    error NotAllowedAccess();
    error AlreadyPassed();
     error AlreadyVoted(address user, address class);
    error NeedAVibePass();
    error InvalidDenominator();
 error classAddressNotMatch();
    // Events
    event VoteProposed(address indexed classAddress, string name, string description, uint classType, bool process, bool rewards);
    event VoteCast(address indexed voter, address indexed classAddress, uint voteTotal);
    event VoteChecked(address indexed classAddress, bool approved, uint totalVotes);
    event VoteDenominatorUpdated(uint oldDenominator, uint newDenominator);
    event ProposalFailed(address indexed classAddress, string reason);

    struct VoteProposal {
        address classAddress;
        string description;
        string name;
        bool process;
        bool rewards;
        uint classType;

    }

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

IAccessManager public accessControl;
    uint public denominator = 2;

    LibRegistryAdd.Registry internal VoterTallyRegistry;
    mapping(uint => mapping(address => bool)) private voterRegistryMap;
    mapping(address => VoteTally) public VoterTallyMap;

    IVibePass private vibePass;
    VibeRegistry private classReg;

 
    /**
     * @dev Restricts access to GLADIATOR role or higher.
     */
      modifier onlyGladiator() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.GLADIATOR), "Access Restricted");
        _;
    }

    modifier onlySenator() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.SENATOR), "Access Restricted");
        _;
    }

    modifier onlyConsul() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.CONSUL),"Access Restricted");
        _;
    }

    modifier onlyLegatus() {
        require(accessControl.checkRole(msg.sender,  IAccessManager.Rank.LEGATUS),'Access Restricted');
        _;
    }


    constructor(address _access, address Nft, address _classReg)  {
        accessControl =  IAccessManager(_access);
        vibePass = IVibePass(Nft);
        classReg = VibeRegistry(_classReg);
 
    }


    function updateVoteDen(uint _denominator) external onlySenator{
        // Set a lower limit to avoid malicious or erroneous changes
        if (_denominator < 1 || _denominator > 10) {
            revert InvalidDenominator();
        }
       

        emit VoteDenominatorUpdated(denominator, _denominator);
        denominator = _denominator;
    }
 function updateNft(address _Nft) external onlySenator{
        // Set a lower limit to avoid malicious or erroneous changes
      
    

        vibePass = IVibePass(_Nft);
    }

function viewNumberOfProposals() external view returns (uint){
    return VoterTallyRegistry.Count();
}

    function showAllProposals(uint limit, uint offset) external view returns (VoteTally[] memory) {
        uint tallyCount = VoterTallyRegistry.Count();
        uint activeCount;

        for (uint i = offset; i < tallyCount && activeCount < limit; ) {
            if (!VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)].approved) {
                activeCount++;
            }
            unchecked {
                i++;
            }
        }

        VoteTally[] memory voters = new VoteTally[](activeCount);
        uint index = 0;

        for (uint i = offset; i < tallyCount && index < limit; ) {
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

    function showActiveVibes(uint limit, uint offset) external view returns (VoteTally[] memory) {
        uint tallyCount = VoterTallyRegistry.Count();
        uint approvedCount;

        for (uint i = offset; i < tallyCount && approvedCount < limit; ) {
            if (VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)].approved) {
                approvedCount++;
            }
            unchecked {
                i++;
            }
        }

        VoteTally[] memory voters = new VoteTally[](approvedCount);
        uint index = 0;

        for (uint i = offset; i < tallyCount && index < limit; ) {
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

    function vote(address classAddress) external nonReentrant {
        VoteTally storage Vote = VoterTallyMap[classAddress];

        if (vibePass.tokenIdByOwner(msg.sender) == 0) {
            revert NeedAVibePass();
        }

        if (!voterRegistryMap[Vote.index][msg.sender]) {
            voterRegistryMap[Vote.index][msg.sender] = true;

            if (accessControl.checkRole(msg.sender, IAccessManager.Rank.GLADIATOR)) {
                Vote.voteTotal += 1;
            }
            if (accessControl.checkRole( msg.sender, IAccessManager.Rank.LEGATUS)) {
                Vote.voteTotal += 1;
            }
            if (accessControl.checkRole( msg.sender, IAccessManager.Rank.SENATOR)) {
                Vote.voteTotal += 1;
            }
            if (accessControl.checkRole( msg.sender, IAccessManager.Rank.PREATORMAXIMUS)) {
                Vote.voteTotal += 1;
            }

            emit VoteCast(msg.sender, classAddress, Vote.voteTotal);
        }
        else{
            revert AlreadyVoted(msg.sender, classAddress);

        }
    }

    function checkVotes(address classAddress) external nonReentrant onlySenator {
       
        VoteTally storage Vote = VoterTallyMap[classAddress];

        if (!Vote.approved) {
            if (Vote.voteTotal > Vote.totalNft / denominator) {
                if (Vote.rewards) {
                    classReg.addClass(classAddress,  4, Vote.process);
                } else {
                    classReg.addClass(classAddress,  Vote.classType, Vote.process);
                }
                Vote.approved = true;
                emit VoteChecked(classAddress, true, Vote.voteTotal);
            } else {
                revert AlreadyPassed();
            }
        } else {
            revert AlreadyPassed();
        }
    }

    function propose(VoteProposal memory proposal, address classAddress) external nonReentrant {
        if (vibePass.tokenIdByOwner(msg.sender) == 0) {
            emit ProposalFailed(classAddress, "VibePass required");
            revert NeedAVibePass();
        }
        if(proposal.classAddress != classAddress) revert classAddressNotMatch();

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
      

            emit VoteProposed(classAddress, proposal.name, proposal.description, proposal.classType, proposal.process, proposal.rewards);
        } else {
            emit ProposalFailed(classAddress, "Already proposed");
            revert AlreadyProposed();
        }
    }
}
