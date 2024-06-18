const { ethers } = require("hardhat");
require('dotenv').config();

async function deploy() {
  const {
   ROLE_MANAGEMENT_CONTRACT, 
   MESSAGE_BUS
  } = process.env;

  const [deployer] = await ethers.getSigners();
  console.log("Deployer address", deployer.address)

  // Loading the Messaging contract before deploying.
  const Messaging = await ethers.getContractFactory("Messaging");

  // Deploy Messaging contract.
  const messagingContract = await Messaging.deploy(MESSAGE_BUS,ROLE_MANAGEMENT_CONTRACT)

  // Print the addresses
  console.log(
    "Messaging  contract is deployed successfully.",
    "\n",
    "Contract address:",
    messagingContract.target,
  );
}

deploy().then(() => process.exit(0)).catch(error => {
  console.error(error);
  process.exit(1);
});