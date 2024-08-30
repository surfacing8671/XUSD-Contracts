// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./Address.sol";
import "hardhat/console.sol";
import "./Access.sol";
import "./Classes/IClassBase.sol";
import "./AddressReg.sol";
import "./XUSD1.sol";
import "./Classes/VibeBase.sol";
import "./VibeLibRegistry.sol";

interface ISHIO {
    function name() external returns (string memory);

    function symbol() external returns (string memory);

    function addOwner(address newOwner) external;

    function renounceOwnership(address toRemove) external;

    function owner(address cOwner) external view returns (bool);

    function mintToCap() external;

    function Type() external view returns (string memory);

    // function Rho() external view returns(Shao memory);
    function Manifold() external returns (uint64);

    function Monopole() external returns (uint64);

    function Generate(uint64 Xi, uint64 Alpha, uint64 Beta) external;

    function Isomerize() external;

    function Isolate() external;

    function Magnetize() external returns (uint64);

    function React(uint64 Pi) external returns (uint64, uint64);

    function Log(uint64 Soul, uint64 Aura, string memory LogLine) external;
}

contract VibeRegistry {
    using LibRegistry for LibRegistry.Registry;
    using VibeLibRegistry for VibeLibRegistry.Registry;
    using Address for address;

    // Custom Errors
    error NotAllowedAccess();

    // Data structures for class and reward management
    struct MaterClass {
        address classAddress;
        uint updatedTimestamp;
        bool active;
        bool process;
        string description;
        VibeBase.Importance level;
    }

    struct RewardClass {
        address classAddress;
        bool active;
        bool process;
        string description;
    }

    struct userVibe {
        address userAddress;
        address classAddress;
        int vibes;
        uint timestamp;
        bool active;
    }

   

    struct VibeClass {
        address classAddress;
        uint aura;
        uint updatedTimestamp;
        bool active;
        bool process;
        string description;
    }

  

    struct UserProfileHash {
        address userAddress;
        int vibes;
        LibRegistry.Registry MasterReg;
    }

    struct Wing {
        uint64 Omnicron;
        uint64 Omega;
    }

    // State variables
    XUSD public xusd;

    VibeLibRegistry.Registry internal MasterClassFromRegistry;
    VibeLibRegistry.Registry internal MasterClassToRegistry;
    VibeLibRegistry.Registry internal MasterClassCallerRegistry;
    VibeLibRegistry.Registry internal MasterClassContractRegistry;
    VibeLibRegistry.Registry internal MasterClassSenderRegistry;

    LibRegistry.Registry ErrorReg;

    mapping(address => MaterClass) internal MasterClassSenderMap;
    mapping(address => MaterClass) internal MasterClassFromMap;
    mapping(address => MaterClass) internal MasterClassToMap;
    mapping(address => MaterClass) internal MasterClassCallerMap;
    mapping(address => RewardClass) internal MasterClassContractMap;
    mapping(address => UserProfileHash) internal MasterUser;

    mapping(address => int) internal userTotalVibes;
    mapping(uint => userVibe) internal userClassVibe;
    mapping(address => mapping(address => Wing)) internal userVibesMap;
    mapping(uint => bool) internal TroubleShoot;

    uint internal classLimit = 50;
    uint internal denominator = 7500;
    int internal legatusRank = 350;
    int internal gladiator = 350;
    uint64 public constant MotzkinPrime = 953467954114363;
    ISHIO internal shio;

    uint256 private locked = 1;

    modifier nonReentrant() {
        require(locked == 1, "REENTRANCY");
        locked = 2;
        _;
        locked = 1;
    }

    HierarchicalAccessControl private access;

    constructor(address _access, address _xusd, address Shio) {
        access = HierarchicalAccessControl(_access);
        xusd = XUSD(_xusd);
        shio = ISHIO(Shio);
    }

    function viewVibes(address user) external view returns (int) {
        return userTotalVibes[user];
    }

    function setClassLimit(uint limit) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender)
        );
        classLimit = limit;
    }

    function setLegatusLimit(int limit) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender)
        );
        legatusRank = limit;
    }

    function setGladiatorLimit(int limit) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender)
        );
        gladiator = limit;
    }

    function checkRank() external {
        if (userTotalVibes[msg.sender] < legatusRank) {
            try
                access.assignRank(
                    msg.sender,
                    HierarchicalAccessControl.Rank.LEGATUS
                )
            {} catch {}
        } else if (userTotalVibes[msg.sender] < gladiator) {
            try
                access.assignRank(
                    msg.sender,
                    HierarchicalAccessControl.Rank.GLADIATOR
                )
            {} catch {}
        }
    }

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

    function calculateStorage2(
        address user,
        address class
    ) internal returns (uint64, uint64) {
        (uint64 Omnicron, uint64 Omega) = shio.React(Aura(user) ^ Aura(class));

        return (Omnicron, Omega);
    }

    function setDenominator(uint _denominator) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender)
        );
        denominator = _denominator;
    }

    function Aura(address user) internal pure returns (uint64) {
        return uint64(uint160(user) % MotzkinPrime);
    }

    function addClass(
        address class,
        bool active,
        uint classType,
        bool _process
    ) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.SENATOR, msg.sender)
        );

        MaterClass memory newClass = MaterClass({
            classAddress: class,
            updatedTimestamp: block.timestamp,
            active: active,
            process: _process,
            description: VibeBase(class).getDescription(),
            level: VibeBase(class).getLevel()
        });

        if (classType == 0) {
            MasterClassToRegistry.Register(class, VibeBase(class).getLevel());
            MasterClassToMap[class] = newClass;
        } else if (classType == 1) {
            MasterClassFromRegistry.Register(class, VibeBase(class).getLevel());
            MasterClassFromMap[class] = newClass;
        } else if (classType == 2) {
            MasterClassCallerRegistry.Register(
                class,
                VibeBase(class).getLevel()
            );
            MasterClassCallerMap[class] = newClass;
        } else if (classType == 3) {
            MasterClassSenderRegistry.Register(
                class,
                VibeBase(class).getLevel()
            );
            MasterClassSenderMap[class] = newClass;
        } else if (classType == 4) {
            MasterClassContractRegistry.Register(
                class,
                VibeBase(class).getLevel()
            );
            MasterClassContractMap[class] = RewardClass({
                classAddress: class,
                active: active,
                process: _process,
                description: VibeBase(class).getDescription()
            });
        }
    }

    function calculateAndSumBasis(
        address to,
        address from,
        address _caller,
        address sender,
        uint amount
    ) external nonReentrant returns (int, uint) {
        console.logAddress(to);
        int sumVibes = 0;

        int vibe = 0;



        (vibe, ) = calculateVibesForAddress(
            to,
            MasterClassToRegistry,
            MasterClassToMap,
            amount
        );
        sumVibes += vibe;
        (vibe, ) = calculateVibesForAddress(
            from,
            MasterClassFromRegistry,
            MasterClassFromMap,
            amount
        );
        sumVibes += vibe;
        (vibe, ) = calculateVibesForAddress(
            _caller,
            MasterClassCallerRegistry,
            MasterClassCallerMap,
            amount
        );
        sumVibes += vibe;

        (vibe, amount) = calculateVibesForAddress(
            sender,
            MasterClassSenderRegistry,
            MasterClassSenderMap,
            amount
        );
        sumVibes += vibe;
        calculateRewards(to, from, _caller, sender, amount, sumVibes);

        sumVibes = sumVibes < int(0) ? int(0) : sumVibes > int(9999)
            ? int(9999)
            : sumVibes;
        userTotalVibes[_caller] = sumVibes;

        console.logInt(sumVibes);
        //   console.logInt(userClassVibe[UserStorageMap[from].From]);
        console.logUint(amount);
        return (sumVibes, amount);
    }

    function retrieveUserVibeList(
        address user
    ) external view returns (userVibe[] memory) {
        uint count = MasterUser[user].MasterReg.Count();
        userVibe[] memory _rewards = new userVibe[](count);

        for (uint i = 0; i < count; ) {
            _rewards[i] = userClassVibe[
                MasterUser[user].MasterReg.GetHashByIndex(i)
            ];
            unchecked {
                i++;
            }
        }
        return _rewards;
    }

    function viewToVibes() external view returns (MaterClass[] memory) {
        uint count = MasterClassToRegistry.Count();
        MaterClass[] memory _rewards = new MaterClass[](count);

        for (uint i = 0; i < count; ) {
            _rewards[i] = MasterClassToMap[
                MasterClassToRegistry.GetHashByIndex(i)
            ];
            unchecked {
                i++;
            }
        }
        return _rewards;
    }

    function viewFromVibes() external view returns (MaterClass[] memory) {
        uint count = MasterClassFromRegistry.Count();
        MaterClass[] memory _rewards = new MaterClass[](count);

        for (uint i = 0; i < count; ) {
            _rewards[i] = MasterClassFromMap[
                MasterClassFromRegistry.GetHashByIndex(i)
            ];
            unchecked {
                i++;
            }
        }
        return _rewards;
    }

    function viewCallerVibes() external view returns (MaterClass[] memory) {
        uint count = MasterClassCallerRegistry.Count();
        MaterClass[] memory _rewards = new MaterClass[](count);

        for (uint i = 0; i < count; ) {
            _rewards[i] = MasterClassCallerMap[
                MasterClassCallerRegistry.GetHashByIndex(i)
            ];
            unchecked {
                i++;
            }
        }
        return _rewards;
    }

    function viewSenderVibes() external view returns (MaterClass[] memory) {
        uint count = MasterClassSenderRegistry.Count();
        MaterClass[] memory _rewards = new MaterClass[](count);

        for (uint i = 0; i < count; ) {
            _rewards[i] = MasterClassSenderMap[
                MasterClassSenderRegistry.GetHashByIndex(i)
            ];
            unchecked {
                i++;
            }
        }
        return _rewards;
    }

    function registerClass(
        address user,
        address class
    ) internal returns (uint64) {
        (uint64 Omnicron, uint64 Omega) = calculateStorage2(user, class);
        userVibesMap[user][class] = Wing({Omnicron: Omnicron, Omega: Omega});
        MasterUser[user].MasterReg.Register(Omnicron);
        userClassVibe[Omnicron].classAddress = class;
        userClassVibe[Omnicron].userAddress = user;
        return Omnicron;
    }

    function calculateVibesForAddress(
        address user,
        VibeLibRegistry.Registry storage registry,
        mapping(address => MaterClass) storage classMap,
        uint amount
    ) internal returns (int, uint) {
        int sumVibes = 0;
        int vibesI = 0;
        uint newAmount = amount;
        if ((registry.Count()) >= classLimit) {
            registry.SortRegistryByAccessStyle();
        }
        for (
            uint i = 0;
            i <
            uint(
                (registry.Count()) >= classLimit
                    ? classLimit
                    : (registry.Count())
            );

        ) {
            address classAddress = registry.GetHashByIndex(i);
            MaterClass storage vibeClass = classMap[classAddress];

            Wing storage On = userVibesMap[user][vibeClass.classAddress];
            if (!vibeClass.active) {
                // Remove inactive class from the registry and skip further processing
                registry.Remove(classAddress);
                continue; // Skip to the next iteration without incrementing i
            }
            if (userClassVibe[On.Omnicron].timestamp != 0) {
                if (
                    userClassVibe[On.Omnicron].timestamp >
                    vibeClass.updatedTimestamp
                ) {
                    if (!vibeClass.process) {
                        userClassVibe[On.Omnicron].timestamp = block.timestamp;
                        sumVibes += userClassVibe[On.Omnicron].vibes;
                    } else {
                        try
                            IVibeCalculator(vibeClass.classAddress)
                                .calculateTotalBasisFee(user, newAmount)
                        returns (int _vibes, uint256 _newAmount) {
                            newAmount = _newAmount;
                            vibesI = _vibes;
                        } catch {
                            registry.Remove(classAddress);
                            continue; // Skip to the next iteration without incrementing i
                        }

                        userClassVibe[On.Omnicron].vibes = vibesI;
                        userClassVibe[On.Omnicron].timestamp = block.timestamp;

                        sumVibes += userClassVibe[On.Omnicron].vibes;
                    }
                } else {
                    try
                        IVibeCalculator(vibeClass.classAddress)
                            .calculateTotalBasisFee(user, newAmount)
                    returns (int _vibes, uint256 _newAmount) {
                        newAmount = _newAmount;
                        vibesI = _vibes;
                    } catch {
                        registry.Remove(classAddress);
                        continue; // Skip to the next iteration without incrementing i
                    }

                    userClassVibe[On.Omnicron].vibes = vibesI;
                    userClassVibe[On.Omnicron].timestamp = block.timestamp;

                    sumVibes += userClassVibe[On.Omnicron].vibes;
                }
                // Apply a minimum amount check to ensure it doesn't go below a threshold
                uint256 lowerBound = (amount * denominator) / 10000;
                if (newAmount < lowerBound) {
                    newAmount = lowerBound;
                }
            } else {
                On.Omnicron = registerClass(user, vibeClass.classAddress);
                try
                    IVibeCalculator(vibeClass.classAddress)
                        .calculateTotalBasisFee(user, newAmount)
                returns (int _vibes, uint256 _newAmount) {
                    newAmount = _newAmount;
                    vibesI = _vibes;
                } catch {
                    registry.Remove(classAddress);
                    continue; // Skip to the next iteration without incrementing i
                }

                userClassVibe[On.Omnicron].vibes = vibesI;
                userClassVibe[On.Omnicron].timestamp = block.timestamp;
                sumVibes += userClassVibe[On.Omnicron].vibes;
            }

            unchecked {
                i++;
            }
        }

        return (sumVibes, newAmount);
    }

    function calculateOn(
        address user,
        address class
    ) internal returns (uint, uint) {
        (uint Omnicron, uint Omega) = calculateStorage2(user, class);
        return (Omnicron, Omega);
    }

    function setClassError(address class) external {
        (uint Omnicron, uint Omega) = calculateOn(msg.sender, class);
        userClassVibe[Omnicron].timestamp = block.timestamp;
        ErrorReg.Register(Omnicron);
        TroubleShoot[Omnicron] = true;
    }

    function checkErrors() external view returns (userVibe[] memory) {
              require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender)
        );
        uint count = ErrorReg.Count();
        userVibe[] memory _rewards = new userVibe[](count);

        for (uint i; i < count; ) {
            _rewards[i] = userClassVibe[ErrorReg.GetHashByIndex(i)];
            unchecked {
                i++;
            }
        }
        return _rewards;
    }

    function removeError(uint64 Omnicron) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender)
        );
        TroubleShoot[Omnicron] = false;
        ErrorReg.Remove(Omnicron);
    }

    function deactivateVibeUser(address user, address class) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender)
        );
        (uint Omnicron, uint Omega) = calculateOn(user, class);

        userClassVibe[Omnicron].active = true;
    }

    function activateVibeUser(address user, address class) external {
        require(
            access.hasRank(HierarchicalAccessControl.Rank.CONSUL, msg.sender)
        );
        (uint Omnicron, uint Omega) = calculateOn(user, class);

        userClassVibe[Omnicron].active = false;
    }

    function calculateRewards(
        address to,
        address from,
        address _caller,
        address sender,
        uint amount,
        int sumVibes
    ) internal {
        uint count = MasterClassContractRegistry.Count();

        // Sort only if the limit is reached (to avoid unnecessary sorting)
        if (count >= classLimit) {
            MasterClassContractRegistry.SortRegistryByAccessStyle();
        }

        for (uint i; i < count;) {
            // Get the reward class hash
            address classHash = MasterClassContractRegistry.GetHashByIndex(i);
            RewardClass storage rewardClass = MasterClassContractMap[classHash];

            // Proceed only if the reward class is active
            if (rewardClass.active) {
                try
                    IRewardsModule(rewardClass.classAddress).calculateRewards(
                        to,
                        from,
                        _caller,
                        sender,
                        amount,
                        sumVibes
                    )
                {
                    // Successful call
                } catch (bytes memory reason) {
                    MasterClassContractRegistry.Remove(classHash);
                    // Handle failed external contract call (optional logging)
                    // Example: emit an event with the error
                    emit RewardCalculationFailed(classHash, reason);
                }
            } else {
                MasterClassContractRegistry.Remove(classHash);
            }
                     unchecked {
                i++;
            }
        }
    }

    // Example of an event to log failures
    event RewardCalculationFailed(address classHash, bytes reason);
}
