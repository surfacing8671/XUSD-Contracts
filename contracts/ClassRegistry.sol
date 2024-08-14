pragma solidity ^0.8.26;

import "./Address.sol";
import "hardhat/console.sol";
import "./AccessRegistry.sol";
import "./TUSDRegistry.sol";
import ".//Classes/IClassBase.sol";
import "./registry.sol";

import "./Classes/ITaxCalculator.sol";

/**
 * @title ClassRegistry
 * @dev This contract is to store the Whitlisted Tax Classes, 3 different types, and the logic to call them and determine the ussers basis points
 */

contract ClassRegistry is AccessRegistry {
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

    LibRegistry.Registry internal MasterClassRegistry;
    LibRegistry.Registry internal MasterClassFromRegistry;
    LibRegistry.Registry internal MasterClassToRegistry;
    LibRegistry.Registry internal MasterClassCallerRegistry;
    LibRegistry.Registry internal MasterClassContractRegistry;
    mapping(uint => MaterClass) public MasteClassMap;
    mapping(uint => MaterClass) public MasterClassFromMap;
    mapping(uint => MaterClass) public MasterClassToMap;
    mapping(uint => MaterClass) public MasterClassCallerMap;
    mapping(uint => MaterClass) public MasterClassContractMap;

    struct MaterClass {
        address classAddress;
        uint updatedTimestamp;
        bool active;
    }

    mapping(uint => usersVibe) toVibe;
    mapping(uint => usersVibe) fromVibe;
    mapping(uint => usersVibe) callerVibe;
    mapping(uint => usersVibe) contractVibe;

    struct userProfile {
        address userAddress;
        int vibes;
        LibRegistry.Registry userClassRepo;
    }

    struct usersVibe {
        address userAddress;
        int vibes;
        uint timestamp;
        bool enter;
    }
    LibRegistry.Registry internal UserProfileRepo;

    mapping(uint => userProfile) usersVibesFile;
    int vibes = 0;
    address[] toArray;
    address[] fromArray;
    address[] caller;

    constructor() Ownable(msg.sender) {}

    // export function addthem(address j) external {

    //          toArray.push(m);

    // }

    // export function addthem(address j) external {

    //          toArray.push(m);

    // }

    // export function addthem(address j) external {

    //          toArray.push(m);

    // }

    function addClass(address class, bool active, uint classType) external {
        assert(HasAccess(msg.sender, AccessType.CONGRESS, address(this)));
        uint hash = address(this).hashWith(class);
        if (classType == 0) {
            console.log("aded to");
            if (!MasterClassToRegistry.Contains(hash))
                MasterClassToRegistry.Register(hash);
            MasterClassToMap[hash] = MaterClass({
                classAddress: class,
                updatedTimestamp: block.timestamp,
                active: active
            });
        }
        if (classType == 1) {
            console.log("aded from");

            if (!MasterClassFromRegistry.Contains(hash)) {
                MasterClassFromRegistry.Register(hash);
                MasterClassFromMap[hash] = MaterClass({
                    classAddress: class,
                    updatedTimestamp: block.timestamp,
                    active: active
                });
            }
        }
        if (classType == 2) {
            console.log("aded caller");
            if (!MasterClassCallerRegistry.Contains(hash)) {
                MasterClassCallerRegistry.Register(hash);
                MasterClassCallerMap[hash] = MaterClass({
                    classAddress: class,
                    updatedTimestamp: block.timestamp,
                    active: active
                });
            }
        }
        if (classType == 3) {
            if (!MasterClassContractRegistry.Contains(hash)) {
                MasterClassContractRegistry.Register(hash);
                MasterClassContractMap[hash] = MaterClass({
                    classAddress: class,
                    updatedTimestamp: block.timestamp,
                    active: active
                });
            }
        }
    }

    function addProfile(address user) internal {
        uint hash = address(this).hashWith(user);
        UserProfileRepo.Register(hash);
        usersVibesFile[hash].userAddress = user;
    }

    function calculateAndSumBasis(
        address to,
        address from,
        address _caller,
        uint amount
    ) external returns (int) {
        uint hashTo = address(this).hashWith(to);
        uint hashFrom = address(this).hashWith(from);
        uint hashCaller = address(this).hashWith(_caller);
        if (!UserProfileRepo.Contains(hashTo)) addProfile(to);
        if (!UserProfileRepo.Contains(hashFrom)) addProfile(from);
        if (!UserProfileRepo.Contains(hashCaller)) addProfile(_caller);

        userProfile storage toUser = usersVibesFile[hashTo];
        userProfile storage fromUser = usersVibesFile[hashFrom];
        userProfile storage callerUser = usersVibesFile[hashCaller];
        console.logAddress(toUser.userAddress);
        console.logAddress(fromUser.userAddress);
        console.logAddress(callerUser.userAddress);
        int sumVibes = 0;
        console.log(MasterClassToRegistry.Count());
        for (uint i; i < MasterClassToRegistry.Count(); ) {
            MaterClass memory vibeClassTo = MasterClassToMap[
                MasterClassToRegistry.GetHashByIndex(i)
            ];

            uint hashT = vibeClassTo.classAddress.hashWith(toUser.userAddress);

            if (toUser.userClassRepo.Contains(hashT)) {
                if (toVibe[hashT].timestamp < vibeClassTo.updatedTimestamp) {
                    console.log("here");
                    toVibe[hashT].vibes = ITaxCalculator(
                        vibeClassTo.classAddress
                    ).calculateTotalBasisFee(toUser.userAddress, amount);
                    toUser.vibes += toVibe[hashT].vibes;
                    sumVibes += toVibe[hashT].vibes;
                    toVibe[hashT].timestamp = block.timestamp;
                }
                else{
                sumVibes += toVibe[hashT].vibes;
                }
            } else {
                console.log("here else");
                toUser.userClassRepo.Register(hashT);
                toVibe[hashT].vibes = ITaxCalculator(vibeClassTo.classAddress)
                    .calculateTotalBasisFee(toUser.userAddress, amount);
                toUser.vibes += toVibe[hashT].vibes;
                sumVibes += toVibe[hashT].vibes;
                toVibe[hashT].timestamp = block.timestamp;
            }

            unchecked {
                i++;
            }
        }
        console.log(MasterClassFromRegistry.Count());
        for (uint i; i < MasterClassFromRegistry.Count(); ) {
            console.log("here from");
            console.log(MasterClassFromRegistry.GetHashByIndex(i));

            uint hashF = MasterClassFromMap[
                MasterClassFromRegistry.GetHashByIndex(i)
            ].classAddress.hashWith(fromUser.userAddress);
            console.logAddress(
                MasterClassFromMap[MasterClassFromRegistry.GetHashByIndex(i)]
                    .classAddress
            );
            if (fromUser.userClassRepo.Contains(hashF)) {
                if (
                    fromVibe[hashF].timestamp <
                    MasterClassFromMap[
                        MasterClassFromRegistry.GetHashByIndex(i)
                    ].updatedTimestamp
                ) {
                    fromVibe[hashF].vibes = ITaxCalculator(
                        MasterClassFromMap[
                            MasterClassFromRegistry.GetHashByIndex(i)
                        ].classAddress
                    ).calculateTotalBasisFee(fromUser.userAddress, amount);
                    fromUser.vibes += fromVibe[hashF].vibes;
                    sumVibes += fromVibe[hashF].vibes;
                    fromVibe[hashF].timestamp = block.timestamp;
                }
                else{
                sumVibes += fromVibe[hashF].vibes;
                }
            } else {
                fromUser.userClassRepo.Register(hashF);
                fromVibe[hashF].vibes = ITaxCalculator(
                    MasterClassFromMap[
                        MasterClassFromRegistry.GetHashByIndex(i)
                    ].classAddress
                ).calculateTotalBasisFee(fromUser.userAddress, amount);
                fromUser.vibes += fromVibe[hashF].vibes;
                sumVibes += fromVibe[hashF].vibes;
                fromVibe[hashF].timestamp = block.timestamp;
            }

            unchecked {
                i++;
            }
        }
        console.log(MasterClassCallerRegistry.Count());
        for (uint i; i < MasterClassCallerRegistry.Count(); ) {
            console.log("here cass");
            uint hashC = MasterClassCallerMap[
                MasterClassCallerRegistry.GetHashByIndex(i)
            ].classAddress.hashWith(callerUser.userAddress);
            if (callerUser.userClassRepo.Contains(hashC)) {
                if (
                    callerVibe[hashC].timestamp <
                    MasterClassCallerMap[
                        MasterClassCallerRegistry.GetHashByIndex(i)
                    ].updatedTimestamp
                ) {
                    callerVibe[hashC].vibes = ITaxCalculator(
                        MasterClassCallerMap[
                            MasterClassCallerRegistry.GetHashByIndex(i)
                        ].classAddress
                    ).calculateTotalBasisFee(callerUser.userAddress, amount);
                    callerUser.vibes += callerVibe[hashC].vibes;
                    sumVibes += callerVibe[hashC].vibes;
                    callerVibe[hashC].timestamp = block.timestamp;
                }
                else{
                sumVibes += callerVibe[hashC].vibes;
                }
                // callerUser.vibes += callerVibe[hashT].vibes;
            } else {
                callerUser.userClassRepo.Register(hashC);
                callerVibe[hashC].vibes = ITaxCalculator(
                    MasterClassCallerMap[
                        MasterClassCallerRegistry.GetHashByIndex(i)
                    ].classAddress
                ).calculateTotalBasisFee(callerUser.userAddress, amount);
                callerUser.vibes += callerVibe[hashC].vibes;
                sumVibes += callerVibe[hashC].vibes;
                callerVibe[hashC].timestamp = block.timestamp;
            }

            unchecked {
                i++;
            }
        }
        //

        console.logInt(callerUser.vibes);
        console.logInt(fromUser.vibes);
        console.logInt(toUser.vibes);
        console.logInt(sumVibes);

        return sumVibes;
    }
}
