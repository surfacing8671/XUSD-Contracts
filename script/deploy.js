const { AbiCoder } = require("ethers");
const { ethers } = require("hardhat");
const axios = require('axios');





async function deployRouter() {
  let privider = new ethers.JsonRpcProvider(`http://127.0.0.1:8545/`);


  const signer = new ethers.Wallet(process.env.PK, privider);
  const signer2 = new ethers.Wallet(process.env.PK1, privider);

  const lib2 = await ethers.getContractFactory(`LibRegistry`);
  const lib3 = await ethers.getContractFactory(`AtropaMath`);
 

//  //const class2 = await ethers.getContractFactory(`TimeBasedTaxCalculator`)
  const toke = await ethers.getContractFactory(`XUSD`);

  const lib2C = await lib2.deploy({
    
  });
  const lib3C = await lib3.deploy({
    
  });


   const lib5 = await ethers.getContractFactory(`HierarchicalAccessControl`)
 const access = await lib5.deploy(
 
 )

  // const big = await class1.deploy(
  //  "1000",
  //   {
  //     
  //   }
  // );
  const class233 = await ethers.getContractFactory(`AssetValueBasedTaxCalculator`, {

  });
  const class24 = await ethers.getContractFactory(`BalanceBasedTaxCalculator`, {

  });
  const class25 = await ethers.getContractFactory(`NegativeReferralBasedTaxCalculator`, {

  });
  // const class26 = await ethers.getContractFactory(`ReferralBasedTaxCalculator`, {

  // });
  const class27 = await ethers.getContractFactory(`TieredRateTaxCalculator`, {

  });
  // const class83 = await ethers.getContractFactory(`TimeBasedTaxCalculator`, {

  // });
  const class28 = await ethers.getContractFactory(`VolumeBasedTaxCalculator`, {

  });

  const class29 = await ethers.getContractFactory(`HoldingPeriodBasedTaxCalculator`, {

  });
  const class93 = await ethers.getContractFactory(`HoldingPeriodNegativeTaxCalculator`, {

  });
  const class43 = await ethers.getContractFactory(`LoyaltyBasedTaxCalculator`, {

  });
  const class63 = await ethers.getContractFactory(`LoyaltyBasedNegativeTaxCalculator`, {

  });
  const class53 = await ethers.getContractFactory(`MyGovernor`, {
    libraries: {
      AtropaMath: await lib3C.getAddress(),
      // Expireable:  await lib1C.getAddress(),
      LibRegistry: await lib2C.getAddress(),
    },
  });


//   const class453 = await ethers.getContractFactory(`RandomizedTaxCalculator`, {

//   });
//   const class3 = await ethers.getContractFactory(`TimeBasedTaxCalculator`, {
   
//     });
    const Token = await ethers.getContractFactory(`ClassRegistry`, {
      libraries: {
        AtropaMath: await lib3C.getAddress(),
  
        LibRegistry: await lib2C.getAddress(),
      },
    });


  
    
    const toker = await toke.deploy("f", "f", "18", "10000000000000000000000000000000", {
    })


    const token = await Token.deploy( await access.getAddress(), await toker.getAddress(), {

    
    });



    await toker.setRegistry(await token.getAddress())
    const NFT = await ethers.getContractFactory(`LitPass`, {
      libraries: {
        AtropaMath: await lib3C.getAddress(),
        // Expireable:  await lib1C.getAddress(),
        LibRegistry: await lib2C.getAddress(),
      },
    });
    const lit = await NFT.deploy("0xEb14f3192A37ad2501F3BF6627C565e6799aD661", await token.getAddress())
// let ggg = new ethers.Contract(await lit.getAddress(), require('../artifacts/contracts/LitPass.sol/LitPass.json').abi, signer2)
// await lit.setXusd(await toker.getAddress());
 await access.assignRank(await token.getAddress(), 1)
   let gov = await class53.deploy(await token.getAddress(), await lit.getAddress());
    await token.setGov(await gov.getAddress())

   // let gov2 = new ethers.Contract("0x7dc60FFd444147713FEFdE4D0bae56BaCd5c4560", require('../artifacts/contracts/').abi, signer2)
    // const c2 = await class233.deploy("10", "20", "200000000")
    const c3 = await class24.deploy("10", "20", "200000000", await toker.getAddress())
    const c4 = await class25.deploy("10", "20")
    await c4.registerReferral(signer2.address, signer.address)
      const c5 = await class27.deploy("10", "20", "1000", "200000", "200000000000")
      const c6 = await class28.deploy("10", "20", "200000000")
    //  const c2 = await class233.deploy("100", "2000", "200000000")
   //   const c2 = await class233.deploy("100", "2000", "200000000")
  const classReg = await ethers.getContractFactory(`RandomizedTaxCalculator`)
  

  
 const class6 = await classReg.deploy(50, 2000)

console.log(await class6.getAddress())
// //     ethers.parseEther("10000000000000000000000"),
//     {
//       

// //   //   }
// //   // );
// //   console.log(1);
// //   // const classReg1 = await classReg.deploy(await toker.getAddress(), {
// //   //   
// //   // });

  // const lit = await NFT.deploy(
  //   "0xEb14f3192A37ad2501F3BF6627C565e6799aD661",
  //   await classReg1.getAddress(),
  //   {
  //     
  //   }
  // );







  // const userClass1 = await classReg.deploy("2000", "10", "2", "15");

  // console.log(2);
  // const userClass2 = await classReg.deploy("10", "2000", "2", "15");

  // console.log(2);
//   const userClass33 = await class23.deploy(-200);
//  const userClass3 = await class23.deploy(1000);
//  const userClass31 = await class23.deploy(-1000);
//  const userClass32 = await class23.deploy(1000);
//  const userClass35 = await class23.deploy(1000);
//  const userClass34 = await class23.deploy(1000);
//  console.log(await userClass3.getAddress())
//  console.log(await userClass33.getAddress())
  // const userClass4 = await class3.deploy(-600n, [signer2.address], {
  //   
  // });
  //const userClassf3 = await class3.deploy(-100);

//   //  console.log(await userClass3.getAddress())


await toker.transfer(signer2.address, ethers.parseEther("1000"));
//  await token.addClass(await c2.getAddress(), true, 3)
await token.addClass(await class6.getAddress(), true, 1)
//await token.setXusd(await toker.getAddress())
 await token.addClass(await c5.getAddress(), true, 1)
await token.addClass(await c6.getAddress(), true, 0)
 // await token.addClass(await c.getAddress(), true, 0)

//   //  await token.addClass(await userClass3.getAddress(), true, 1)
//  //  await token.addClass(await userClass31.getAddress(), true, 2)
//    await token.addClass(await class6.getAddress(), true, 2)
// //   await token.addClass(await userClass35.getAddress(), true, 2)
//    await token.addClass(await class4.getAddress(), true, 1)



  // const big = await class1.deploy(
  //  "1000",
  //   {
  //     
  //   }
  // );
  await toker.transfer(signer2.address, ethers.parseEther("1000"));

  await toker.approve(await token.getAddress(), ethers.parseEther("100000"))
  console.log(await toker.allowance(signer.address, await token.getAddress()))
  await token.depositRewards(ethers.parseEther("1000"))

  const class23 = await ethers.getContractFactory(`FlatRateTaxCalculator`, {
    // libraries: {
      AtropaMath: await lib3C.getAddress(),
    //   //   LibRegistry: await lib2C.getAddress(),
    //   // //VotePass : await lib4C.getAddress(),
    //  // LibRegistry: await lib2C.getAddress(),
    // },
  });
 // const class3 = await ethers.getContractFactory(`FlatRateTaxCalculator`, {
      // libraries: {
  
  



//     ethers.parseEther("10000000000000000000000"),
//     {
//       

// //   //   }
// //   // );
// //   console.log(1);
// //   // const classReg1 = await classReg.deploy(await toker.getAddress(), {
// //   //   
// //   // });

// //   // const lit = await NFT.deploy(
// //   //   "0xEb14f3192A37ad2501F3BF6627C565e6799aD661",
// //   //   await classReg1.getAddress(),
// //   //   {
// //   //     
// //   //   }
// //   // );



//   const userClass1 = await classReg.deploy("2000", "10", "2", "15");

//   console.log(2);
//   const userClass2 = await classReg.deploy("10", "2000", "2", "15");

//   console.log(2);
//   const userClass33 = await class23.deploy(-200);
//  const userClass3 = await class23.deploy(300);
//  console.log(await userClass3.getAddress())
//  console.log(await userClass33.getAddress())
//   const userClass4 = await class3.deploy(-600n, [signer2.address], {
    
//   });
//   const userClassf3 = await class3.deploy(-100);

//   //  console.log(await userClass3.getAddress())



//   await token.addClass(await userClass33.getAddress(), true, 0)

//     await token.addClass(await userClass3.getAddress(), true, 1)
//   await token.addClass(await userClass3.getAddress(), true, 2)

  // try {
   let g55 = await toker.setRegistry(await token.getAddress());
//     await g.wait();
//     // await token.setWhitelistedClassToFee(await big.getAddress(), true);
//     // await token.setWhitelistedClassToFee(await userClass3.getAddress(), true);
//  //   await token.setWhitelistedClassToFee(await big.getAddress(), true);
//     // await token.setWhitelistedClassFromFee(await userClass3.getAddress(), true);
//   //  await token.setWhitelistedClassToFee(await userClass3.getAddress(), true);
//    // await token.setWhitelistedClassToFee(await userClass4.getAddress(), true);
//     // await token.setWhitelistedClassContractFee(await userClass3.getAddress(), true);
//   } catch {}
// await token.registerClassForTradeType(0, await userClassf3.getAddress());
// //await token.saveVibes(1, await userClassf3.getAddress());
// await token.registerClassForTradeType(1, await userClass1.getAddress());
// await token.saveVibes(0, await userClass3.getAddress())
// // console.log(await toker.balanceOf(signer.address))
//   await toker.transfer(signer2.address, ethers.parseEther("1000"));

//   console.log(await toker.balanceOf(signer.address))
//   console.log(await toker.balanceOf(signer2.address))
// addtoArraya(await userClass33.getAddress())
// addtoArraya(await userClass3.getAddress())
//  console.log( ethers.parseEther("1000"))
 await toker.transfer(signer2.address, ethers.parseEther("1000"));
 console.log(await toker.getVotes(signer.address))
 console.log(signer.address)
console.log(await toker.getVotesContracts(signer.address))
// console.log(await toker.balanceOf(signer2.address))
// console.log(await toker.getVotes(signer.address))
// await toker.transfer(signer2.address, ethers.parseEther("1000"));
// console.log(await toker.totalSupply())
// console.log(await toker.getVotes(signer.address))
// console.log(await toker.balanceOf(signer.address))
// console.log(await toker.getVotesContracts(signer.address))
// console.log(await toker.balanceOf(signer2.address))
// console.log(await toker.getVotes(signer.address))
// await toker.transfer(signer2.address, ethers.parseEther("1000"));
// console.log(await toker.getVotes(signer.address))
// console.log(await toker.balanceOf(signer2.address))
// await toker.transfer(signer2.address, ethers.parseEther("1000"));
// console.log(await toker.balanceOf(signer2.address))
// await toker.transfer(signer2.address, ethers.parseEther("1000"));
// const t11 = new ethers.Contract(await toker.getAddress(),  require("./erc20abi.json"), signer2);
// await t11.transfer(signer2.address, ethers.parseEther("1000"));
// try{
//   await lit.mintPass( )
//  await ggg.mintPass( )
// } catch(e){
//   console.log(e)
// }
//  await gov.propose("DICK", await c6.getAddress());
//  await gov.propose("DICK2", await c2.getAddress());
//  await gov.propose("DICK1", await c5.getAddress());
//  //await gov.propose("DICK", await c6.getAddress());

//  await gov2.vote(await c6.getAddress())
//   await gov.vote(await c6.getAddress())
//   await gov.checkVotes(await c6.getAddress())
//   console.log(await gov.showAllProposals())
//   await gov.vote(await c6.getAddress())


//   await gov2.vote(await c2.getAddress())
//   await gov.vote(await c5.getAddress())
//   await gov2.vote(await c5.getAddress())
//   await gov.vote(await c2.getAddress())
//   await gov.checkVotes(await c5.getAddress())
//   await gov.checkVotes(await c2.getAddress())
//   console.log(await gov.showAllProposals())
//   try {
//    // console.log("TUSD Registry:", await token.getAddress());
//   } catch {}
//   try {
//   //  console.log("LITPORT:", await lit.getAddress());
//   } catch {}
//   try {
//     console.log("XUSD:", await toker.getAddress());
//   } catch {}
//   try {
//    // console.log("CLASS1:", await userClass1.getAddress());
//   } catch {}
//   try {
//    console.log(":", await token.getAddress());
//   } catch {}
//   try {
//  //   console.log("CLASS3:", await senderClass.getAddress());
//   } catch {}
//   try {
//     console.log("CLASS4:", await senderClass2.getAddress());
//   } catch {}
//   try {
//    // console.log("class reg:", await classReg1.getAddress());
//   } catch {}

// // // //   try {
// // // //     //await lit.setRegistry(await token.getAddress(), {)
// // // //     let r = await lit.setPurchaseAmount(0);
// // // //     await r.wait();

  
   

//   // await token.addClassToContract("0xc7a8bac2a7545bc33e799cc1ff60d648c57ccbeb", class1T21, true)
//await toker.addWhitelistedContract("0x165C3410fC91EF562C50559f7d2289fEbed552d9")
  //const nft = new ethers.Contract(await lit.getAddress(), litAbi, signer3);
  const tokenOne = new ethers.Contract(
    "0xEb14f3192A37ad2501F3BF6627C565e6799aD661",
    require("./erc20abi.json"),
    signer
  );
  const router = new ethers.Contract(
    "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
    require("./routerabi.json"),
    signer
  );
  const token2 = new ethers.Contract(
    "0xA1077a294dDE1B09bB078844df40758a5D0f9a27",
    require("./erc20abi.json"),
    signer
  );
  await toker.approve(
    "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
    ethers.parseEther("10000000000000000000000000000000000000000")
  
  );
  console.log(await toker.allowance(signer.address, "0x165C3410fC91EF562C50559f7d2289fEbed552d9"))

  // const token22 = new ethers.Contract(
  //   "0xA1077a294dDE1B09bB078844df40758a5D0f9a27",
  //   require("./erc20abi.json"),
  //   signer2
  // );

  // const t1 = new ethers.Contract(await toker.getAddress(),  require("./erc20abi.json"), signer2);

  // const router2 = new ethers.Contract(
  //   "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
  //   require("./routerabi.json"),
  //   signer2
  // );

  // const token122 = new ethers.Contract(
  //  await toker.getAddress(),
  //   arc20Abi,
  //   signer3
  // );


  // const token1X = new ethers.Contract(
  //   await toker.getAddress(),
  //   arc20Abi,
  //   signer3
  // );
   let nonce = await signer.provider.getTransactionCount(signer.address)
  // await toker.approve(
  //   "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
  //   ethers.parseEther("10000000000000000000000000000000000000000"), 
  // )
  await token2.approve(
    "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
    ethers.parseEther("10000000000000000000000000000000000000000"), {nonce: nonce++}
  
  );

  await token.turnOnRewards( {nonce: nonce++})
  // await t1.approve(
  //   "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
  //   ethers.parseEther("10000000000000000000000000000000000000000"), {nonce: nonce++}
    
  // );


  // let g2 = await toker.transfer(
  //   signer2.address,
  //   ethers.parseEther("100"), {nonce: nonce++}
   
  // );


//   try{
//     await lit.mintPass( )
// } catch(e){
//     console.log(e)
// }
    




  




// console.log(await toker.balanceOf(signer.address))
//   let a2 = await toker.balanceOf("0x84D55D12384653d9e701F8eb74C60Ee9140A67b5")

 





//   //await lit.mintPass({ )


//   console.log(
//     await toker.balanceOf("0x1beD8319Ad56780F303B226BfcA60BAd29db9e66")
//   );
//   console.log(
//     await toker.balanceOf("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")
//   );

//   let g = await toker.transfer(
//     "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f",
//     ethers.parseEther("100000000"),
//     {
      
//     }
//   );
//   let g3 = await toker.transfer(
//     "0x84D55D12384653d9e701F8eb74C60Ee9140A67b5",
//     ethers.parseEther("100000000"),
//     {
      
//     }
//   );




 
//    console.log(await toker.balanceOf(signer.address))
//   await router.addLiquidityETH(
//     await toker.getAddress(),
//     ethers.parseEther("100000000"),
//     "1",
//     "1",
//    signer.address,
//     "999999999999999999999",
//     { value: ethers.parseEther("100"),   
//   }  );
//   console.log(await toker.balanceOf(signer.address))
//   console.log("before swap")
//   await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther("1000000"),
//     "1",
//     [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"],
//    signer.address,
//     "9999999999999999999999999", {  }
    
//   );
//   console.log("a swap")
//   console.log(await toker.balanceOf(signer2.address))
//   await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens( ethers.parseEther("100"), "1", [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], signer.address, "9999999999999999999999999", {   })
  
//   console.log(
//     await toker.balanceOf(signer.address)
//   );
//   await router.swapExactTokensForTokensSupportingFeeOnTransferTokens( ethers.parseEther("100"), "1", ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await toker.getAddress(), ], signer.address, "9999999999999999999999999", {  
     
//   })
//   console.log(await toker.getVotes(signer.address))
//   console.log(await toker.getVotesContracts(signer.address))
//   // await toker.transfer(
//   //   "0x205f6448a64Ae37e8bA5D1c44ba888395980e131",
//   //   ethers.parseEther("100"),
//   //   {
//   //     
//   //   }
//   // );
//   // // await classReg1.proposeClass(await userClass2.getAddress(), {
// //   // //   
// //   // // });

// //   // await toker.transfer(
// //   //   "0x321300E6897B21c096D83d14Aaf84C39AAf76d96",
// //   //   ethers.parseEther("100"),
//   //   {
//   //     
//   //   }
//   // );
// //await classReg1.proposeClass(await userClass2.getAddress(), {     });

//   //await nft.turnOnDelegate(1n,  { nonce: nonce2++});
//   // await classReg1.voteClass(
//   //   await userClass2.getAddress(),

//   // console.log(await classReg1.getActiveClassTax());
//   // console.log(await classReg1.getTotalProposals());


  await router.addLiquidityETH(
    await toker.getAddress(),
    ethers.parseEther("100000"),
    "1",
    "1",
    "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
    "999999999999999999999",
    { value: ethers.parseEther("10"), nonce: nonce++  }
  );


 await token.RegisterContracts(signer.address, {nonce: nonce++})
console.log("lp added")
  // await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
  //   ethers.parseEther("4300"),
  //   "0",
  //   [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"],
  //   "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
  //   "9999999999999999999999999",
  //   {
  //     nonce: nonce++
  //   }
  // );
  console.log("Swap")

  // console.log(
  //   await lit.getUserBurns(signer.address)
  // );
  //console.log(await lit.getUserList())

  // await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
  //   ethers.parseEther(".00001"),
  //   "0",
  //   ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await toker.getAddress()],
  //   "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66",
  //   "9999999999999999999999999",
  //   {
  //     nonce: nonce++
  //   }
  // );
  console.log(
    await toker.balanceOf("0x1beD8319Ad56780F303B226BfcA60BAd29db9e66")
  );

  console.log(
    await toker.balanceOf("0x46dfF191646bA20453c6F6D9C7ff60431C17f07B")
  );
  await toker.transfer(
    "0x46dfF191646bA20453c6F6D9C7ff60431C17f07B",
    ethers.parseEther("100"),
    {
      nonce: nonce++
    }
  );
  console.log(
    await toker.balanceOf("0x46dfF191646bA20453c6F6D9C7ff60431C17f07B")
  );
  let nonce2 = await signer.provider.getTransactionCount(signer2.address)
  console.log(
    await toker.balanceOf(signer2.address)
  );
  console.log(
    await toker.balanceOf("0x1beD8319Ad56780F303B226BfcA60BAd29db9e66")
  );
  // console.log(await token22.balanceOf('0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f'))
  // await t1.approve(
  //   "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
  //   ethers.parseEther("10000000000000000000000000"),{nonce: nonce++}
    
  // );
  // await token22.approve(
  //   "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
  //   ethers.parseEther("10000000000000000000000000"),
    
  // );
  // await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
  //   ethers.parseEther("1"),
  //   "0",
  //   [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"],
  //   "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f",
  //   "9999999999999999999999999"
  // );
  // console.log(
  //   await token22.balanceOf("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")
  // );
  // await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
  //   ethers.parseEther(".00001"),
  //   "0",
  //   ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await toker.getAddress()],
  //   "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f",
  //   "9999999999999999999999999",
  //   {
  //     nonce: nonce++
  //   }
 // );



//   console.log(await classReg1.getActiveClassTax());

// console.log(await lit.calculateBurn.staticCall(1n))

//   console.log(
//     await lit.getIdFromOwner("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")
//   );

  // console.log(await lit.calculateBurn.staticCall(1n))
  // console.log(await nft.calculateBurn.staticCall(2n))
  // console.log(await classReg1.getProposed((await userClass1.getAddress())))
  // await classReg1.voteClass(await userClass1.getAddress(), "0x295929A981426148Cd4085d7e2e129e51DCEa84C", { )
  // console.log(await classReg1.getProposed((await userClass2.getAddress())))
  // console.log(await classReg1.getClass((await userClass2.getAddress())))
  // //await classReg1.updateUser("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")

  // // await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens( ethers.parseEther("430000"), "0", [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f", "9999999999999999999999999", {
  // //     nonce: nonce2++
  // //  })
  // //  console.log(await token22.balanceOf('0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f'))
  // //  await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(  ethers.parseEther(".00001"), "0", ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await toker.getAddress(), ], "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f", "9999999999999999999999999", {
  // //      nonce: nonce2++
  // //  })

  // //  console.log(await token.getProposed((await userClass1.getAddress())))
  // // console.log(await token.GetAccessPower(("0x1bed8319ad56780f303b226bfca60bad29db9e66")))
  // // console.log(await userClass1.getNote())
  // // //console.log(await lit.getOwner(5n))
  // // // //     // console.log(await token.classList[await class1T.getAddress()])
  // // // // console.log(g)
  // // // // console.log(await token.classesShow())
  // // //    //await token.addClassToUser(await class1T.getAddress(), "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66")
  // // //  await token.setFees("transferFrom(address,address,uint256)", [await class1T.getAddress(), await class1T2.getAddress()], [-100, 200])

  // // //  //console.log(await token.getClassFee(await class1T.getAddress(), await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)")))
  // // // //  let sel = await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)")
  // //console.log(await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)"))
  //  console.log(await token.processTransaction.staticCall("0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x165C3410fC91EF562C50559f7d2289fEbed552d9", "0x165C3410fC91EF562C50559f7d2289fEbed552d9", "0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x23b872dd"))
  // // // console.log(sel)
  // // //  let g = await token.getClassFee(await class1T.getAddress(), '0x23b872dd')
  // //     console.log(g);
  // await token.addClassToUser("0x1bed8319ad56780f303b226bfca60bad29db9e66", await class1T2.getAddress())
  // console.log(await token.getUser("0x1bed8319ad56780f303b226bfca60bad29db9e66"))

  //await token.processTransaction("0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x850AeAfCaEd8f7CF409843840Cb8c4C6146AC04C", await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)"))

  // console.log(await token.processTransaction.staticCall("0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x850AeAfCaEd8f7CF409843840Cb8c4C6146AC04C", await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)")))

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
