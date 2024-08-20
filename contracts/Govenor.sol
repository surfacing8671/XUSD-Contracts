// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;
import "./registry.sol";
import "./atropamath.sol";
import "./ClassRegistry.sol";
import "./IVibePass.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorCountingSimple.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorStorage.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotes.sol";
import "@openzeppelin/contracts/governance/extensions/GovernorVotesQuorumFraction.sol";

contract MyGovernor   {
    using LibRegistry for LibRegistry.Registry;
    using AtropaMath for address;
    using Address for address;

    error AlreadyProposed();
    error NotAllowedAccess();

    event whitelistedClassToFeeChange(address newToClass, bool approval);
    event whitelistedClassFromFeeChange(address newFromClass, bool approval);
    event whitelistedClassContractFeeChange(
        address newContractClass,
        bool approval
    );

    // Multicall caller and target whitelist status changes
    event CallerStatusChanged(address caller, bool isWhitelisted);
    event TargetStatusChanged(address target, bool isWhitelisted);

    /// @title SickleRegistry contract
    /// @author vfat.tools
    /// @notice Manages the whitelisted contracts and the collector address

    /// ERRORS ///

    error ArrayLengthMismatch(); // 0xa24a13a6
    error FeeAboveMaxLimit(); // 0xd6cf7b5e
    error InvalidReferralCode(); // 0xe55b4629
    error NeedAVibePass(); // 0xe55b4629
    /// STORAGE ///

    /// @notice Address of the fee collector
    // address public collector;

    /// @notice Tracks the contracts that can be called through Sickle multicall
    /// @return True if the contract is a whitelisted target
    mapping(address => bool) public isWhitelistedTarget;

    /// @notice Tracks the contracts that can call Sickle multicall
    /// @return True if the contract is a whitelisted caller
    mapping(address => bool) public isWhitelistedCaller;

    /// @notice Keeps track of the referrers and their associated code
    mapping(bytes32 => address) public referralCodes;
    struct VoteUser {
        address userAddress;
        uint vote;
        bool voted;
    }

struct VoteTally {
        address classAddress;
        uint voteTotal;
        uint index;
        uint[] hashes;
        uint timestampStart;
        uint totalNft;
        string name;
        bool approved;
    }
    uint indexNum =0;
    mapping(uint => LibRegistry.Registry) internal voterRegistryMap;
    LibRegistry.Registry internal UserVoteRegistry;
    LibRegistry.Registry internal VoterTallyRegistry;


    mapping(uint => VoteTally) public VoterTallyMap;

    mapping(address => uint) public hashIndexMap;

    ClassRegistry private classReg; 
    IVibePass private vibePass;
   constructor(address _classReg, address Nft){
    classReg = ClassRegistry(_classReg);
    vibePass = IVibePass(Nft);
   }


  

    function showAllProposals() external view returns(VoteTally[] memory){
        VoteTally[] memory voters = new VoteTally[](VoterTallyRegistry.Count());
        for(uint i; i < VoterTallyRegistry.Count();){
            voters[i] = VoterTallyMap[VoterTallyRegistry.GetHashByIndex(i)];
            unchecked{
                i ++;
            }
        }
        return voters;
    }

    function vote(address classAddress) external {
        VoteTally storage Vote =  VoterTallyMap[hashIndexMap[classAddress]];
      
       uint hash = msg.sender.hashWith(classAddress);
        if(vibePass.tokenByOwner(msg.sender) == address(0)){
            revert NeedAVibePass();
        }else{
         if(!voterRegistryMap[Vote.index].Contains(hash)){
            voterRegistryMap[Vote.index].Register(hash);
         
       Vote.voteTotal += 1;

         }
        }



    }

    function checkVotes(address classAddress) external {
          VoteTally storage Vote =  VoterTallyMap[hashIndexMap[classAddress]];
          if(Vote.voteTotal > Vote.totalNft/2){
            Vote.approved = true;
            classReg.addClass(classAddress, true, 2);

          }
    }

    function propose(string memory description, address classAddress) external {
        if(vibePass.tokenByOwner(msg.sender) == address(0)){
            revert NeedAVibePass();
        }
        else{
        uint hash = msg.sender.hashWith(classAddress);
        if(!VoterTallyRegistry.Contains(hash)){
            VoterTallyRegistry.Register(hash);
            hashIndexMap[classAddress] = hash;
            VoterTallyMap[hash].index = indexNum;
            VoterTallyMap[hash].classAddress = classAddress;
           VoterTallyMap[hash].totalNft = vibePass.totalSupply();
            VoterTallyMap[hash].timestampStart = block.timestamp;
            VoterTallyMap[hash].name = description;

            indexNum ++;

        }
        }

    }
}
