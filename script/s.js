const { AbiCoder } = require("ethers");
const { ethers } = require("hardhat");
const axios = require('axios');
/*
 If you have contracts with similar byte-codes, you can use the scripts in this format for verification
 npx hardhat verify --network <network-name> <contract-address> --contract "contracts/Tokens/TokenETH.sol:TokenETH(contract file path)" 
 */
 let arc20Abi = [
      {
        anonymous: false,
        inputs: [
          {
            indexed: true,
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            indexed: true,
            internalType: "address",
            name: "spender",
            type: "address",
          },
          {
            indexed: false,
            internalType: "uint256",
            name: "value",
            type: "uint256",
          },
        ],
        name: "Approval",
        type: "event",
      },
      {
        anonymous: false,
        inputs: [
          {
            indexed: true,
            internalType: "address",
            name: "from",
            type: "address",
          },
          {
            indexed: true,
            internalType: "address",
            name: "to",
            type: "address",
          },
          {
            indexed: false,
            internalType: "uint256",
            name: "value",
            type: "uint256",
          },
        ],
        name: "Transfer",
        type: "event",
      },
      {
        inputs: [
          {
            internalType: "address",
            name: "owner",
            type: "address",
          },
          {
            internalType: "address",
            name: "spender",
            type: "address",
          },
        ],
        name: "allowance",
        outputs: [
          {
            internalType: "uint256",
            name: "",
            type: "uint256",
          },
        ],
        stateMutability: "view",
        type: "function",
      },
      {
        inputs: [
          {
            internalType: "address",
            name: "spender",
            type: "address",
          },
          {
            internalType: "uint256",
            name: "value",
            type: "uint256",
          },
        ],
        name: "approve",
        outputs: [
          {
            internalType: "bool",
            name: "",
            type: "bool",
          },
        ],
        stateMutability: "nonpayable",
        type: "function",
      },
      {
        inputs: [
          {
            internalType: "address",
            name: "account",
            type: "address",
          },
        ],
        name: "balanceOf",
        outputs: [
          {
            internalType: "uint256",
            name: "",
            type: "uint256",
          },
        ],
        stateMutability: "view",
        type: "function",
      },
      {
        inputs: [],
        name: "totalSupply",
        outputs: [
          {
            internalType: "uint256",
            name: "",
            type: "uint256",
          },
        ],
        stateMutability: "view",
        type: "function",
      },
      {
        inputs: [
          {
            internalType: "address",
            name: "to",
            type: "address",
          },
          {
            internalType: "uint256",
            name: "value",
            type: "uint256",
          },
        ],
        name: "transfer",
        outputs: [
          {
            internalType: "bool",
            name: "",
            type: "bool",
          },
        ],
        stateMutability: "nonpayable",
        type: "function",
      },
      {
        inputs: [
          {
            internalType: "address",
            name: "from",
            type: "address",
          },
          {
            internalType: "address",
            name: "to",
            type: "address",
          },
          {
            internalType: "uint256",
            name: "value",
            type: "uint256",
          },
        ],
        name: "transferFrom",
        outputs: [
          {
            internalType: "bool",
            name: "",
            type: "bool",
          },
        ],
        stateMutability: "nonpayable",
        type: "function",
      },
    ];
  
    let litAbi = [
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "_oneSwap",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "classReg",
            "type": "address"
          }
        ],
        "stateMutability": "nonpayable",
        "type": "constructor"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "sender",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          },
          {
            "internalType": "address",
            "name": "owner",
            "type": "address"
          }
        ],
        "name": "ERC721IncorrectOwner",
        "type": "error"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "operator",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          }
        ],
        "name": "ERC721InsufficientApproval",
        "type": "error"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "approver",
            "type": "address"
          }
        ],
        "name": "ERC721InvalidApprover",
        "type": "error"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "operator",
            "type": "address"
          }
        ],
        "name": "ERC721InvalidOperator",
        "type": "error"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "owner",
            "type": "address"
          }
        ],
        "name": "ERC721InvalidOwner",
        "type": "error"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "receiver",
            "type": "address"
          }
        ],
        "name": "ERC721InvalidReceiver",
        "type": "error"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "sender",
            "type": "address"
          }
        ],
        "name": "ERC721InvalidSender",
        "type": "error"
      },
      {
        "inputs": [
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          }
        ],
        "name": "ERC721NonexistentToken",
        "type": "error"
      },
      {
        "inputs": [],
        "name": "LitPassAlreadyMinted",
        "type": "error"
      },
      {
        "inputs": [],
        "name": "LitPassCanOnlyHoldOne",
        "type": "error"
      },
      {
        "inputs": [],
        "name": "LitPassDelegated",
        "type": "error"
      },
      {
        "inputs": [],
        "name": "LitPassNonExistant",
        "type": "error"
      },
      {
        "inputs": [],
        "name": "LitPassNotDelegated",
        "type": "error"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "owner",
            "type": "address"
          }
        ],
        "name": "OwnableInvalidOwner",
        "type": "error"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "account",
            "type": "address"
          }
        ],
        "name": "OwnableUnauthorizedAccount",
        "type": "error"
      },
      {
        "inputs": [],
        "name": "UserDoesNotOwnLitPassId",
        "type": "error"
      },
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": true,
            "internalType": "address",
            "name": "owner",
            "type": "address"
          },
          {
            "indexed": true,
            "internalType": "address",
            "name": "approved",
            "type": "address"
          },
          {
            "indexed": true,
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          }
        ],
        "name": "Approval",
        "type": "event"
      },
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": true,
            "internalType": "address",
            "name": "owner",
            "type": "address"
          },
          {
            "indexed": true,
            "internalType": "address",
            "name": "operator",
            "type": "address"
          },
          {
            "indexed": false,
            "internalType": "bool",
            "name": "approved",
            "type": "bool"
          }
        ],
        "name": "ApprovalForAll",
        "type": "event"
      },
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": false,
            "internalType": "uint256",
            "name": "_fromTokenId",
            "type": "uint256"
          },
          {
            "indexed": false,
            "internalType": "uint256",
            "name": "_toTokenId",
            "type": "uint256"
          }
        ],
        "name": "BatchMetadataUpdate",
        "type": "event"
      },
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": false,
            "internalType": "uint256",
            "name": "_tokenId",
            "type": "uint256"
          }
        ],
        "name": "MetadataUpdate",
        "type": "event"
      },
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": true,
            "internalType": "address",
            "name": "previousOwner",
            "type": "address"
          },
          {
            "indexed": true,
            "internalType": "address",
            "name": "newOwner",
            "type": "address"
          }
        ],
        "name": "OwnershipTransferred",
        "type": "event"
      },
      {
        "anonymous": false,
        "inputs": [
          {
            "indexed": true,
            "internalType": "address",
            "name": "from",
            "type": "address"
          },
          {
            "indexed": true,
            "internalType": "address",
            "name": "to",
            "type": "address"
          },
          {
            "indexed": true,
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          }
        ],
        "name": "Transfer",
        "type": "event"
      },
      {
        "inputs": [
          {
            "internalType": "uint256",
            "name": "i",
            "type": "uint256"
          }
        ],
        "name": "GetNftByIndexHash",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "to",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          }
        ],
        "name": "approve",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "owner",
            "type": "address"
          }
        ],
        "name": "balanceOf",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "user",
            "type": "address"
          }
        ],
        "name": "calculateBurn",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "user",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "number",
            "type": "uint256"
          }
        ],
        "name": "calculateTriHash",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          }
        ],
        "name": "getApproved",
        "outputs": [
          {
            "internalType": "address",
            "name": "",
            "type": "address"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "user",
            "type": "address"
          }
        ],
        "name": "getIdFromOwner",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          }
        ],
        "name": "getOwner",
        "outputs": [
          {
            "internalType": "address",
            "name": "",
            "type": "address"
          }
        ],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "user",
            "type": "address"
          }
        ],
        "name": "getProtocolBurn",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "user",
            "type": "address"
          }
        ],
        "name": "getUserBurns",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "user",
            "type": "address"
          }
        ],
        "name": "hasLitPass",
        "outputs": [
          {
            "internalType": "bool",
            "name": "",
            "type": "bool"
          }
        ],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "owner",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "operator",
            "type": "address"
          }
        ],
        "name": "isApprovedForAll",
        "outputs": [
          {
            "internalType": "bool",
            "name": "",
            "type": "bool"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "mintPass",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "name",
        "outputs": [
          {
            "internalType": "string",
            "name": "",
            "type": "string"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "oneSwap",
        "outputs": [
          {
            "internalType": "address",
            "name": "",
            "type": "address"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "owner",
        "outputs": [
          {
            "internalType": "address",
            "name": "",
            "type": "address"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          }
        ],
        "name": "ownerOf",
        "outputs": [
          {
            "internalType": "address",
            "name": "",
            "type": "address"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "purchaseAmount",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "renounceOwnership",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "from",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "to",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          }
        ],
        "name": "safeTransferFrom",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "from",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "to",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          },
          {
            "internalType": "bytes",
            "name": "data",
            "type": "bytes"
          }
        ],
        "name": "safeTransferFrom",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "operator",
            "type": "address"
          },
          {
            "internalType": "bool",
            "name": "approved",
            "type": "bool"
          }
        ],
        "name": "setApprovalForAll",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "uint256",
            "name": "amount",
            "type": "uint256"
          }
        ],
        "name": "setPurchaseAmount",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "registry",
            "type": "address"
          }
        ],
        "name": "setRegistry",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "user",
            "type": "address"
          },
          {
            "internalType": "string",
            "name": "userName",
            "type": "string"
          }
        ],
        "name": "setUserName",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "_xusd",
            "type": "address"
          }
        ],
        "name": "setXusd",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "bytes4",
            "name": "interfaceId",
            "type": "bytes4"
          }
        ],
        "name": "supportsInterface",
        "outputs": [
          {
            "internalType": "bool",
            "name": "",
            "type": "bool"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "symbol",
        "outputs": [
          {
            "internalType": "string",
            "name": "",
            "type": "string"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          }
        ],
        "name": "tokenURI",
        "outputs": [
          {
            "internalType": "string",
            "name": "",
            "type": "string"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "from",
            "type": "address"
          },
          {
            "internalType": "address",
            "name": "to",
            "type": "address"
          },
          {
            "internalType": "uint256",
            "name": "tokenId",
            "type": "uint256"
          }
        ],
        "name": "transferFrom",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "newOwner",
            "type": "address"
          }
        ],
        "name": "transferOwnership",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "user",
            "type": "address"
          }
        ],
        "name": "viewTotalBurn",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "user",
            "type": "address"
          }
        ],
        "name": "viewUrl",
        "outputs": [
          {
            "internalType": "string",
            "name": "",
            "type": "string"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "user",
            "type": "address"
          }
        ],
        "name": "viewUserBurns",
        "outputs": [
          {
            "internalType": "uint256",
            "name": "",
            "type": "uint256"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [
          {
            "internalType": "address",
            "name": "user",
            "type": "address"
          }
        ],
        "name": "viewUserName",
        "outputs": [
          {
            "internalType": "string",
            "name": "",
            "type": "string"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      },
      {
        "inputs": [],
        "name": "xusd",
        "outputs": [
          {
            "internalType": "address",
            "name": "",
            "type": "address"
          }
        ],
        "stateMutability": "view",
        "type": "function"
      }
    ]
let abi = [
  {
    inputs: [
      {
        internalType: "address",
        name: "_factory",
        type: "address",
      },
      {
        internalType: "address",
        name: "_WPLS",
        type: "address",
      },
    ],
    type: "constructor",
  },
  {
    inputs: [],
    name: "WPLS",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "tokenA",
        type: "address",
      },
      {
        internalType: "address",
        name: "tokenB",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "amountADesired",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountBDesired",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountAMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountBMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "addLiquidity",
    outputs: [
      {
        internalType: "uint256",
        name: "amountA",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountB",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "token",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "amountTokenDesired",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountTokenMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETHMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "addLiquidityETH",
    outputs: [
      {
        internalType: "uint256",
        name: "amountToken",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETH",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
    ],
    stateMutability: "payable",
    type: "function",
  },
  {
    inputs: [],
    name: "factory",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveOut",
        type: "uint256",
      },
    ],
    name: "getAmountIn",
    outputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
    ],
    stateMutability: "pure",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveOut",
        type: "uint256",
      },
    ],
    name: "getAmountOut",
    outputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
    ],
    stateMutability: "pure",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
    ],
    name: "getAmountsIn",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
    ],
    name: "getAmountsOut",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountA",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveA",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveB",
        type: "uint256",
      },
    ],
    name: "quote",
    outputs: [
      {
        internalType: "uint256",
        name: "amountB",
        type: "uint256",
      },
    ],
    stateMutability: "pure",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "tokenA",
        type: "address",
      },
      {
        internalType: "address",
        name: "tokenB",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountAMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountBMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "removeLiquidity",
    outputs: [
      {
        internalType: "uint256",
        name: "amountA",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountB",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "token",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountTokenMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETHMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "removeLiquidityETH",
    outputs: [
      {
        internalType: "uint256",
        name: "amountToken",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETH",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "token",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountTokenMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETHMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "removeLiquidityETHSupportingFeeOnTransferTokens",
    outputs: [
      {
        internalType: "uint256",
        name: "amountETH",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "token",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountTokenMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETHMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
      {
        internalType: "bool",
        name: "approveMax",
        type: "bool",
      },
      {
        internalType: "uint8",
        name: "v",
        type: "uint8",
      },
      {
        internalType: "bytes32",
        name: "r",
        type: "bytes32",
      },
      {
        internalType: "bytes32",
        name: "s",
        type: "bytes32",
      },
    ],
    name: "removeLiquidityETHWithPermit",
    outputs: [
      {
        internalType: "uint256",
        name: "amountToken",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETH",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "token",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountTokenMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETHMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
      {
        internalType: "bool",
        name: "approveMax",
        type: "bool",
      },
      {
        internalType: "uint8",
        name: "v",
        type: "uint8",
      },
      {
        internalType: "bytes32",
        name: "r",
        type: "bytes32",
      },
      {
        internalType: "bytes32",
        name: "s",
        type: "bytes32",
      },
    ],
    name: "removeLiquidityETHWithPermitSupportingFeeOnTransferTokens",
    outputs: [
      {
        internalType: "uint256",
        name: "amountETH",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "tokenA",
        type: "address",
      },
      {
        internalType: "address",
        name: "tokenB",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountAMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountBMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
      {
        internalType: "bool",
        name: "approveMax",
        type: "bool",
      },
      {
        internalType: "uint8",
        name: "v",
        type: "uint8",
      },
      {
        internalType: "bytes32",
        name: "r",
        type: "bytes32",
      },
      {
        internalType: "bytes32",
        name: "s",
        type: "bytes32",
      },
    ],
    name: "removeLiquidityWithPermit",
    outputs: [
      {
        internalType: "uint256",
        name: "amountA",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountB",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapETHForExactTokens",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "payable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactETHForTokens",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "payable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactETHForTokensSupportingFeeOnTransferTokens",
    outputs: [],
    stateMutability: "payable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactTokensForETH",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactTokensForETHSupportingFeeOnTransferTokens",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactTokensForTokens",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactTokensForTokensSupportingFeeOnTransferTokens",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountInMax",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapTokensForExactETH",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountInMax",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapTokensForExactTokens",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    type: "receive",
  },
];
// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
async function deployRouter() {
  let privider = new ethers.JsonRpcProvider(`http://127.0.0.1:8545/`);


  // let g = await axios.get("https://api.scan.pulsechain.com/api/v2/addresses/0x84D55D12384653d9e701F8eb74C60Ee9140A67b5/token-balances")


  // console.log(g.data[0].value)
  const signer = new ethers.Wallet(process.env.PK, privider);
  const signer2 = new ethers.Wallet(process.env.PK1, privider);
  // const signer3 = new ethers.Wallet(process.env.PK2, privider);






let lib2, lib3, class1, class2, toke, lib2C, lib3C, toker, big, class3, Token, token, userClass3;
let owner,   router2;
let nonce = 0;


const token2 = new ethers.Contract(
  "0xA1077a294dDE1B09bB078844df40758a5D0f9a27",
  arc20Abi,
  signer
);
const token22 = new ethers.Contract(
  "0xA1077a294dDE1B09bB078844df40758a5D0f9a27",
  arc20Abi,
  signer2
);

   // [owner, signer2] = await ethers.getSigners();

    // Deploy libraries and contracts
    lib2 = await ethers.getContractFactory("LibRegistry");
    lib3 = await ethers.getContractFactory("AtropaMath");
    class1 = await ethers.getContractFactory("FlatRateTaxCalculator");
    class2 = await ethers.getContractFactory("TimeBasedTaxCalculator");
    toke = await ethers.getContractFactory("MyTokenMock");

    lib2C = await lib2.deploy();
    lib3C = await lib3.deploy();

    toker = await toke.deploy("d", "d", "18", "1000000000000000000000000000000", );

    big = await class1.deploy("1000", );

    class3 = await ethers.getContractFactory("StakingIncentiveTaxCalculator", {
        libraries: {
            AtropaMath: await lib3C.getAddress(),
            LibRegistry: await lib2C.getAddress(),
        },
    });

    Token = await ethers.getContractFactory("ClassRegistry", {
        libraries: {
            AtropaMath: await lib3C.getAddress(),
            LibRegistry: await lib2C.getAddress(),
        },
    });

    token = await Token.deploy();
    userClass3 = await class3.deploy(signer.address, signer2.address, "-300", "6000", );

    // Setup
    await toker.setRegistry(await token.getAddress());
    await token.setWhitelistedClassToFee(await big.getAddress(), true);
  //  await token.setWhitelistedClassContractFee(await userClass3.getAddress(), true);
 //   await token.recalculateFees();

    // Assume router and router2 are already deployed, or deploy mocks if necessary
   

    async function performSwap( path, amountIn) {

      await toker.approve(
      "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
      ethers.parseEther("10000000000000000000000000000000000000000"),
      {
   
      }
    );
    await token2.approve(
      "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
      ethers.parseEther("10000000000000000000000000000000000000000"),
      {
      
      }
    );

    const router = new ethers.Contract(
      "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
      abi,
      signer
    );
          const balanceBefore = await toker.balanceOf(signer.address);
  console.log(balanceBefore)
          await router.swapExactTokensForTokensSupportingFeeOnTransferTokens( ethers.parseEther("430000"), "0", [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f", "9999999999999999999999999")
          const balanceAfter = await toker.balanceOf(signer.address);
          const feeCharged = balanceBefore.sub(balanceAfter);
          const feePercentage = feeCharged.mul(100).div(balanceBefore);
  
          console.log(`Balance Before: ${ethers.formatEther(balanceBefore)} tokens`);
          console.log(`Balance After: ${ethers.formatEther(balanceAfter)} tokens`);
          console.log(`Fee Charged: ${ethers.formatEther(feeCharged)} tokens`);
          console.log(`Fee Percentage: ${feePercentage.toString()}%`);
          console.log('--------------------------------------');
      }
  
    await performSwap( [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"],  ethers.parseEther("10000"));
      await performSwap( ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await toker.getAddress()],  ethers.parseEther("10"));
      
    // await toker.trans


  //   "0x321300E6897B21c096D83d14Aaf84C39AAf76d96",
  //   ethers.parseEther("100"),
  //   {
  //     nonce: nonce++,
  //   }
  // );
//await classReg1.proposeClass(await userClass2.getAddress(), {     nonce: nonce++,});

  //await nft.turnOnDelegate(1n,  { nonce: nonce2++});
  // await classReg1.voteClass(
  //   await userClass2.getAddress(),
  //   "0x1bed8319ad56780f303b226bfca60bad29db9e66",
  //   
  // );
  // console.log(await classReg1.getActiveClassTax());
  // console.log(await classReg1.getTotalProposals());
  //await nft.delegateNft("0x1bed8319ad56780f303b226bfca60bad29db9e66", 2n, 1n, { nonce: nonce2++})

  // await router.addLiquidityETH(
  //   await toker.getAddress(),
  //   ethers.parseEther("100000000"),
  //   "1",
  //   "1",
  //   "0x1bed8319ad56780f303b226bfca60bad29db9e66",
  //   "999999999999999999999",
  //   { value: ethers.parseEther("100"), nonce: nonce++ }
  // );

//   await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther("4300"),
//     "0",
//     [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"],
//     "0x1bed8319ad56780f303b226bfca60bad29db9e66",
//     "9999999999999999999999999",
//     {
//       nonce: nonce++,
//     }
//   );
//   console.log(
//     await token22.balanceOf("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")
//   );
//   await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther(".00001"),
//     "0",
//     ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await toker.getAddress()],
//     "0x1bed8319ad56780f303b226bfca60bad29db9e66",
//     "9999999999999999999999999",
//     {
//       nonce: nonce++,
//     }
//   );
//   console.log(
//     await toker.balanceOf("0x1bed8319ad56780f303b226bfca60bad29db9e66")
//   );

//   console.log(
//     await toker.balanceOf("0x46dfF191646bA20453c6F6D9C7ff60431C17f07B")
//   );
//   await toker.transfer(
//     "0x46dfF191646bA20453c6F6D9C7ff60431C17f07B",
//     ethers.parseEther("1000"),
//     {
//       nonce: nonce++,
//     }
//   );
//   console.log(
//     await toker.balanceOf("0x46dfF191646bA20453c6F6D9C7ff60431C17f07B")
//   );
//   await tokenX.transfer(
//     "0x46dfF191646bA20453c6F6D9C7ff60431C17f07B",
//     ethers.parseEther("1000"),
//     {
//       nonce: nonce2++,
//     }
//   );
//   console.log(
//     await toker.balanceOf("0x46dfF191646bA20453c6F6D9C7ff60431C17f07B")
//   );
//   console.log(
//     await toker.balanceOf("0x1bed8319ad56780f303b226bfca60bad29db9e66")
//   );
//   // console.log(await token22.balanceOf('0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f'))
//   await tokenX.approve(
//     "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
//     ethers.parseEther("10000000000000000000000000"),
//     { nonce: nonce2++ }
//   );
//   await token22.approve(
//     "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
//     ethers.parseEther("10000000000000000000000000"),
//     { nonce: nonce2++ }
//   );
//   await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther("430000"),
//     "0",
//     [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"],
//     "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f",
//     "9999999999999999999999999",
//     {
//       nonce: nonce2++,
//     }
//   );
//   console.log(
//     await token22.balanceOf("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")
//   );
//   await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther(".00001"),
//     "0",
//     ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await toker.getAddress()],
//     "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f",
//     "9999999999999999999999999",
//     {
//       nonce: nonce2++,
//     }
//   );



//   console.log(await classReg1.getActiveClassTax());
//   // try{
//   //     await lit.mintPass({ nonce: nonce++})
//   // } catch(e){
//   //     console.log(e)
//   // }
//   // console.log(await lit.calculateBurn.staticCall(1n))

//   console.log(
//     await lit.getIdFromOwner("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")
//   );

  // console.log(await lit.calculateBurn.staticCall(1n))
  // console.log(await nft.calculateBurn.staticCall(2n))
  // console.log(await classReg1.getProposed((await userClass1.getAddress())))
  // await classReg1.voteClass(await userClass1.getAddress(), "0x295929A981426148Cd4085d7e2e129e51DCEa84C", { nonce: nonce++})
  // console.log(await classReg1.getProposed((await userClass2.getAddress())))
  // console.log(await classReg1.getClass((await userClass2.getAddress())))
  // //await classReg1.updateUser("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")

  // // await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens( ethers.parseEther("430000"), "0", [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f", "9999999999999999999999999", {
  // //     nonce: nonce2++
  // //  })
  // //  console.log(await token22.balanceOf('0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f'))
  // //  await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(  ethers.parseEther(".00001"), "0", ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await toker.getAddress(), ], "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f", "9999999999999999999999999", {
  // //      nonce: nonce2++
  // //  })

  // //  console.log(await token.getProposed((await userClass1.getAddress())))
  // // console.log(await token.GetAccessPower(("0x1bed8319ad56780f303b226bfca60bad29db9e66")))
  // // console.log(await userClass1.getNote())
  // // //console.log(await lit.getOwner(5n))
  // // // //     // console.log(await token.classList[await class1T.getAddress()])
  // // // // console.log(g)
  // // // // console.log(await token.classesShow())
  // // //    //await token.addClassToUser(await class1T.getAddress(), "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66")
  // // //  await token.setFees("transferFrom(address,address,uint256)", [await class1T.getAddress(), await class1T2.getAddress()], [-100, 200])

  // // //  //console.log(await token.getClassFee(await class1T.getAddress(), await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)")))
  // // // //  let sel = await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)")
  // //console.log(await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)"))
  //  console.log(await token.processTransaction.staticCall("0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x165C3410fC91EF562C50559f7d2289fEbed552d9", "0x165C3410fC91EF562C50559f7d2289fEbed552d9", "0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x23b872dd"))
  // // // console.log(sel)
  // // //  let g = await token.getClassFee(await class1T.getAddress(), '0x23b872dd')
  // //     console.log(g);
  // await token.addClassToUser("0x1bed8319ad56780f303b226bfca60bad29db9e66", await class1T2.getAddress())
  // console.log(await token.getUser("0x1bed8319ad56780f303b226bfca60bad29db9e66"))

  //await token.processTransaction("0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x850AeAfCaEd8f7CF409843840Cb8c4C6146AC04C", await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)"))

  // console.log(await token.processTransaction.staticCall("0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x850AeAfCaEd8f7CF409843840Cb8c4C6146AC04C", await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)")))
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
async function deployFactory() {
  const Token = await ethers.getContractFactory(`SniperWalletFactory`);
  const token = await Token.deploy(666);
  console.log(`deployed to: `, token.address);
}

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
async function main() {
  // run the scripts one by one
  await deployRouter();
  //await deployFactory();

  // await deployBridgeContracts("BridgeETH", process.env.ETK_Address!);
  // await deployBridgeContracts("BridgeBSC", process.env.BTK_Address!);
}

main()
  .then(() => {
    console.log(`Successfully deployed all contracts!`);
    // eslint-disable-next-line no-process-exit
    process.exit(0);
  })
  .catch((error) => {
    console.error(error);
    process.exitCode = 1;
  });
