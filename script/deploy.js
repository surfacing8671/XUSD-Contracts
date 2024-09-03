const { AbiCoder } = require("ethers");
const { ethers } = require("hardhat");
const axios = require('axios');

async function deployRouter() {
  console.log("Starting deployment of Router...");

  let provider = new ethers.JsonRpcProvider(`http://127.0.0.1:8545/`);
  const signer = new ethers.Wallet(process.env.PK, provider);
  const signer2 = new ethers.Wallet(process.env.PK1, provider);

  console.log("Signers initialized.");
  
  const lib2 = await ethers.getContractFactory(`LibRegistry`);
  const lib3 = await ethers.getContractFactory(`AtropaMath`);
  const libV = await ethers.getContractFactory(`VibeLibRegistry`);
  const libe2 = await ethers.getContractFactory(`LibRegistryAdd`);
  const toke = await ethers.getContractFactory(`XUSD`);

  console.log("Contract factories created.");

  const lib22C = await libe2.deploy({maxFeePerGas: 307890370973333n});
  console.log(`LibRegistryAdd deployed at: ${await lib22C.getAddress()}`);
  const libVC = await libV.deploy();
  const lib2C = await lib2.deploy();
  console.log(`LibRegistry deployed at: ${await lib2C.getAddress()}`);

  const lib3C = await lib3.deploy();
  console.log(`AtropaMath deployed at: ${await lib3C.getAddress()}`);

  const lib5 = await ethers.getContractFactory(`HierarchicalAccessControl`);
  const access = await lib5.deploy();
  console.log(`HierarchicalAccessControl deployed at: ${await access.getAddress()}`);

  const class29 = await ethers.getContractFactory(`Reward`);
  const class53 = await ethers.getContractFactory(`MyGovernor`, {
    libraries: {
      LibRegistryAdd: await lib22C.getAddress(),
    },
  });
  
  const class3 = await ethers.getContractFactory(`PriceSlowDecay`);
  const Token = await ethers.getContractFactory(`VibeRegistry`, {
    libraries: {AtropaMath : await lib3C.getAddress(),
      LibRegistry: await lib2C.getAddress(),
      VibeLibRegistry: await libVC.getAddress()

    },
  });
  const exClass = await ethers.getContractFactory(`Exchange`);

  console.log("Deploying XUSD...");
  const toker = await toke.deploy("f", "f","18", "10000000000000000000000000000000", await access.getAddress());
  console.log(`XUSD deployed at: ${await toker.getAddress()}`);

  await access.assignRank(await toker.getAddress(), 4);
  console.log("Access rank assigned to XUSD.");

  const token = await Token.deploy(await access.getAddress(), await toker.getAddress());
  console.log(`ClassRegistry deployed at: ${await token.getAddress()}`);

  await access.assignRank(await token.getAddress(), 4);
  console.log("Access rank assigned to ClassRegistry.");
  let moo5o = {
    creatorAddress: signer.address,
    info: "moo",
    level: 0
  }
 const reward = await class29.deploy(await toker.getAddress());
 console.log(await reward.getAddress())
 await toker.setRegistry(await token.getAddress());
 await toker.transfer(await reward.getAddress(), ethers.parseEther("100000"));
  console.log(`GenesisRewardsModule deployed at: ${await reward.getAddress()}`);
 const exxclass =  await exClass.deploy(await access.getAddress(), await toker.getAddress(), await reward.getAddress(), moo5o)
  await reward.setExchangeContract(await exxclass.getAddress())
  await exxclass.addToWhiteListAdmin(signer.address)
  console.log("XUSD registry set.");
  // await toker.transfer(signer2.address, ethers.parseEther("100"));
  // await toker.transfer(signer2.address, ethers.parseEther("100"));
  // await toker.transfer(signer2.address, ethers.parseEther("100"));
  const NFT = await ethers.getContractFactory(`VibePass`, {
    libraries: {
      LibRegistry: await lib2C.getAddress(),
    },
  });

  console.log("Deploying contracts and executing interactions...");
  const c5 = await class3.deploy(ethers.parseEther("100"), ethers.parseEther("1"), 300);
  console.log(`PriceSlowDecay deployed at: ${await c5.getAddress()}`);

  const classReg = await ethers.getContractFactory(`RandomizedVibeCalculator`);
  const lit = await NFT.deploy(
    "0xEb14f3192A37ad2501F3BF6627C565e6799aD661", 
    await access.getAddress(), 
    await toker.getAddress(), 
    await c5.getAddress()
  );
  console.log(`VibePass deployed at: ${await lit.getAddress()}`);

  let gov = await class53.deploy(await access.getAddress(), await lit.getAddress(), await token.getAddress());
  console.log(`MyGovernor deployed at: ${await gov.getAddress()}`);



let mooo = {
  creatorAddress: signer.address,
  info: "moo",
  level: 1
}

let mooo2 = {
  creatorAddress: signer.address,
  info: "moo",
  level: 0
}

 const c6 = await classReg.deploy(500, 2000, mooo, await access.getAddress());
 const c62 = await classReg.deploy(500, 2000, mooo2, await access.getAddress());
 const c362 = await classReg.deploy(500, 2000, mooo2, await access.getAddress());
//  const c762 = await classReg.deploy(500, 2000, mooo2, await access.getAddress());
//  const c682 = await classReg.deploy(500, 2000, mooo2, await access.getAddress());
  console.log(`RandomizedTaxCalculator deployed at: ${await c6.getAddress()}`);

  console.log("Adding classes to XUSD...");
  await token.addClass(await c6.getAddress(),  1, false);
 // await token.addClass(await c62.getAddress(),  1, false);
  // await token.addClass(await c362.getAddress(), true, 2, false);
  // console.log("Transferring XUSD...");
  await toker.transfer(signer2.address, ethers.parseEther("100"));
  console.log("Transfer successful.");
  const tokenOne = new ethers.Contract(
    "0xEb14f3192A37ad2501F3BF6627C565e6799aD661",
    require("./erc20abi.json"),
    signer
  );
  await tokenOne.approve(await lit.getAddress(), "99999999999999999999999999999999999999999999999")
  console.log("Assigning rank to rewarder...");
 // await access.assignRank(await rewarder.getAddress(), 4);
  await access.assignRank(await gov.getAddress(), 4);

  await toker.approve(await reward.getAddress(), ethers.parseEther("100000"));
  console.log("XUSD approved for rewards module.");
 
  console.log(`Allowance: ${await toker.allowance(signer.address, await token.getAddress())}`);
  //await reward.depositRewards(ethers.parseEther("100000"));
  console.log("Rewards deposited.");

  await token.addClass(await exxclass.getAddress(), 4, true);
  console.log("Rewards module added to XUSD class.");
  try {
    console.log("Attempting to mint pass...");
   // await lit.mintPass();
    console.log("Pass minted successfully.");
   
    console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))
    await exxclass.claimReward()
    // If you uncomment and use ggg.mintPass(), ensure ggg is correctly instantiated
    // await ggg.mintPass();
  } catch (e) {
    console.error("Error during minting:", e);
  }
  //  rewarder.addToWhiteListBig
  // Define the proposal object
  // let t = {
  //   classAddress: await c682.getAddress(),
  //   description: "DICK",
  //   name: "Hi",        
  //   process: false,
  //   rewards: false,
  //   classType: 1,
  //   importance: 0,
  // };

    // Log initial balances
    //const initialSignerBalance = await logBalanceDifference(signer.address, toker, "Initial signer");
   // const initialSigner2Balance = await logBalanceDifference(signer2.address, toker, "Initial signer2");
  
  //   console.log("Proposing new governance action...");
  //  await gov.propose(t, await c682.getAddress());
  //   console.log("Governance proposal created successfully.");
    console.log("Transferring XUSD...");
  await toker.transfer(signer.address, ethers.parseEther("100"));
  console.log("Transfer successful.");

//     console.log("Voting on proposal...");
//     await gov.vote(await c682.getAddress());
//     console.log("Vote cast successfully.");
  
// //    Log balances after operations
//     const finalSignerBalance = await logBalanceDifference(signer.address, toker, "Final signer");
//     const finalSigner2Balance = await logBalanceDifference(signer2.address, toker, "Final signer2");
  
    // Calculate and log the differences
    // const signerDifference = finalSignerBalance.sub(initialSignerBalance);
    // const signer2Difference = finalSigner2Balance.sub(initialSigner2Balance);
  
    // console.log(`Signer balance change: ${ethers.formatEther(signerDifference)} ETH`);
    // console.log(`Signer2 balance change: ${ethers.formatEther(signer2Difference)} ETH`);
  
    // console.log("Checking votes for the proposal...");
    // await gov.checkVotes(await c682.getAddress());
    // console.log("Votes checked successfully.");
  
    // console.log("Final active vibes:");
    // console.log(await gov.showActiveVibes("20", "5"));
  
  // } catch (e) {
  //   console.error("Error during governance operations:", e);
  // }
  console.log("Approving tokens for router...");
  const router = new ethers.Contract(
    "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
    require("./routerabi.json"),
    signer
  );
  // Approve `toker` tokens for the router
  await toker.approve(
    "0x165C3410fC91EF562C50559f7d2289fEbed552d9", // Replace with your router address
    ethers.parseEther("10000000000000000000000000000000000000000")
  );
  console.log("Tokens approved for router.");
  
  console.log("Adding liquidity to the router...");
  await router.addLiquidityETH(
    await toker.getAddress(),
    ethers.parseEther("1000"),
    "1",
    "1",
    "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
    "999999999999999999999",
    { value: ethers.parseEther(".02")}
  );
  console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))
  await exxclass.claimReward()
  console.log("Liquidity added successfully.");
  
  console.log("Performing token swap on the router...");
  await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
    ethers.parseEther("4300"),
    "0",
    [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], // Replace with your token addresses
    "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
    "9999999999999999999999999",
    {
 
    }
  );
  //await exxclass.claimReward()
  console.log(ethers.formatEther(await toker.burnBalance(signer.address)))
  console.log(ethers.formatEther(await toker.burnBalanceOrigin(signer.address)))
  console.log(await token.retrieveUserVibeList(signer.address));
  console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))
  await exxclass.claimReward()
  //await exxclass.claimReward()

  await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
    ethers.parseEther("430"),
    "0",
    [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], // Replace with your token addresses
    "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
    "9999999999999999999999999",
    {
 
    }
  );
  console.log(ethers.formatEther(await toker.burnBalance(signer.address)))
  console.log(ethers.formatEther(await toker.burnBalanceOrigin(signer.address)))
  console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))

  await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
    ethers.parseEther("430"),
    "0",
    [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], // Replace with your token addresses
    "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
    "9999999999999999999999999",
    {
 
    }
  );
  console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))
  console.log(ethers.formatEther(await toker.burnBalance(signer.address)))
  console.log(ethers.formatEther(await toker.burnBalanceOrigin(signer.address)))
 // await token.addClass(await c362.getAddress(), true, 1, false, 0);
  await router.addLiquidityETH(
    await toker.getAddress(),
    ethers.parseEther("100"),
    "1",
    "1",
    "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
    "999999999999999999999",
    { value: ethers.parseEther(".001")}
  );
  console.log("Liquidity added successfully.");
  
  console.log("Performing token swap on the router...");
  await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
    ethers.parseEther("4300"),
    "0",
    [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], // Replace with your token addresses
    "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
    "9999999999999999999999999",
    {
 
    }
  );
  console.log("Token swap executed successfully.");
  console.log(ethers.formatEther(await exxclass.getTraderReward(signer.address)))
  console.log("Executing final operations...");

  await lit.mintPass().catch(e => console.log(`Minting failed: ${e}`));

  await token.setGov(await gov.getAddress());
  console.log("Governance set for XUSD.");
  console.log(await gov.showActiveVibes("20", "5"));
  console.log("Final logs:");
  console.log(`Current Price: ${await c5.getCurrentPrice()}`);
  console.log(await gov.showActiveVibes("20", "5"));
  console.log(`Governance Votes: ${await gov.showAllProposals("1", "0")}`);
  console.log(`VibePass Username: ${await lit.getUsername(signer.address)}`);
 // console.log(`View Rewards: ${await rewarder.viewRewards(signer.address)}`);
  console.log(`Balance of signer2: ${await toker.balanceOf(signer2.address)}`);
  console.log(await token.retrieveUserVibeList(signer.address));
  console.log("Router deployment and operations completed.");
}

// async function deployFactory() {
//   console.log("Starting deployment of SniperWalletFactory...");
//   const Token = await ethers.getContractFactory(`SniperWalletFactory`);
//   const token = await Token.deploy(666);
//   console.log(`SniperWalletFactory deployed at: ${token.address}`);
// }

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
