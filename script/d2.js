const { AbiCoder } = require("ethers");
const { ethers } = require("hardhat");


async function deployRouter() {
  let privider = new ethers.JsonRpcProvider(`http://127.0.0.1:8545/`);

  // const signer = new ethers.Wallet(process.env.PK, privider);
  
  const class21 = await ethers.getContractFactory(`moo2`);
  const token = await class21.deploy();

  console.log(await token.calcBasisForUser())


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
