const hre = require("hardhat");

async function main() {

  // We get the contract to deploy
  const HelloNFT = await hre.ethers.getContractFactory("HelloNFT");
  const helloNFT = await HelloNFT.deploy();
  await helloNFT.deployed();

  console.log("HelloNFT deployed to:", helloNFT.address);

  // this is my address which I will transfer the NFT to.
  const address_to = '0x9e01B1C3e6642015141E7A3A0476040188c6D24d';

  // calls the mintToken function form our contract
  await helloNFT.mintToken();

  // calls the transferToken function from our contract
  await helloNFT.transferToken(address_to, 1);
  // this sends the minted NFT to the receiver's address.
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
