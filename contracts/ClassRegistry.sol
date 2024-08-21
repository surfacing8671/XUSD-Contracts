// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./Address.sol";
import "hardhat/console.sol";
import "./Access.sol";
import "./Classes/IClassBase.sol";
import "./AddressReg.sol";
import "./XUSD.sol";
import "./Classes/VibeBase.sol";

/**
 * @title ClassRegistry
 * @dev Manages whitelisted tax classes, processes user basis points, and handles whitelisting logic.
 */
contract ClassRegistry {
    using LibRegistry for LibRegistry.Registry;
    using LibRegistryAdd for LibRegistryAdd.Registry;
    using AtropaMath for address;
    using Address for address;

    // Custom Errors
    error AlreadyProposed();
    error NotAllowedAccess();
    error ArrayLengthMismatch(); 
    error FeeAboveMaxLimit(); 
    error InvalidReferralCode();

    // Events for state changes in the registry
    event WhitelistedClassToFeeChange(address indexed newToClass, bool approval);
    event WhitelistedClassFromFeeChange(address indexed newFromClass, bool approval);
    event WhitelistedClassContractFeeChange(address indexed newContractClass, bool approval);
    event CallerStatusChanged(address indexed caller, bool isWhitelisted);
    event TargetStatusChanged(address indexed target, bool isWhitelisted);

    // Data structures for class and reward management
    struct MaterClass {
        address classAddress;
        uint updatedTimestamp;
        bool active;
        bool process;
        string description;
    }

    struct RewardClass {
        address classAddress;
        bool active;
        bool process;
        string description;
    }

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

    // State variables
    uint public RewardBalance;
    XUSD public xusd;
    uint private rewardDayIndex;
    uint private lastUpdateTime;

    LibRegistryAdd.Registry internal MasterAddressReg;
    LibRegistry.Registry internal MasterClassRegistry;
    LibRegistryAdd.Registry internal MasterClassFromRegistry;
    LibRegistryAdd.Registry internal MasterClassToRegistry;
    LibRegistryAdd.Registry internal MasterClassCallerRegistry;
    LibRegistryAdd.Registry internal MasterClassContractRegistry;
    LibRegistryAdd.Registry internal UserProfileRepo;

    mapping(address => MaterClass) public MasterClassMap;
    mapping(address => MaterClass) public MasterClassFromMap;
    mapping(address => MaterClass) public MasterClassToMap;
    mapping(address => MaterClass) public MasterClassCallerMap;
    mapping(address => RewardClass) public MasterClassContractMap;

    mapping(uint => mapping(address => uint)) public DailyRewards;
    mapping(address => uint) public userRewards;
    mapping(address => bool) public vibeFree;
    mapping(address => bool) public Rewards;
    mapping(uint => usersVibe) public toVibe;
    mapping(uint => usersVibe) public fromVibe;
    mapping(uint => usersVibe) public callerVibe;
    mapping(uint => usersVibe) public contractVibe;
    mapping(address => userProfile) internal usersVibesFile;

    int public vibes;

    address[] public toArray;
    address[] public fromArray;
    address[] public caller;

    HierarchicalAccessControl private access;

    uint256 public constant MAX_AMOUNT = 1000 * 1e18;

    /// @notice Constructor initializes the contract with required addresses
    /// @param _access Address of the access control contract
    /// @param _xusd Address of the XUSD token contract
    constructor(address _access, address _xusd) {
        access = HierarchicalAccessControl(_access);
        xusd = XUSD(_xusd);
        vibeFree[address(this)] = true;
        UserProfileRepo.Register(address(this));
    }

    /// @notice Assigns the CONSUL rank to the given address
    /// @param gove The address to assign the CONSUL rank to
    function setGov(address gove) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.SENATOR, msg.sender),
            "Not a SENATOR"
        );
        access.assignRank(gove, HierarchicalAccessControl.Rank.CONSUL);
    }

    /// @notice Returns the vibe score of a given user
    /// @param user The address of the user
    /// @return The vibe score of the user
    function viewVibes(address user) external view returns (int) {
        return usersVibesFile[user].vibes;
    }

    /// @notice Returns the vibe score of a given user
    /// @param user The address of the user
    /// @return The vibe score of the user
    function viewUser(address user) external view returns (int) {
        return usersVibesFile[user].vibes;
    }

    /// @notice Checks and assigns the rank of the user based on their vibe score
    /// @param user The address of the user
    function checkRank(address user) external {
        userProfile storage User = usersVibesFile[user];
        console.logInt(User.vibes);
        if (User.vibes < 300) {
            access.assignRank(user, HierarchicalAccessControl.Rank.GLADIATOR);
        }
    }

    /// @notice Returns the reward classes in the registry
    /// @return _rewards An array of RewardClass representing the rewards
    function showRewards() external view returns (RewardClass[] memory) {
        uint count = MasterClassContractRegistry.Count();
        RewardClass[] memory _rewards = new RewardClass[](count);

        for (uint i; i < count; ) {
            _rewards[i] = MasterClassContractMap[
                MasterClassContractRegistry.GetHashByIndex(i)
            ];
            unchecked {
                i++;
            }
        }
        return _rewards;
    }

    /// @notice Returns the active vibe classes in the registry
    /// @return _vibes A 2D array representing the vibes for To, From, and Caller classes
    function showVibes() external view returns (MaterClass[][3] memory) {
        MaterClass[][3] memory _vibes;

        // Initialize each nested array with appropriate sizes
        _vibes[0] = new MaterClass[](MasterClassToRegistry.Count());
        _vibes[1] = new MaterClass[](MasterClassFromRegistry.Count());
        _vibes[2] = new MaterClass[](MasterClassCallerRegistry.Count());

        // Populate _vibes[0] with active items from MasterClassToMap
        populateVibes(_vibes[0], MasterClassToRegistry, MasterClassToMap);

        // Populate _vibes[1] with active items from MasterClassFromMap
        populateVibes(_vibes[1], MasterClassFromRegistry, MasterClassFromMap);

        // Populate _vibes[2] with active items from MasterClassCallerMap
        populateVibes(_vibes[2], MasterClassCallerRegistry, MasterClassCallerMap);

        return _vibes;
    }

    /// @notice Adds a new class to the appropriate registry
    /// @param class The address of the class to be added
    /// @param active The active status of the class
    /// @param classType The type of class (0: To, 1: From, 2: Caller, 3: Contract)
    /// @param _process A boolean indicating if the process is ongoing
    function addClass(
        address class,
        bool active,
        uint classType,
        bool _process
    ) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.SENATOR, msg.sender),
            "Not a SENATOR"
        );

        MaterClass memory newClass = MaterClass({
            classAddress: class,
            updatedTimestamp: block.timestamp,
            active: active,
            process: _process,
            description: VibeBase(class).getDescription()
        });

        if (classType == 0) {
            MasterClassToRegistry.Register(class);
            MasterClassToMap[class] = newClass;
        } else if (classType == 1) {
            MasterClassFromRegistry.Register(class);
            MasterClassFromMap[class] = newClass;
        } else if (classType == 2) {
            MasterClassCallerRegistry.Register(class);
            MasterClassCallerMap[class] = newClass;
        } else if (classType == 3) {
            MasterClassContractRegistry.Register(class);
            MasterClassContractMap[class] = RewardClass({
                classAddress: class,
                active: active,
                process: _process,
                description: VibeBase(class).getDescription()
            });
        }
    }

    /// @notice Calculates and sums the basis points for a transaction
    /// @param to The address of the recipient
    /// @param from The address of the sender
    /// @param _caller The address of the caller
    /// @param amount The transaction amount
    /// @return The total basis points summed from the transaction
    function calculateAndSumBasis(
        address to,
        address from,
        address _caller,
        uint amount
    ) external returns (int) {
        if (!UserProfileRepo.Contains(to)) addProfile(to);
        if (!UserProfileRepo.Contains(from)) addProfile(from);
        if (!UserProfileRepo.Contains(_caller)) addProfile(_caller);

        userProfile storage toUser = usersVibesFile[to];
        userProfile storage fromUser = usersVibesFile[from];
        userProfile storage callerUser = usersVibesFile[_caller];

        int sumVibes = 0;

        // Calculate vibes for 'to' address
        sumVibes += calculateVibesForAddress(toUser, toVibe, MasterClassToRegistry, MasterClassToMap, amount);

        // Calculate vibes for 'from' address
        sumVibes += calculateVibesForAddress(fromUser, fromVibe, MasterClassFromRegistry, MasterClassFromMap, amount);

        // Calculate vibes for 'caller' address
        sumVibes += calculateVibesForAddress(callerUser, callerVibe, MasterClassCallerRegistry, MasterClassCallerMap, amount);

        // Calculate rewards based on summed vibes
        calculateRewards(to, from, _caller, amount, sumVibes);

        // Ensure vibe limits
        if (sumVibes <= 0) sumVibes = 0;
        if (sumVibes >= 10000) sumVibes = 9999;
        console.logInt(sumVibes);
        callerUser.vibes = sumVibes;
        console.logUint( ( uint(amount) * uint(sumVibes)/10000) );
        return sumVibes;
    }

    /// @dev Internal function to add a user profile
    /// @param user The address of the user to add
    function addProfile(address user) internal {
        UserProfileRepo.Register(user);
        usersVibesFile[user].userAddress = user;
    }

    /// @dev Populates the vibes array with active classes from the given registry and map
    /// @param vibesArray The array to populate
    /// @param registry The registry to retrieve classes from
    /// @param classMap The mapping of classes to retrieve descriptions from
    function populateVibes(
        MaterClass[] memory vibesArray,
        LibRegistryAdd.Registry storage registry,
        mapping(address => MaterClass) storage classMap
    ) internal view {
        uint index = 0;
        for (uint i; i < registry.Count(); ) {
            MaterClass storage mc = classMap[registry.GetHashByIndex(i)];
            if (mc.active) {
                vibesArray[index] = mc;
                index++;
            }
            unchecked {
                i++;
            }
        }
    }

    /// @dev Calculates vibes for a given address and stores results in the corresponding vibe map
    /// @param user The user profile to calculate vibes for
    /// @param vibeMap The map to store the calculated vibes in
    /// @param registry The registry to retrieve classes from
    /// @param classMap The mapping of classes to calculate fees with
    /// @param amount The transaction amount to base the calculation on
    /// @return The sum of calculated vibes for the address
    function calculateVibesForAddress(
        userProfile storage user,
        mapping(uint => usersVibe) storage vibeMap,
        LibRegistryAdd.Registry storage registry,
        mapping(address => MaterClass) storage classMap,
        uint amount
    ) internal returns (int) {
        int sumVibes = 0;
        for (uint i; i < registry.Count(); ) {
            MaterClass storage vibeClass = classMap[registry.GetHashByIndex(i)];
            if (vibeClass.active) {
                uint hash = vibeClass.classAddress.hashWith(user.userAddress);

                if (user.userClassRepo.Contains(hash)) {
                    if (vibeMap[hash].timestamp < vibeClass.updatedTimestamp || vibeClass.process) {
                        vibeMap[hash].vibes = ITaxCalculator(vibeClass.classAddress).calculateTotalBasisFee(user.userAddress, amount);
                        sumVibes += vibeMap[hash].vibes;
                        vibeMap[hash].timestamp = block.timestamp;
                    } else {
                        sumVibes += vibeMap[hash].vibes;
                    }
                } else {
                    user.userClassRepo.Register(hash);
                    vibeMap[hash].vibes = ITaxCalculator(vibeClass.classAddress).calculateTotalBasisFee(user.userAddress, amount);
                    sumVibes += vibeMap[hash].vibes;
                    vibeMap[hash].timestamp = block.timestamp;
                }
            } else {
                vibeClass.classAddress = address(0);
                registry.Remove(registry.GetHashByIndex(i));
            }
            unchecked {
                i++;
            }
        }
        return sumVibes;
    }

    /// @dev Calculates rewards for a transaction based on summed vibes
    /// @param to The recipient address
    /// @param from The sender address
    /// @param _caller The caller address
    /// @param amount The transaction amount
    /// @param sumVibes The total summed vibes
    function calculateRewards(
        address to,
        address from,
        address _caller,
        uint amount,
        int sumVibes
    ) internal {
        uint count = MasterClassContractRegistry.Count();
        for (uint i; i < count; ) {
            RewardClass storage rewardClass = MasterClassContractMap[
                MasterClassContractRegistry.GetHashByIndex(i)
            ];
            if (rewardClass.active) {
                IRewardsModule(rewardClass.classAddress).calculateRewards(to, from, _caller, amount, sumVibes);
            }
            unchecked {
                i++;
            }
        }
    }
}
