require("@nomicfoundation/hardhat-toolbox");
require("@nomicfoundation/hardhat-ignition-ethers");
require('@openzeppelin/hardhat-upgrades');
require('@primitivefi/hardhat-dodoc');
require('dotenv').config()

/** @type import('hardhat/config').HardhatUserConfig */
module.exports = {
  solidity: "0.8.26",
  settings: {
    optimizer: {
      enabled: true,
      runs: 1000,
    },
    viaIR:
    {enabled: true}
  },
  networks: {
    pulsechain: {
      url:  `http://127.0.0.1:8545/`,
      accounts: [process.env.PK],
     
    },
    
  },
  
};
