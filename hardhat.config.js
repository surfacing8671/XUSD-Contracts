require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-ignition-ethers");
require('@openzeppelin/hardhat-upgrades');
 require('@primitivefi/hardhat-dodoc');
require('dotenv').config()
require('@primitivefi/hardhat-marmite');
/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
 
solidity: {
    compilers: [
      {
        version:  "0.6.6",
      },
      {
        version: "0.8.26",
        
      },
    ],
  },
  settings: {
    optimizer: {
      enabled: true,
      runs: 1000,
    },
   
  },
  networks: {
    pulsechain: {
      url:  `http://127.0.0.1:8545/`,
      accounts: [process.env.PK],
     
    },
    
  },
  etherscan: {
    apiKey: {

        "polygon-mainnet": "TUCW8DV1FFPPUYFJRVBMNKQM69IU7CWYHF" || ``,
        
    },
},
  
};
