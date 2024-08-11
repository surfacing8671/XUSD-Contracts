// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.26;

import "./Address.sol";
import "hardhat/console.sol";
import "./AccessRegistry.sol";
import "./TUSDRegistry.sol";
import ".//Classes/IClassBase.sol";
import "./registry.sol";
import "./Classes/ITaxCalculatorContract.sol";
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
    event whitelistedClassContractFeeChange(address newContractClass, bool approval);

    

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



    mapping(uint => address) public classToFee;
    mapping(uint => address) public classFromFee;
    mapping(uint => address) public classContractFee;
        mapping(uint => address) public classCallerFee;

      mapping(uint => address) public classCallerFeeNow;


    LibRegistry.Registry internal classContractCallerWhitelistedRegistry;
    LibRegistry.Registry internal classContractCallerWhitelistedNowRegistry;
    LibRegistry.Registry internal classToFeeWhitelistedRegistry;
    LibRegistry.Registry internal classFromFeeWhitelistedRegistry;
    LibRegistry.Registry internal classContractFeeWhitelistedRegistry;

    LibRegistry.Registry internal MasterFeeRegistry;
    mapping(uint => int) public MasterFeeMap;

    LibRegistry.Registry internal MasterFeeRegistryContractCaller;
    mapping(uint => int) public MasterFeeMapContractCaller;

        LibRegistry.Registry internal MasterFeeRegistryContractFrom;
    mapping(uint => int) public MasterFeeMapContractFrom;

        LibRegistry.Registry internal MasterFeeRegistryContractTo;
    mapping(uint => int) public MasterFeeMapContractTo;

    LibRegistry.Registry internal MasterAddressRegistry;
    mapping(uint => address) public MasterAddressMap;




    address[] public addressList;

    uint256 public constant BATCH_SIZE = 50;
    uint public previousBatchIndex;


constructor() Ownable(msg.sender){}

    function recalculateFees() external {
        uint256 endIndex = previousBatchIndex + BATCH_SIZE;
        bool lastStop = false;
        if (endIndex > MasterAddressRegistry.Count()) {
            endIndex = MasterAddressRegistry.Count();
            lastStop = true;
        }
        for (uint256 i = previousBatchIndex; i < endIndex; i++) {
            address addr =  MasterAddressMap[MasterAddressRegistry.GetHashByIndex(i)];   

         calculateAddyFeesUpdate(addr);
        }

        if(lastStop) previousBatchIndex = 0;
    }

    function calculateAddyFeesUpdate(address addy) internal {
     
          for(uint i; i < classFromFeeWhitelistedRegistry.Count();){
       calculateAddCLassFee(addy, classFromFee[classFromFeeWhitelistedRegistry.GetHashByIndex(i)]);
        unchecked {
                ++i;
            }
        }
         for(uint i; i < classToFeeWhitelistedRegistry.Count();){
       calculateAddCLassFee(addy, classToFee[classToFeeWhitelistedRegistry.GetHashByIndex(i)]);
        unchecked {
                ++i;
            }
        }
        for(uint i; i < classContractCallerWhitelistedRegistry.Count();){
       calculateAddCLassFee(addy, classCallerFee[classContractCallerWhitelistedRegistry.GetHashByIndex(i)]);
        unchecked {
                ++i;
            }
        }



    }

    function updateContractFees() external {

          for(uint i; i < classContractFeeWhitelistedRegistry.Count();){
       calculateAddContractCLassFee(classContractFee[classContractFeeWhitelistedRegistry.GetHashByIndex(i)]);
        unchecked {
                ++i;
            }
        }
    }



    function setWhitelistedClassToFee(address class, bool isApproved) external {
        assert(HasAccess(msg.sender, AccessType.CONGRESS, address(this)));
        uint hash = address(this).hashWith(class);   
     
        if(isApproved){
            classToFeeWhitelistedRegistry.Register(hash);
            classToFee[hash] = class;
        }
        else{
            classToFeeWhitelistedRegistry.Remove(hash);
            classToFee[hash] = address(0);

        }
        emit whitelistedClassToFeeChange(class, isApproved);


    }


    function setWhitelistedClassCallerFee(
        address class,
        bool isApproved
    ) external {
        assert(HasAccess(msg.sender, AccessType.CONGRESS, address(this)));
        uint hash = address(this).hashWith(class);
               if(isApproved){
            classContractCallerWhitelistedRegistry.Register(hash);
            classCallerFee[hash] = class;
        }
        else{
            classContractCallerWhitelistedRegistry.Remove(hash);
            classCallerFee[hash] = address(0);

        }
        // emit whitelistedClassCallerFeeChange(class, isApproved);


    }

    function setWhitelistedClassFromFee(
        address class,
        bool isApproved
    ) external {
        assert(HasAccess(msg.sender, AccessType.CONGRESS, address(this)));
        uint hash = address(this).hashWith(class);
               if(isApproved){
            classFromFeeWhitelistedRegistry.Register(hash);
            classFromFee[hash] = class;
        }
        else{
            classFromFeeWhitelistedRegistry.Remove(hash);
            classFromFee[hash] = address(0);

        }
         emit whitelistedClassFromFeeChange(class, isApproved);


    }

    function setWhitelistedClassContractFee(
        address class,
        bool isApproved
    ) external {
        assert(HasAccess(msg.sender, AccessType.CONGRESS, address(this)));
        uint hash = address(this).hashWith(class);
        if(isApproved){
            classContractFeeWhitelistedRegistry.Register(hash);
            classContractFee[hash] = class;
        }
        else{
            classContractFeeWhitelistedRegistry.Remove(hash);
            classContractFee[hash] = address(0);

        }
         emit whitelistedClassContractFeeChange(class, isApproved);

         calculateAddContractCLassFee(class);
    }  


    function setWhitelistedClassNowFee(
        address class,
        bool isApproved
    ) external {
        assert(HasAccess(msg.sender, AccessType.CONGRESS, address(this)));
        uint hash = address(this).hashWith(class);
        console.log("here");
        if(isApproved){
            classContractCallerWhitelistedNowRegistry.Register(hash);
            classCallerFeeNow[hash] = class;
               console.log("saved");
        }
        else{
            classContractCallerWhitelistedNowRegistry.Remove(hash);
            classCallerFeeNow[hash] = address(0);

        }
         emit whitelistedClassContractFeeChange(class, isApproved);

       
    }  


    function getAddyBasis(address add, address class) internal returns(int){
        uint hash = class.hashWith(add);
        if(!MasterFeeRegistry.Contains(hash)){
            int fee = calculateAddCLassFee(add, class);
            MasterFeeRegistry.Register(hash);
            MasterFeeMap[hash] = fee;
            uint hashA = address(this).hashWith(add);
         if(!MasterAddressRegistry.Contains(hashA)){
            MasterAddressRegistry.Register(hashA);
            MasterAddressMap[hashA] = add;
        }
        }

        return MasterFeeMap[hash];


    }

        function getAddyContractToBasis(address add, address class) internal returns(int){
        uint hash = class.hashWith(add);
        if(!MasterFeeRegistryContractTo.Contains(hash)){
            int fee = calculateAddyContractToFee(add, class);
            MasterFeeRegistryContractTo.Register(hash);
            MasterFeeMapContractTo[hash] = fee;
            uint hashA = address(this).hashWith(add);
         if(!MasterAddressRegistry.Contains(hashA)){
            MasterAddressRegistry.Register(hashA);
            MasterAddressMap[hashA] = add;
        }
        }

        return MasterFeeMapContractTo[hash];


    }

        function getAddyContractFromBasis(address add, address class) internal returns(int){
        uint hash = class.hashWith(add);
        if(!MasterFeeRegistryContractFrom.Contains(hash)){
            int fee = calculateAddyContractFromFee(add, class);
            MasterFeeRegistryContractFrom.Register(hash);
            MasterFeeMapContractFrom[hash] = fee;
            uint hashA = address(this).hashWith(add);
         if(!MasterAddressRegistry.Contains(hashA)){
            MasterAddressRegistry.Register(hashA);
            MasterAddressMap[hashA] = add;
        }
        }

        return MasterFeeMapContractFrom[hash];


    }



    function calculateAddCLassFee(address add, address class) internal returns(int){

        int basisFee =  ITaxCalculator(class).calculateTaxBasisPoints(add);
        uint hash = class.hashWith(add);
        MasterFeeRegistry.Register(hash);
        MasterFeeMap[hash] = basisFee;
        uint hashA = address(this).hashWith(add);
        if(!MasterAddressRegistry.Contains(hashA)){
            MasterAddressRegistry.Register(hashA);
            MasterAddressMap[hashA] = add;
        }
        return basisFee;

    }

     function calculateAddyContractFromFee(address from,  address class) internal returns(int){
        int basisFee =  ITaxCalculatorContract(class).calculateTaxBasisPoints(address(0), from);
        uint hash = class.hashWith(from);
        MasterFeeRegistryContractFrom.Register(hash);
        MasterFeeMapContractFrom[hash] = basisFee;
        uint hashC = address(this).hashWith(class);
        if(!classFromFeeWhitelistedRegistry.Contains(hashC)){
            classFromFeeWhitelistedRegistry.Register(hashC);
            classFromFee[hashC] = class;
        }
        uint hashA = address(this).hashWith(from);
        if(!MasterAddressRegistry.Contains(hashA)){
            MasterAddressRegistry.Register(hashA);
            MasterAddressMap[hashA] = from;
        }
           return basisFee;

     }

     function calculateAddyContractToFee(address to,  address class) internal returns(int){
        int basisFee =  ITaxCalculatorContract(class).calculateTaxBasisPoints(to, address(0));
        uint hash = class.hashWith(to);
        MasterFeeRegistryContractTo.Register(hash);
        MasterFeeMapContractTo[hash] = basisFee;
        uint hashA = address(this).hashWith(to);
        uint hashC = address(this).hashWith(class);
        if(!classToFeeWhitelistedRegistry.Contains(hashC)){
            classToFeeWhitelistedRegistry.Register(hashC);
            classToFee[hashC] = class;
        }
        if(!MasterAddressRegistry.Contains(hashA)){
            MasterAddressRegistry.Register(hashA);
            MasterAddressMap[hashA] = to;
        }
        return basisFee;

     }





    function calculateAddContractCLassFee(address class) internal{

        address[] memory classContracts = retrieveContractsFromClass(class);
        //from zerro address loop
     
        for(uint i; i < classContracts.length;){
       calculateAddyContractToFee(classContracts[i], class);
        unchecked {
                ++i;
            }
        }
                //to zerro address loop
        for(uint i; i < classContracts.length;){
        calculateAddyContractFromFee(classContracts[i], class);
        unchecked {
                ++i;
            }
        }

        
            }

    function calculateTotalBasisFee(address to, address from, address caller) external returns(int){

        int basisTo = 0;
        int basisFrom = 0;
        int basisCaller = 0;
        if(to == from && to == caller){


                for(uint i; i < classContractCallerWhitelistedNowRegistry.Count();){
     basisCaller += calculateAddCLassFee(caller, classCallerFeeNow[classContractCallerWhitelistedNowRegistry.GetHashByIndex(i)]);
        unchecked {
                ++i;
            }
        }
            int _sumBasis = basisCaller + basisFrom + basisTo;

    return _sumBasis;

        }
 for(uint i; i < classFromFeeWhitelistedRegistry.Count();){

      basisFrom +=  getAddyBasis(from, classFromFee[classFromFeeWhitelistedRegistry.GetHashByIndex(i)]);
     
        unchecked {
                ++i;
            }
        }
        for(uint i; i < classContractFeeWhitelistedRegistry.Count();){
      basisFrom +=  getAddyContractFromBasis(from, classFromFee[classFromFeeWhitelistedRegistry.GetHashByIndex(i)]);
       basisTo += getAddyContractToBasis(to, classFromFee[classFromFeeWhitelistedRegistry.GetHashByIndex(i)]);
        unchecked {
                ++i;
            }
        }
    for(uint i; i < classToFeeWhitelistedRegistry.Count();){
         basisTo += getAddyBasis(to, classToFee[classToFeeWhitelistedRegistry.GetHashByIndex(i)]);
        unchecked {
                ++i;
            }
        }
        for(uint i; i < classContractCallerWhitelistedRegistry.Count();){
     basisCaller += getAddyBasis(caller, classCallerFee[classContractCallerWhitelistedRegistry.GetHashByIndex(i)]);
        unchecked {
                ++i;
            }
        }

                for(uint i; i < classContractCallerWhitelistedNowRegistry.Count();){
     basisCaller += calculateAddCLassFee(caller, classCallerFeeNow[classContractCallerWhitelistedNowRegistry.GetHashByIndex(i)]);
        unchecked {
                ++i;
            }
        }
        console.logInt(basisCaller);
  console.logInt(basisFrom);
    console.logInt(basisTo);
    int sumBasis = basisCaller + basisFrom + basisTo;

    return sumBasis;
    }

    function retrieveContractsFromClass(address class)internal view returns(address[] memory){
        return ITaxCalculatorContract(class).getContract();
    }



   


    // /**
    //  * @notice Checks if a given proposed class is valid.
    //  * @param dom The address of the proposed class.
    //  * @return True if the proposed class is valid, false otherwise.
    //  */
    // function classProposedValid(address dom) public view returns (bool) {
    //     uint256 hash = address(this).hashWith(dom);
    //     return proposedClasses.Contains(hash);
    // }

    // function getTotalProposals() public view returns (Class [] memory) {
    //     Class[] memory votingData = new Class[](proposedCount());
    //     for(uint i; i < proposedCount(); i ++){

    //         votingData[i] = classes[proposedClasses.GetHashByIndex(i)];

    //     }
    //     return votingData;

    // }

    // function getActiveClassTax() public view returns (Class [] memory) {
    //     Class[] memory votingData = new Class[](classRegistryList.Count());
    //     for(uint i; i < classRegistryList.Count(); i ++){

    //         votingData[i] = classes[classRegistryList.GetHashByIndex(i)];

    //     }
    //     return votingData;

    // }

    // /**
    //  * @notice Retrieves class details for a given address.
    //  * @param dom The address of the class.
    //  * @return The class details.
    //  */
    // function getClass(address dom) public view returns (Class memory) {
    //     uint256 hash = address(this).hashWith(dom);
    //     return classes[hash];
    // }

    // function getProposed(address dom) public view returns (ProposedClass memory) {
    //     uint hash = address(this).hashWith(dom);
    //     return prospectClasses[hash];
    // }

    // /**
    //  * @notice Gets the total count of registered classes.
    //  * @return The total count of registered classes.
    //  */
    // function classRegistryCount() public view returns (uint256) {
    //     return classRegistryList.Count();
    // }

    // /**
    //  * @notice Gets the total count of proposed classes.
    //  * @return The total count of proposed classes.
    //  */
    // function proposedCount() public view returns (uint256) {
    //     return proposedClasses.Count();
    // }

    // function unpdateClasses() external {
    //     // assert(HasAccess(msg.sender, AccessType.CONTRACT));
    //     uint count = classRegistryCount();
    //     for(uint i; i < proposedCount(); i ++){
    //      if(classes[proposedClasses.GetHashByIndex(i)].votes > (count / 2)){
    //         classes[proposedClasses.GetHashByIndex(i)].passed = classes[proposedClasses.GetHashByIndex(i)].votes > (count / 2);
    //         uint hash = proposedClasses.GetHashByIndex(i);
    //         proposedClasses.Remove(hash);
    //         classRegistryList.Register(hash);
    //            if(classes[proposedClasses.GetHashByIndex(i)].tradeClass == Trades.SENDING){
    //             this.setSenderTaxCategory(classes[proposedClasses.GetHashByIndex(i)].classAddress);
    //            }
    //            if(classes[proposedClasses.GetHashByIndex(i)].tradeClass == Trades.RECIEVING){
    //             this.setReceiverTaxCategory(classes[proposedClasses.GetHashByIndex(i)].classAddress);
    //            }
    //            if(classes[proposedClasses.GetHashByIndex(i)].tradeClass == Trades.SENDING){
    //             this.setStakingTaxCategory(classes[proposedClasses.GetHashByIndex(i)].classAddress);
    //            }

    //            }

    //      }

    //     }

    // /**
    //  * @notice Gets the details of a class by index.
    //  * @param i The index of the class.
    //  * @return The class details.
    //  */
    // function getClassByIndex(uint256 i) public view returns (Class memory) {
    //     uint256 hash = classRegistryList.GetHashByIndex(i);
    //     return classes[hash];
    // }

    // /**
    //  * @notice Proposes a new class for registration.
    //  * @param dom The address of the proposed class.
    //  */
    // function proposeClass(address dom, Trades moo) public {
    //     uint256 hash = address(this).hashWith(dom);
    //     uint hashU = address(this).hashWith(msg.sender);

    //     if (proposedClasses.Contains(hash)) {
    //         revert AlreadyProposed();
    //     }

    //     classes[hash] = Class({
    //         classAddress: dom,
    //         basisFee: IClassBase(dom).getClassBasis(),
    //         votes: 0,
    //         passed: false,
    //         notes: IClassBase(dom).getNote(),
    //         tradeClass: moo

    //     });

    //     proposedClasses.Register(hash);

    // }

    // function voteClass(address dom, address user) public {
    //     uint256 hashD = address(this).hashWith(dom);
    //     uint256 hash2 = user.hashWith(dom);
    //     uint hash = address(this).hashWith(user);

    //     if(proposedClasses.Contains(hashD)){

    //     if (!voted[hash2]) {
    //         userVotes[hash2].classAddress = dom;
    //         userVotes[hash2].userAddress = user;
    //         userVotes[hash2].votes = GetVote(user);
    //         userVotes[hash2].timestamp = block.timestamp;
    //         userVotes[hash2].basisFee = IClassBase(dom).getClassBasis();

    //         classes[hashD].votes += GetVote(user);

    //         voted[hash2] = true;
    //     }
    // }
    // }
    // function GetVote(address user) public view returns(uint) {

    //     assert(HasAccess(user, AccessType.USER, address(this)));
    //     uint256 hash = address(this).hashWith(user);

    //     uint mul =1;

    //     if (Accessors[hash].Class == AccessType.USER) {
    //         mul = 1;
    //     } else if (Accessors[hash].Class == AccessType.PARTICIPANT) {
    //         mul = 2;
    //     } else if (Accessors[hash].Class == AccessType.SOLDIER) {
    //         mul = 3;
    //     } else if (Accessors[hash].Class == AccessType.KING) {
    //         mul = 4;
    //     } else if (Accessors[hash].Class == AccessType.CONGRESS) {
    //         mul = 5;
    //     }

    //   return 1 * mul;

    //     }

    // function setClass(address dom, Trades moo) public  {
    //     assert(HasAccess(msg.sender, AccessType.CONGRESS, dom));
    //     uint hash = address(this).hashWith(dom);
    //     uint count = classRegistryCount();

    //     classRegistryList.Register(hash);

    //     classes[hash] = Class({
    //         classAddress: dom,
    //         basisFee: IClassBase(dom).getClassBasis(),
    //         votes: 0,
    //         passed: true,
    //         notes: IClassBase(dom).getNote(),
    //         tradeClass: moo
    //     });
    // }

    // /**
    //  * @notice Removes a class from the registry.
    //  * @param dom The address of the class.
    //  */
    // function removeClass(address dom) public onlyOwner {
    //     uint256 hash = address(this).hashWith(dom);
    //     classRegistryList.Remove(hash);
    //     delete classes[hash];
    // }
}
