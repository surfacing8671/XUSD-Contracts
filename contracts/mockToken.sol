// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;


//import "@openzeppelin/contracts-upgradeable/utils/ContextUpgradeable.sol";
import "./ERC20Taxible.sol";

import "./ClassRegistry.sol";

/**
 * @title MyTokenMock
 * @dev A mock token contract inheriting ERC20Taxable with voting and delegate functionalities.
 */
contract XUSD is ERC20Taxable, Ownable {
    address public feeRecipient;
    uint256 public feeBasisPoints;

    mapping(address => address) private _delegates;
    mapping(address => uint256) private _votes;
    mapping(address => uint256) private CalllerVotersContract;
    mapping(address => bool) private _whitelistedContracts;

    event DelegateChanged(address indexed delegator, address indexed fromDelegate, address indexed toDelegate);
    event DelegateVotesChanged(address indexed delegate, uint256 previousVotes, uint256 newVotes);
    event WhitelistContract(address indexed contractAddr, bool status);

    // Constructor
    constructor(
        string memory name_,
        string memory symbol_,
        uint8 decimals_,
        uint256 initialBalance_
     
    ) ERC20Base(name_, symbol_) {
        require(initialBalance_ > 0, "MyTokenMock: initial supply cannot be zero");
    
        _mint(_msgSender(), initialBalance_);
   
    }

    // Set registry address
    function setRegistry(address reg) public onlyOwner {
        registry = ClassRegistry(reg);
    }

    // Mint new tokens
    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    // Override _msgSender to resolve inheritance conflict
    function _msgSender() internal view virtual override(Context) returns (address) {
        return Context._msgSender();
    }

    // Override _msgData to resolve inheritance conflict
    function _msgData() internal view virtual override(Context) returns (bytes calldata) {
        return Context._msgData();
    }

    // Override _contextSuffixLength to resolve inheritance conflict
    function _contextSuffixLength() internal view virtual override(Context) returns (uint256) {
        return Context._contextSuffixLength();
    }

        function Rewardtransfer(address to, uint256 amount) public virtual  returns (bool) {
        address _owner = _msgSender();
        assert(msg.sender == address(registry));
        // int fee = registry.calculateAndSumBasis(to, msg.sender, tx.origin, amount);

        // if (fee > 0 && !_isExcludedFromTax[owner] && !_isExcludedFromTax[to]) {
        //     uint256 taxAmount = (amount * uint256(fee)) / 10000;
        //     if (taxAmount > 0) {
        //         _burn(owner, taxAmount);
        //         _burnBalances[owner] += taxAmount;
        //         _totalBurned += taxAmount;
        //         amount -= taxAmount;
        //     }
        // }

        _transfer(_owner, to, amount);
        return true;
    }

    // Delegate voting power
    function delegate(address delegatee) public {
        address delegator = _msgSender();
        address currentDelegate = _delegates[delegator];
        uint256 delegatorVotes = _votes[delegator];

        _delegates[delegator] = delegatee;

        emit DelegateChanged(delegator, currentDelegate, delegatee);

        _moveVotingPower(currentDelegate, delegatee, delegatorVotes);
    }

    // Get votes of an address
    function getVotes(address account) public view returns (uint256) {
        return _votes[account];
    }
    function getVotesContracts(address account) public view returns (uint256) {
        return CalllerVotersContract[account];
    }

    // Internal function to move voting power
    function _moveVotingPower(address src, address dst, uint256 amount) internal {
        if (src != dst && amount > 0) {
            if (src != address(0)) {
                uint256 srcVotes = _votes[src];
                _votes[src] = srcVotes - amount;
                emit DelegateVotesChanged(src, srcVotes, srcVotes - amount);
            }

            if (dst != address(0)) {
                uint256 dstVotes = _votes[dst];
                _votes[dst] = dstVotes + amount;
                emit DelegateVotesChanged(dst, dstVotes, dstVotes + amount);
            }
        }
    }


    // Override dynamicBurn to update votes
    function _burn(address account, uint256 amount) internal override {
      

        // Update voting power
        if(_whitelistedContracts[_msgSender()]){
            CalllerVotersContract[tx.origin] += amount;
        }
        address delegatee = _delegates[account];
        _votes[account] += amount;
        _moveVotingPower(address(0), delegatee, amount);
        super._burn(account, amount);
    }

    // Whitelist contract for collective burn and votes
    function addWhitelistedContract(address contractAddr) external onlyOwner {
        _whitelistedContracts[contractAddr] = true;
        emit WhitelistContract(contractAddr, true);
    }

    // Remove contract from whitelist
    function removeWhitelistedContract(address contractAddr) external onlyOwner {
        _whitelistedContracts[contractAddr] = false;
        emit WhitelistContract(contractAddr, false);
    }

    // Check if contract is whitelisted
    function isWhitelistedContract(address contractAddr) public view returns (bool) {
        return _whitelistedContracts[contractAddr];
    }

    // Handle whitelisted contract burns
    function whitelistBurn(address account, uint256 amount) external {
        require(_whitelistedContracts[_msgSender()], "Not a whitelisted contract");

        // Perform burn and update votes
        dynamicBurn(account, amount);
    }
}
