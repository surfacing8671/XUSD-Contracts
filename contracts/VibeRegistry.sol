// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "./Address.sol";
import "hardhat/console.sol";
import "./Classes/IPancackePair.sol";
import "./Access.sol";
import "./Classes/IClassBase.sol";
import "./AddressReg.sol";
import "./XUSD1.sol";
import "./Classes/VibeBase.sol";
import "./VibeLibRegistry.sol";
import "./atropamath.sol";
import "./IAccessManager.sol";
import "./registry.sol";



contract VibeRegistry  {
 
   // using LibRegistry for LibRegistry.Registry;
    using VibeLibRegistry for VibeLibRegistry.Registry;
    using Address for address;
    using AtropaMath for address;
    using LibRegistry for LibRegistry.Registry;
    // Custom Errors
    error NotAllowedAccess();

    // Data structures for class and reward management
    struct MaterClass {
        address classAddress;
        uint updatedTimestamp;
        bool process;
        string description;
        VibeBase.Importance level;
    }

    struct RewardClass {
        address classAddress;

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

    error UnauthorizedAccess( IAccessManager.Rank roleId, address addr);
    uint internal classLimit = 50;
    uint internal denominator = 7500;
    int internal legatusRank = 350;
    int internal gladiator = 350;
    uint64 public constant MotzkinPrime = 953467954114363;
  IAccessManager public accessControl; // Instance of the central access control
// ManagedSecurity public secure;
    //VMREQ internal math = VMREQ(0xB680F0cc810317933F234f67EB6A9E923407f05D);
    uint256 private locked = 1;

    modifier nonReentrant() {
        require(locked == 1, "REENTRANCY");
        locked = 2;
        _;
        locked = 1;
    }

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

    constructor(address _accessControl, address _xusd) {
        accessControl = IAccessManager(_accessControl);
        xusd = XUSD(_xusd);
        console.log("no");
    //    MasterClassFromRegistry.Register(address(this)); 
    //    MasterClassToRegistry.Register(address(this)); 
    //    MasterClassCallerRegistry.Register(address(this)); 
    //    MasterClassContractRegistry.Register(address(this)); 
    //         MasterClassSenderRegistry.Register(address(this)); 
    }

    // Function implementations that use access control...

 
    function viewVibes(address user) external view returns (int) {
        return userTotalVibes[user];
    }

    function setClassLimit(uint limit) external onlyConsul{

        classLimit = limit;
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




    function addClass(
        address class,      
        uint classType,
        bool _process
    ) external onlySenator{
        

        MaterClass memory newClass = MaterClass({
            classAddress: class,
            updatedTimestamp: block.timestamp,            
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

        (vibe, ) = calculateVibesForAddress(
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
       
        return (sumVibes, amount);
    }


function viewToVibes(uint start, uint limit) external view returns (MaterClass[] memory) {
    uint count = MasterClassToRegistry.Count();
    require(start <= count, "Invalid start index");

    // Calculate the effective limit
    uint effectiveLimit = start + limit > count ? count - start : limit;

    MaterClass[] memory _rewards = new MaterClass[](effectiveLimit);

    for (uint i = 0; i < effectiveLimit; ) {
        _rewards[i] = MasterClassToMap[
            MasterClassToRegistry.GetHashByIndex(start + i)
        ];
        unchecked {
            i++;
        }
    }

    return _rewards;
}
  
function viewFromVibes(uint start, uint limit) external view returns (MaterClass[] memory) {
    uint count = MasterClassFromRegistry.Count();
    require(start <= count, "Invalid start index");

    // Calculate the effective limit
    uint effectiveLimit = start + limit > count ? count - start : limit;

    MaterClass[] memory _rewards = new MaterClass[](effectiveLimit);

    for (uint i = 0; i < effectiveLimit; ) {
        _rewards[i] = MasterClassFromMap[
            MasterClassFromRegistry.GetHashByIndex(start + i)
        ];
        unchecked {
            i++;
        }
    }

    return _rewards;
}

function viewCallerVibes(uint start, uint limit) external view returns (MaterClass[] memory) {
    uint count = MasterClassCallerRegistry.Count();
    require(start <= count, "Invalid start index");

    // Calculate the effective limit
    uint effectiveLimit = start + limit > count ? count - start : limit;

    MaterClass[] memory _rewards = new MaterClass[](effectiveLimit);

    for (uint i = 0; i < effectiveLimit; ) {
        _rewards[i] = MasterClassCallerMap[
            MasterClassCallerRegistry.GetHashByIndex(start + i)
        ];
        unchecked {
            i++;
        }
    }

    return _rewards;
}



function viewTotalActiveVibesNumber() external view returns (uint) {
    uint count = MasterClassSenderRegistry.Count();
    uint count2 = MasterClassFromRegistry.Count();
    uint count3 = MasterClassCallerRegistry.Count();
    uint count4 = MasterClassToRegistry.Count();
   

    return count + count2 + count3 + count4;
}
function viewSenderVibes(uint start, uint limit) external view returns (MaterClass[] memory) {
    uint count = MasterClassSenderRegistry.Count();
    require(start <= count, "Invalid start index");

    // Calculate the effective limit
    uint effectiveLimit = start + limit > count ? count - start : limit;

    MaterClass[] memory _rewards = new MaterClass[](effectiveLimit);

    for (uint i = 0; i < effectiveLimit; ) {
        _rewards[i] = MasterClassSenderMap[
            MasterClassSenderRegistry.GetHashByIndex(start + i)
        ];
        unchecked {
            i++;
        }
    }

    return _rewards;
}

    function calculateVibesForAddress(
        address user,
        VibeLibRegistry.Registry storage registry,
        mapping(address => MaterClass) storage classMap,
        uint amount
    ) internal returns (int, uint) {
        int sumVibes = 0;

 
        
        // Sort registry by access style if the count exceeds the class limit
        if (registry.Count() >= classLimit) {
            registry.SortRegistryByAccessStyle();
        }

        uint count = registry.Count() >= classLimit
            ? classLimit
            : registry.Count();

        for (uint i; i < count; ) {
            address classAddress = registry.GetHashByIndex(i);
            MaterClass storage vibeClass = classMap[classAddress];
            uint Omnicron = user.hashWith(vibeClass.classAddress);
            bool userHasVibe = userClassVibe[Omnicron].timestamp != 0;
            
            // Skip processing if user's class vibe is up-to-date
            if (
                userHasVibe &&
                userClassVibe[Omnicron].timestamp > vibeClass.updatedTimestamp
            ) {
                if (!vibeClass.process) {
                    userClassVibe[Omnicron].timestamp = block.timestamp;
                    sumVibes += userClassVibe[Omnicron].vibes;
                } else {
                    try
                        IVibeCalculator(vibeClass.classAddress)
                            .calculateTotalBasisFee(user, amount)
                    returns (int _vibes) {
                       
                        userClassVibe[Omnicron].vibes = _vibes;
                        userClassVibe[Omnicron].timestamp = block.timestamp;
                    } catch {
                        registry.Remove(classAddress);
                        return (0, amount); // Return without updating vibesI
                    }


                    userClassVibe[Omnicron].timestamp = block.timestamp;

              
                    sumVibes += userClassVibe[Omnicron].vibes;
                }
            } else {
                try
                    IVibeCalculator(vibeClass.classAddress)
                        .calculateTotalBasisFee(user, amount)
                returns (int _vibes) {
              
                    userClassVibe[Omnicron].vibes = _vibes;
                    userClassVibe[Omnicron].timestamp = block.timestamp;
                } catch {
                    registry.Remove(classAddress);
                    return (0, amount); // Return without updating vibesI
                }

               
                sumVibes += userClassVibe[Omnicron].vibes;
            }


            unchecked {
                i++;
            }
        }

        console.logInt(sumVibes);
        return (sumVibes, amount);
    }

 
    // function setClassError(address class) external {
    //     uint Omnicron = msg.sender.hashWith(class);
    //     userClassVibe[Omnicron].timestamp = block.timestamp;
    //     ErrorReg.Register(Omnicron);
    //     TroubleShoot[Omnicron] = true;
    // }

    // function checkErrors() external view onlyConsul returns (userVibe[] memory) {
        
    //     uint count = ErrorReg.Count();
    //     userVibe[] memory _rewards = new userVibe[](count);

    //     for (uint i; i < count; ) {
    //         _rewards[i] = userClassVibe[ErrorReg.GetHashByIndex(i)];
    //         unchecked {
    //             i++;
    //         }
    //     }
    //     return _rewards;
    // }

    // function removeError(uint64 Omnicron) external onlyConsul {
        
    //     TroubleShoot[Omnicron] = false;
    //     ErrorReg.Remove(Omnicron);
    // }

    function deactivateVibe(address class, uint classType) external onlyConsul {

     

          if (classType == 0) {
            MasterClassToRegistry.Remove(class);

        } else if (classType == 1) {
            MasterClassFromRegistry.Remove(class);

        } else if (classType == 2) {
            MasterClassCallerRegistry.Remove(class);
  
        } else if (classType == 3) {
            MasterClassSenderRegistry.Remove(class);

        } else if (classType == 4) {
            MasterClassContractRegistry.Remove(class);
           
        }
    }


    function deactivateRewards(address user, address class) external onlyConsul {
     
        uint Omnicron = user.hashWith(class);

        userClassVibe[Omnicron].active = true;
    }

    function deactivateVibeUser(address user, address class) external onlyConsul {
     
        uint Omnicron = user.hashWith(class);

        userClassVibe[Omnicron].active = true;
    }

    function activateVibeUser(address user, address class) external onlyConsul {
     
        uint Omnicron = user.hashWith(class);

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

        for (uint i; i < count; ) {
            // Get the reward class hash
            address classHash = MasterClassContractRegistry.GetHashByIndex(i);
            RewardClass storage rewardClass = MasterClassContractMap[classHash];

            // Proceed only if the reward class is active
         
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
           
            unchecked {
                i++;
            }
        }
    }

    // Example of an event to log failures
    event RewardCalculationFailed(address classHash, bytes reason);
}
