// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;

import "@openzeppelin/contracts/access/Ownable.sol";
import "./registry.sol";
import "./ILitPass.sol";
import "./atropamath.sol";
import "hardhat/console.sol";
interface XUSD {
    function burnBalance(address user) external view returns (uint256);
}

abstract contract GovAccessRegistry is Ownable {
    using LibRegistry for LibRegistry.Registry;
    using AtropaMath for address;

    address public xusd;
    address public lit;
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
    mapping(uint256 => Accessor) public accessors;

    constructor()  {}

    function _hasAccess(address user, AccessType min) private view returns (bool) {
        if (user == owner()) return true;
        uint256 hash = address(this).hashWith(user);
        if (accessRegistry.Contains(hash)) {
            if (accessors[hash].class <= min) return true;
        }
        return false;
    }

    function _hasAccess(uint256 hash, AccessType min) private view returns (bool) {
        return accessors[hash].class <= min;
    }

    function HasAccess(address user, AccessType min) public view returns (bool) {
        if (user == owner()) return true;
        assert(_hasAccess(msg.sender, AccessType.USER));
        uint256 hash = address(this).hashWith(user);
        if (accessRegistry.Contains(hash)) {
            assert(_hasAccess(msg.sender, accessors[hash].class));
            return _hasAccess(hash, min);
        }
        return false;
    }

    function registerAccess(address addr, AccessType class) public {
        assert(HasAccess(msg.sender, AccessType.CONTRACT));
        uint256 hash = address(this).hashWith(addr);
        if (accessRegistry.Contains(hash)) {
            assert(HasAccess(msg.sender, accessors[hash].class));
            assert(HasAccess(msg.sender, class));
            setAccess(addr, class);
        } else {
            setAccess(addr, class);
        }
    }

    function checkUpgrade(address user, uint256 amounts, AccessType class) public returns (bool) {
        uint256 hash = address(this).hashWith(user);
        if (accessors[hash].burnAmount >= amounts) {
            accessors[hash].class = class;
            return true;
        }
        return false;
    }


    function setXusd(address _xusd) external onlyOwner {
        xusd = _xusd;
    }

    function setLit(address _lit) external onlyOwner {
        lit = _lit;
    }

    function setRankingAmounts(uint256 _userAmount, uint256 _participantAmount, uint256 _soldierAmount) external {
        require(_hasAccess(msg.sender, AccessType.PRESEDENT));
        userAmount = _userAmount;
        participantAmount = _participantAmount;
        soldierAmount = _soldierAmount;
    }

    function setLitPass(address user, uint256 tokenId) external {
        uint256 hash = address(this).hashWith(user);
        if (ILitPass(lit).getOwner(tokenId) == user) {
            accessors[hash].litPass = tokenId;
        }
    }

    function applyForKing(address user, uint256 tokenId) external {
        uint256 hash = address(this).hashWith(user);
        if (accessors[hash].burnAmount >= soldierAmount) {
            if (ILitPass(lit).getOwner(tokenId) == user) {
                if (!_hasAccess(user, AccessType.KING)) {
                    accessors[hash].class = AccessType.KING;
                }
            }
        }
    }

    function updateUser(address user) public returns (bool) {
        uint256 hash = address(this).hashWith(user);
        if (checkUpgrade(user, soldierAmount, AccessType.SOLDIER)) return true;
        if (checkUpgrade(user, participantAmount, AccessType.PARTICIPANT)) return true;
        if (checkUpgrade(user, userAmount, AccessType.USER)) return true;
        return false;
    }

    function updateUserBurns(address user) public {
        uint256 hash = address(this).hashWith(user);
        accessors[hash].burnAmount = XUSD(xusd).burnBalance(user);
    }

    function registerGovAccess(address addr, AccessType class) public {
        assert(_hasAccess(msg.sender, AccessType.CONTRACT));
        setAccess(addr, class);
    }
    function setLitpass(address user,  uint tokenId) external {
        uint256 hash = address(this).hashWith(user);
        if(ILitPass(lit).getOwner(tokenId) == user){
            accessors[hash].litPass = tokenId;
        }
    }
    function accessRegistryCount() public view returns (uint256) {
        assert(_hasAccess(msg.sender, AccessType.USER));
        return accessRegistry.Count();
    }
    function GetVote() public view returns(uint) {
     
      
        uint256 hash = address(this).hashWith(msg.sender);
       
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
        uint  h = uint(accessors[hash].class);
        console.log(mul);
        console.log(h);
      return 1 * mul;  
     
        }
    
        
    function setAccess(address user, AccessType class) internal {
        uint256 hash = address(this).hashWith(user);
        assert(_hasAccess(msg.sender, AccessType.USER));
        accessRegistry.Register(hash);
        accessors[hash] = Accessor({
            addr: user,
            class: class,
    
            burnAmount: 0,
            litPass: 0
        });
    }

    function removeAccess(address user) public {
        assert(_hasAccess(msg.sender, AccessType.CONGRESS));
        uint256 hash = address(this).hashWith(user);
        accessRegistry.Remove(hash);
        delete accessors[hash];
    }
}
