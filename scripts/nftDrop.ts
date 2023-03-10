
import { ethers, run } from "hardhat";
import * as dotenv from 'dotenv' ;
dotenv.config()
// const { baseURI,royalityFee,artist } = require("../constants");


async function main() {
  // Address of the whitelist constract that you deployed in the previous module
  // const whitelistContract = WHITELIST_CONTRACT_ADDRESS;
  // URL from where we cna extract the metadata for a Crypto Dev NFT
  // const metadataURL = METADATA_URL;

  // A ContractFactory in ethers.js is an abstraction used to deploy new smart contracts,
  // so nftContract here is a factory for instances of our nft contracts
  const nftDropContract = await ethers.getContractFactory("nftDrop");

  // deploy the contracts
  const deployednftDropContract = await nftDropContract.deploy(
      
  );
  
  await deployednftDropContract.deployed();
  
  // print the address of the deployed contract
  console.log(
  "NFT Collection Address:"
  ,deployednftDropContract.address
    );
  
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
