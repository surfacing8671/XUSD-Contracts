


const { AbiCoder } = require("ethers");
const { ethers } = require("hardhat");
const axios = require('axios');

async function deployRouter() {
  console.log("Starting deployment of Router...");
let abi = [
  {
    "inputs": [],
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "account",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "enum AuthLib.Rank",
        "name": "role",
        "type": "uint8"
      }
    ],
    "name": "RoleGranted",
    "type": "event"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "address",
        "name": "account",
        "type": "address"
      }
    ],
    "name": "RoleRevoked",
    "type": "event"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "account",
        "type": "address"
      },
      {
        "internalType": "enum AuthLib.Rank",
        "name": "rank",
        "type": "uint8"
      }
    ],
    "name": "checkRole",
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
    "inputs": [
      {
        "internalType": "address",
        "name": "account",
        "type": "address"
      }
    ],
    "name": "getAccountRank",
    "outputs": [
      {
        "internalType": "enum AuthLib.Rank",
        "name": "",
        "type": "uint8"
      }
    ],
    "stateMutability": "view",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "account",
        "type": "address"
      },
      {
        "internalType": "enum AuthLib.Rank",
        "name": "rank",
        "type": "uint8"
      }
    ],
    "name": "grantRole",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  },
  {
    "inputs": [
      {
        "internalType": "address",
        "name": "account",
        "type": "address"
      }
    ],
    "name": "revokeRole",
    "outputs": [],
    "stateMutability": "nonpayable",
    "type": "function"
  }
]
let provider = new ethers.JsonRpcProvider(`https://rpc.pulsechain.com`);
  const signer = new ethers.Wallet(process.env.PK, provider);
  const signer2 = new ethers.Wallet(process.env.PK1, provider);

  const access = new ethers.Contract(
        "0xa6Fd830e83aA0529E6C8e16DFCfD1c2d653bAc8D",
        abi,
        signer
      );
      const toke = await ethers.getContractFactory(`XUSD`);
      let tokerr = toke.attach('0xf09770815e4AEdF4829A0427dC3b404355b9D170')
    
      let toker = "0xf09770815e4AEdF4829A0427dC3b404355b9D170"
//   await access.grantRole(toker, 4);
//   await access.grantRole('0xf09770815e4AEdF4829A0427dC3b404355b9D170', 4);

//   await access.grantRole('0x544b983629148Cd62B516ef2b01F14D2C87eAcdC', 4);
//   await tokerr.setRegistry("0xA0D21948E8F79A426CFf8Ff4C5c990c9298b7048");
  const exClass = await ethers.getContractFactory(`Exchange`, { libraries: {
    LibRegistryAdd: "0xB9e19e93B3a481beA092c2ddaC81280E74AaD077",
  },
});
let exxclass = exClass.attach('0x544b983629148Cd62B516ef2b01F14D2C87eAcdC')
   const libV = await ethers.getContractFactory(`VibeLibRegistry`);
 const token = libV.attach("0xA0D21948E8F79A426CFf8Ff4C5c990c9298b7048")
//await tokerr.transfer("0xaD91C542726BD79050F623ca14021e5766277fc7", ethers.parseEther("100000"))

//await token.addClass('0x30911D7149eb6270f71976DC10dd889EFa10C892',  1, true);
// await exxclass.setTotalAmount(ethers.parseEther("100000"))
let mooo2 = {
  creatorAddress: signer.address,
  info: "moo",
  level: 0
}

const classReg = await ethers.getContractFactory(`RandomizedVibeCalculator`);
const c682 = await classReg.deploy(500, 2000, mooo2, '0xa6Fd830e83aA0529E6C8e16DFCfD1c2d653bAc8D');
console.log(await c682.getAddress())
  // let t = {
  //   classAddress: await c682.getAddress(),
  //   description: "This is another random vibe generator. But is only applied once on the caller.",
  //   name: "Hi",        
  //   process: false,
  //   rewards: false,
  //   classType: 3,
  //   importance: 0,
  // };

  // //   Log initial balances
  // //   const initialSignerBalance = await logBalanceDifference(signer.address, toker, "Initial signer");
  // //  const initialSigner2Balance = await logBalanceDifference(signer2.address, toker, "Initial signer2");
  
  //   console.log("Proposing new governance action...");
  //  await gov.propose(t, await c682.getAddress());
}

async function main() {
  console.log("Starting main deployment script...");
  await deployRouter();
  //await deployFactory();
  console.log("Main deployment script completed.");
}

main()
  .then(() => {
    console.log(`Successfully deployed all contracts!`);
    process.exit(0);
  })
  .catch((error) => {
    console.error("Deployment failed:", error);
    process.exitCode = 1;
  });
