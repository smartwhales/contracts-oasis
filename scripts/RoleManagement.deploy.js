const { ethers } = require("hardhat");
require('dotenv').config();

async function main() {
  const {
    SUPER_ADMIN_ADDRESS
  } = process.env;

  const [deployer] = await ethers.getSigners();
  console.log("Deployer address", deployer.address)

  // Loading the RoleManagement contract before deploying.
  const RoleManagement = await ethers.getContractFactory("RoleManagement");

  //  Deploy role management contract
  const roleManagementContract = await RoleManagement.deploy(SUPER_ADMIN_ADDRESS);

  // Print the addresses
  console.log(
    "RoleManagement contract is deployed successfully.",
    "\n",
    "Contract address",
    roleManagementContract.target
  );
}

main().then(() => process.exit(0)).catch(error => {
  console.error(error);
  process.exit(1);
});