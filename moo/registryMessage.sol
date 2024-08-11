// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "./registry.sol";
import "./atropamath.sol";
import './Ownable.sol';
import "./ILitPass.sol";
/**
 * @title SharedRegistry
 * @dev This contract serves as a shared registry for other contracts to store and retrieve data.
 */

 interface XUSD {
    function burnBalance(address user) external view returns (uint256);
}
contract SharedRegistry is Ownable {
    using LibRegistry for LibRegistry.Registry;
    using AtropaMath for address;

    address public oneSwap;
    address public xusd;
    ILitPass public lit;
    uint256 public userAmount = 0;
    uint256 public participantAmount = 107750000000;
    uint256 public soldierAmount = 207750000000000;

    enum AccessType {
        PRESEDENT,
        CONGRESS,
        CONTRACT,
        KING,
        SOLDIER,
        PARTICIPANT,
        USER
    }

    struct Accessor {
        address addr;
        AccessType class;
        uint256 burnAmount;
        uint256 litPass;
    }

    LibRegistry.Registry  accessRegistry;
    mapping(uint256 => Accessor) accessors;

    constructor(address _xusd, address litPass)  {
        Ownable(msg.sender);
        xusd = _xusd;
        lit = ILitPass(litPass);
    }


    event RecordCreated(uint256 indexed recordId, address indexed owner, string data);
    event RecordUpdated(uint256 indexed recordId, address indexed owner, string data);




    function _hasAccess(address user, AccessType min) public view returns (bool) {
        uint hash = address(this).hashWith(user);
        return accessors[hash].class <= min;
    }

  


    function setAccess( address user, AccessType class) external {
        uint hash = address(this).hashWith(user);
        assert(_hasAccess(user, AccessType.USER));
        accessRegistry.Register(hash);
        accessors[hash] = Accessor({
            addr: user,
            class: class,
            burnAmount: XUSD(xusd).burnBalance(user),
            litPass: ILitPass(lit).getIdFromOwner(user)
        });
    }

    function checkUpgrade(address user, uint256 amounts, AccessType class) public returns (bool) {
        uint hash = address(this).hashWith(user);
        if (accessors[hash].burnAmount >= amounts) {
            accessors[hash].class = class;
            return true;
        }
        return false;
    }

   

    function registerAccess( address user, AccessType class) public returns(bool) {
        uint hash = address(this).hashWith(user);
        assert(_hasAccess(user, AccessType.CONTRACT));
     

            this.setAccess(user, class);
            return true;
      
}

    function setRankingAmounts(address user, uint256 _userAmount, uint256 _participantAmount, uint256 _soldierAmount) external {
        uint hash = address(this).hashWith(user);
        require(_hasAccess(user, AccessType.PRESEDENT));
        userAmount = _userAmount;
        participantAmount = _participantAmount;
        soldierAmount = _soldierAmount;
    }

    function setLitPass(address user, uint256 tokenId) external {
        uint hash = address(this).hashWith(user);
        if (ILitPass(lit).getOwner(tokenId) == user) {
            accessors[hash].litPass = tokenId;
        }
    }

    function applyForKing(address user, uint256 tokenId) external {
        uint hash = address(this).hashWith(user);
        if (accessors[hash].burnAmount >= soldierAmount) {
            if (ILitPass(lit).getOwner(tokenId) == user) {
                if (!_hasAccess(user, AccessType.KING)) {
                    accessors[hash].class = AccessType.KING;
                }
            }
        }
    }

    function updateUser(address user) public returns (bool) {
        uint hash = address(this).hashWith(user);
        if (checkUpgrade( user, soldierAmount, AccessType.SOLDIER)) return true;
        if (checkUpgrade( user, participantAmount, AccessType.PARTICIPANT)) return true;
        if (checkUpgrade( user, userAmount, AccessType.USER)) return true;
        return false;
    }

    function updateUserBurns(address user) public {
        uint hash = address(this).hashWith(user);
        accessors[hash].burnAmount = XUSD(xusd).burnBalance(user);
    }

    function registerGovAccess(address user, address addr, AccessType class) public {
        uint hash = address(this).hashWith(user);
        assert(_hasAccess(user, AccessType.CONTRACT));
        this.setAccess( user, class);
    }
    function setLitpass(address user, uint tokenId) external {
        uint hash = address(this).hashWith(user);
        if(ILitPass(lit).getOwner(tokenId) == user){
            accessors[hash].litPass = tokenId;
        }
    }
    function accessRegistryCount(address user) public view returns (uint256) {
        uint hash = address(this).hashWith(user);
        assert(_hasAccess(user, AccessType.USER));
        return accessRegistry.Count();
    }
    function GetVote(address user) public view returns(uint) {
     
        uint hash = address(this).hashWith(user);
 
       
        uint mul;

        if (accessors[hash].class == AccessType.USER) {
            mul = 1;
        } else if (accessors[hash].class == AccessType.PARTICIPANT) {
            mul = 2;
        } else if (accessors[hash].class == AccessType.SOLDIER) {
            mul = 3;
        } else if (accessors[hash].class == AccessType.KING) {
            mul = 4;
        } else if (accessors[hash].class == AccessType.CONGRESS) {
            mul = 5;
        } else {
            mul = 0;
        }

      return 1 * mul;

    }


    function removeAccess(address user) public {
        assert(_hasAccess(user, AccessType.CONGRESS));
        uint hash = address(this).hashWith(user);
   
        delete accessors[hash];
    }

 
}