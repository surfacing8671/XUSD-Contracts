// SPDX-License-Identifier: Sharia
pragma solidity ^0.8.21;
import "@openzeppelin/contracts/access/Ownable.sol";
import "./registry.sol";
import "./atropamath.sol";


abstract contract AccessRegistry is Ownable {
    using LibRegistry for LibRegistry.Registry;
    using AtropaMath for address;

 

    enum AccessType {
        PRESEDENT,
        CONGRESS,
        KING,
        SOLDIER,
        PARTICIPANT,
        CONTRACT,
        USER
    }


    struct Accessor {
        address Address;
        AccessType Class;
        address Domain;
       
  
    }
   
    LibRegistry.Registry private Registry;
    mapping(uint256 => Accessor) internal Accessors;


  





    function _hasAccess(address user, AccessType min, address dom) private view returns (bool) {    
        if(user == owner()) return true;    
        uint256 hash = user.hashWith(dom);
        if(Registry.Contains(hash)) {
     
            if(Accessors[hash].Class <= min && (Accessors[hash].Domain == address(this) || Accessors[hash].Domain == dom)) return true;
        }
        return false;
    }

    function _hasAccess(uint256 hash, AccessType min, address dom) private view returns (bool) {    
   
        if(Accessors[hash].Class <= min && (Accessors[hash].Domain == address(this) || Accessors[hash].Domain == dom)) return true;
        return false;
    }

    function HasAccess(address user, AccessType min, address dom) public view returns (bool) {                
        if(user == owner()) return true;
        assert(_hasAccess(msg.sender, AccessType.CONTRACT, user));
        uint256 hash = user.hashWith(dom);
        if(Registry.Contains(hash)) {
            assert(_hasAccess(msg.sender, Accessors[hash].Class, user));
            return _hasAccess(hash, min, dom);
        }
        return false;
    }

    function RegisterAccess(address addr, AccessType class, address dom) public {
        assert(HasAccess(msg.sender, AccessType.CONGRESS, address(this)));
       
        uint256 hash = addr.hashWith(dom);
        if(Registry.Contains(hash)) {
            assert(HasAccess(msg.sender, Accessors[hash].Class, addr));
            assert(HasAccess(msg.sender, class, dom));
        
               
        }
        SetAccess(addr, class, dom);
    }

    function GetAccess(address user, address dom) public view returns (Accessor memory) {
        assert(HasAccess(msg.sender, AccessType.CONTRACT, user));
        uint256 hash = user.hashWith(dom);
        return Accessors[hash];
    }


    function AccessIsClass(address user, address dom, AccessType class) public view returns(bool) {
        assert(HasAccess(msg.sender, AccessType.CONTRACT, user));
        uint256 hash = user.hashWith(dom);
        return Accessors[hash].Class == class;
    }

    function AccessRegistryCount() public view returns(uint256) {
        assert(HasAccess(msg.sender, AccessType.SOLDIER, address(this)));
        return Registry.Count();
    }

    function GetAccessByIndex(uint256 i) public view returns(Accessor memory) {
        uint256 hash = Registry.GetHashByIndex(i);
        assert(HasAccess(msg.sender, AccessType.SOLDIER, address(this)));
        return Accessors[hash];
    }

    function SetAccess(address user, AccessType Class, address dom) internal {
        uint256 hash = user.hashWith(dom);
        Registry.Register(hash);
        Accessors[hash].Address = user;
        Accessors[hash].Class = Class;
        Accessors[hash].Domain = dom;

    }

    function RemoveAccess(address user, address dom) public {
        Accessor memory A = GetAccess(user, dom);
        assert(HasAccess(msg.sender, AccessType.PRESEDENT, A.Domain));
        uint256 hash = user.hashWith(dom);
        Registry.Remove(hash);
        delete Accessors[hash];
    }
}