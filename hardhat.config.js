require("@nomicfoundation/hardhat-toolbox");
require('dotenv').config();

module.exports = {
  networks:{
    sapphire: {
      url: process.env.RPC_URL,
      accounts:[process.env.DEPLOYER_PRIVATE_KEY]
      },
  },
  etherscan: {
    // This will used to verify the contract
    apiKey: process.env.API_KEY
  },
  solidity: {
    version: "0.8.20",
    settings: {
      optimizer: {
        enabled: true,
        runs: 200
      }
    }
  }
}
