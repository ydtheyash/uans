const hre = require("hardhat");

async function main() {

  const hm = await hre.ethers.getContractFactory("Uans");
  const contract = await hm.deploy("ETH",2,"0xA9CC7C358Bfa3FA6CEE4231F975eFc4EbD505538",33);
  console.log(contract.target);
  
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});

