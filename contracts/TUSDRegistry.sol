// // SPDX-License-Identifier: Sharia
// pragma solidity ^0.8.24;

//  import "hardhat/console.sol";

//  import "./Address.sol";
//  import "./registry.sol";
// import "./ClassRegistry.sol";
// import "./Classes/IClassBase.sol";



// import "./access.sol";

// /**
//  * @title TUSDRegistry
//  * @dev This contract manages fee structures for different classes and their functions,
//  * allowing for user and class registration, as well as fee retrieval and updates.
//  */
//  contract TUSDRegistry is  Ownable {
//     using Address for address;
//     using LibRegistry for LibRegistry.Registry;
//     using AtropaMath for address;
 

//     /// @notice Address used for burning
//     address public immutable burn = 0x0000000000000000000000000000000000000369;

//     error ArrayLengthMismatch(); // 0xa24a13a6
//     error FeeAboveMaxLimit(); // 0xd6cf7b5e

//     event ClassFeeRegistered(bytes32 indexed feeId, address indexed classContract, bytes4 indexed functionSig, int256 fee);
//     event TotalFee(int256 fee);

//     mapping(uint256 => bool) public userList;

//     struct UsersClass {
//         address[] ClassAddress;
//     }

 
//     ClassRegistry public classreg;
//     uint256 public immutable userIndex = 0;
//     address public XUSD;

//     mapping(uint256 => UsersClass) internal UsersClassList;
//     mapping(uint256 => bool) internal ClassUserActive;
//     mapping(uint256 => UsersClass) internal UsersActiveClassList;
//     mapping(bytes4 => bool) feeRegistry;

//     struct Class1 {     
//         address classAddress; 
//         int256 basisFee;
//     }

//     struct UserWithClass {
//         address callerAddress; 
//         address classAddress;   
//         bool active;         
//         int256 basisFee;     
//     }

//     struct BasisClass {
//         address callerAddress;   
//         address toAddress;
//         address fromAddress;
//         int basisPoints;
//         bool stick;
//         bool unStick;    
//     }
//     struct UserTax {
//         address userAddress;   
//         int totalBasis;
//         bool active;
       
//     }


//     struct ClassTaxes {
//         address classAddress;  
//         bool active;   
//         int basisPoints;    
//     }
//     mapping(uint => UserTax)  UserMap;



//     LibRegistry.Registry internal  RecieverTax;
//     mapping(uint => ClassTaxes)  ReceverTaxMap;

//     LibRegistry.Registry internal SenderTax;
//     mapping(uint => ClassTaxes) SenderTaxMap;

//     LibRegistry.Registry internal StakingTax;
//     mapping(uint => ClassTaxes)  StakingTaxMap;

//     struct BassisActive {
//         int basisPoints;       
//         bool active;    
//     }

//     mapping(int =>   uint) lastClassCount;

//     address private baseClass;
//     mapping(address =>  bool) internal badAddresses;
//     mapping(uint =>  IClassBase.ClassTax) internal basisFee;
 
//     mapping(uint =>  BassisActive) internal activeFees;
//     LibRegistry.Registry internal UsersClassRegistry;

//     LibRegistry.Registry internal ActiveList;
//     mapping(uint =>  int) internal activeBasisFee;



//     mapping(uint => UserWithClass) internal Users;

//     mapping(uint =>  LibRegistry.Registry) internal UsersReg;


 
// constructor() {
//     Ownable(msg.sender);
// }


  

//     function getAllUserClassTaxResults(address user) external view returns(UserWithClass[] memory) {
//         UserWithClass[] memory userClass = new UserWithClass[](classreg.classRegistryCount());
//         for (uint256 i = 0; i < classreg.classRegistryCount(); i++) {
//             uint _hash = classreg.getClassByIndex(i).classAddress.hashWith(user);
//             userClass[i] = Users[_hash];
//         }
//           return userClass;       
//     }


  


//     function setSenderTaxCategory(address sender) external {
//         assert(HasAccess(msg.sender, AccessType.SOLDIER, address(this)));
//         uint hash = address(this).hashWith(sender);
//         if(!SenderTax.Contains(hash)) {
//         SenderTax.Register(hash);
//         SenderTaxMap[hash].active = true;
//         SenderTaxMap[hash].basisPoints = IClassBase(sender).getClassBasis();
//         SenderTaxMap[hash].classAddress = sender;
//         }
//     }


//     function setReceiverTaxCategory(address receiver) external {
//         assert(HasAccess(msg.sender, AccessType.SOLDIER, address(this)));
//         uint hash = address(this).hashWith(receiver);
//         if(!RecieverTax.Contains(hash)) {
//         RecieverTax.Register(hash);
//         ReceverTaxMap[hash].active = true;
//         ReceverTaxMap[hash].basisPoints = IClassBase(receiver).getClassBasis();
//         ReceverTaxMap[hash].classAddress = receiver;
//         }
//     }

  
//     function setStakingTaxCategory(address class) external {
//         assert(HasAccess(msg.sender, AccessType.SOLDIER, address(this)));
//         uint hash = address(this).hashWith(class);
//         if(!StakingTax.Contains(hash)) {
//         StakingTax.Register(hash);
//         StakingTaxMap[hash].active = true;
//         StakingTaxMap[hash].basisPoints = IClassBase(class).getClassBasis();

        
//         }
//     }

//     /**
//      * @dev Internal function to calculate the selective tax basis points based on transaction context.
//      * @param from The sender of the tokens.
//      * @param to The recipient of the tokens.
//      * @param caller The address that initiated the transaction.
//      * @return uint256 The total tax basis points.
//      */
//     function _calculateSelectiveTaxBasisPoints(address from, address to, address caller) internal  returns (uint256) {
//         int256 totalBasisPoints = 0;
//         uint hashF = address(this).hashWith( from);
//         uint hashT = address(this).hashWith( to);
//         uint hashC = address(this).hashWith( caller);

//         // Apply sender-related tax if applicable
//         if (SenderTax.Contains(hashF) && UserMap[hashF].active) {
//             uint amountNew = IClassBase(ReceverTaxMap[hashF].classAddress).calculateTaxBasisPoints(from, to, caller);
//             UserMap[hashT].totalBasis = int(UserMap[hashT].totalBasis) + int(amountNew);
//             UserMap[hashF].active = false;
           
//         }

//         // Apply receiver-related tax if applicable
//         if (RecieverTax.Contains(hashT) && UserMap[hashT].active) {
//             uint amountNew = (IClassBase(SenderTaxMap[hashF].classAddress)).calculateTaxBasisPoints(from, to, caller);
//             UserMap[hashT].totalBasis = int(UserMap[hashT].totalBasis) + int(amountNew);
//             UserMap[hashT].active = false;
//         }

//         // Apply staking-related tax if applicable
//         if ((UserMap[hashF].active)) {
//             uint amountNew = (IClassBase(StakingTaxMap[hashF].classAddress)).calculateTaxBasisPoints(from, to, caller);
//             UserMap[hashF].totalBasis = int(UserMap[hashT].totalBasis) + int(amountNew);
//             UserMap[hashF].active = false;
//         }
//         else if((UserMap[hashT].active)){
//             uint amountNew =  (IClassBase(StakingTaxMap[hashT].classAddress)).calculateTaxBasisPoints(from, to, caller);
//             UserMap[hashT].totalBasis = int(UserMap[hashT].totalBasis) + int(amountNew);
//             UserMap[hashT].active = false;

//         }

//         // Ensure the total tax basis points are non-negative
//         return totalBasisPoints < 0 ? 0 : uint256(totalBasisPoints);
//     }

//     // Functions to check if the number of tax calculators has changed, update the count, and retrieve the running total



//     function processTransaction(address from, address to, address spender, uint amount) external  returns (int) {
//         assert(HasAccess(msg.sender, AccessType.CONTRACT, address(this)));
//       uint hashIn = address(this).hashWith(spender);
//     //    if(!userList[hashIn]){
//     //     updateUser(caller);
//     //     userList[hashIn] = true;

//     //    }

//       _calculateSelectiveTaxBasisPoints(from, to, spender);

//       int taxBasisPoints =  UserMap[hashIn].totalBasis;
   
//         classreg.unpdateClasses();       

     
      
         
//                 console.logInt(taxBasisPoints);
//             if(taxBasisPoints >= 5000) {
                
//                 return 4500;
//             }
//             if(taxBasisPoints <= 0) {
//                 return 10;
//             }
//             return taxBasisPoints;
//        // }
//        // return 5000;
//     }




  
  
// }


   





