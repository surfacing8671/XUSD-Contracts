const { AbiCoder } = require("ethers");
const { ethers } = require("hardhat");

/*
 If you have contracts with similar byte-codes, you can use the scripts in this format for verification
 npx hardhat verify --network <network-name> <contract-address> --contract "contracts/Tokens/TokenETH.sol:TokenETH(contract file path)" 
 */
let abi = [
  {
    inputs: [
      {
        internalType: "address",
        name: "_factory",
        type: "address",
      },
      {
        internalType: "address",
        name: "_WPLS",
        type: "address",
      },
    ],
    type: "constructor",
  },
  {
    inputs: [],
    name: "WPLS",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "tokenA",
        type: "address",
      },
      {
        internalType: "address",
        name: "tokenB",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "amountADesired",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountBDesired",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountAMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountBMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "addLiquidity",
    outputs: [
      {
        internalType: "uint256",
        name: "amountA",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountB",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "token",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "amountTokenDesired",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountTokenMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETHMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "addLiquidityETH",
    outputs: [
      {
        internalType: "uint256",
        name: "amountToken",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETH",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
    ],
    stateMutability: "payable",
    type: "function",
  },
  {
    inputs: [],
    name: "factory",
    outputs: [
      {
        internalType: "address",
        name: "",
        type: "address",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveOut",
        type: "uint256",
      },
    ],
    name: "getAmountIn",
    outputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
    ],
    stateMutability: "pure",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveOut",
        type: "uint256",
      },
    ],
    name: "getAmountOut",
    outputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
    ],
    stateMutability: "pure",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
    ],
    name: "getAmountsIn",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
    ],
    name: "getAmountsOut",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "view",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountA",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveA",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "reserveB",
        type: "uint256",
      },
    ],
    name: "quote",
    outputs: [
      {
        internalType: "uint256",
        name: "amountB",
        type: "uint256",
      },
    ],
    stateMutability: "pure",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "tokenA",
        type: "address",
      },
      {
        internalType: "address",
        name: "tokenB",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountAMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountBMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "removeLiquidity",
    outputs: [
      {
        internalType: "uint256",
        name: "amountA",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountB",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "token",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountTokenMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETHMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "removeLiquidityETH",
    outputs: [
      {
        internalType: "uint256",
        name: "amountToken",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETH",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "token",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountTokenMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETHMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "removeLiquidityETHSupportingFeeOnTransferTokens",
    outputs: [
      {
        internalType: "uint256",
        name: "amountETH",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "token",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountTokenMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETHMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
      {
        internalType: "bool",
        name: "approveMax",
        type: "bool",
      },
      {
        internalType: "uint8",
        name: "v",
        type: "uint8",
      },
      {
        internalType: "bytes32",
        name: "r",
        type: "bytes32",
      },
      {
        internalType: "bytes32",
        name: "s",
        type: "bytes32",
      },
    ],
    name: "removeLiquidityETHWithPermit",
    outputs: [
      {
        internalType: "uint256",
        name: "amountToken",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETH",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "token",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountTokenMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountETHMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
      {
        internalType: "bool",
        name: "approveMax",
        type: "bool",
      },
      {
        internalType: "uint8",
        name: "v",
        type: "uint8",
      },
      {
        internalType: "bytes32",
        name: "r",
        type: "bytes32",
      },
      {
        internalType: "bytes32",
        name: "s",
        type: "bytes32",
      },
    ],
    name: "removeLiquidityETHWithPermitSupportingFeeOnTransferTokens",
    outputs: [
      {
        internalType: "uint256",
        name: "amountETH",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "address",
        name: "tokenA",
        type: "address",
      },
      {
        internalType: "address",
        name: "tokenB",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "liquidity",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountAMin",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountBMin",
        type: "uint256",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
      {
        internalType: "bool",
        name: "approveMax",
        type: "bool",
      },
      {
        internalType: "uint8",
        name: "v",
        type: "uint8",
      },
      {
        internalType: "bytes32",
        name: "r",
        type: "bytes32",
      },
      {
        internalType: "bytes32",
        name: "s",
        type: "bytes32",
      },
    ],
    name: "removeLiquidityWithPermit",
    outputs: [
      {
        internalType: "uint256",
        name: "amountA",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountB",
        type: "uint256",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapETHForExactTokens",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "payable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactETHForTokens",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "payable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactETHForTokensSupportingFeeOnTransferTokens",
    outputs: [],
    stateMutability: "payable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactTokensForETH",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactTokensForETHSupportingFeeOnTransferTokens",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactTokensForTokens",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountIn",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountOutMin",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapExactTokensForTokensSupportingFeeOnTransferTokens",
    outputs: [],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountInMax",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapTokensForExactETH",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    inputs: [
      {
        internalType: "uint256",
        name: "amountOut",
        type: "uint256",
      },
      {
        internalType: "uint256",
        name: "amountInMax",
        type: "uint256",
      },
      {
        internalType: "address[]",
        name: "path",
        type: "address[]",
      },
      {
        internalType: "address",
        name: "to",
        type: "address",
      },
      {
        internalType: "uint256",
        name: "deadline",
        type: "uint256",
      },
    ],
    name: "swapTokensForExactTokens",
    outputs: [
      {
        internalType: "uint256[]",
        name: "amounts",
        type: "uint256[]",
      },
    ],
    stateMutability: "nonpayable",
    type: "function",
  },
  {
    type: "receive",
  },
];
// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
async function deployRouter() {
  let privider = new ethers.JsonRpcProvider(`http://127.0.0.1:8545/`);

   const signer = new ethers.Wallet(process.env.PK, privider);
  const signer2 = new ethers.Wallet(
    "0xa7c93af2c82b735ca3643d09333f9e11d2bd3c95bf7bc7dcf5cf888c7e41c89a",
    privider
  );
  const signer3 = new ethers.Wallet(
    "0x78df364ff45a97327c88cd90fe8e966c78ccc15a4b3097baf0b1125ddcdbe405",
    privider
  );

//let nonce5 = await privider.getTransactionCount(await signer3.getAddresss());

  let nonce = await privider.getTransactionCount(
    "0x84D55D12384653d9e701F8eb74C60Ee9140A67b5"
  );
  let nonce3 = await privider.getTransactionCount(
    "0x84D55D12384653d9e701F8eb74C60Ee9140A67b5"
  );

  
 // const class21 = await ethers.getContractFactory(`moo2`);
  // const class13 = await ethers.getContractFactory(`LibRegistry2`);
  const lib2 = await ethers.getContractFactory(`LibRegistry`);
  const lib3 = await ethers.getContractFactory(`AtropaMath`);
  const class1 = await ethers.getContractFactory(`FlatRateTaxCalculator`)
  const class3 = await ethers.getContractFactory(`WhitelistedAddressTaxCalculator`)
  const class2 = await ethers.getContractFactory(`TimeBasedTaxCalculator`)
  const toke = await ethers.getContractFactory(`MyTokenMock`);
  const lib2C = await lib2.deploy({
    nonce: nonce++,
  });
  const lib3C = await lib3.deploy({
    nonce: nonce++,
  });

const toker = await toke.deploy("d", "d", "18", "1000000000000000000000000000000", {
  nonce: nonce++
})

  const big = await class1.deploy(
   "1000",
    {
      nonce: nonce++,
    }
  );
  // const classReg = await ethers.getContractFactory(`ClassRegistry`, {
  //   libraries: {
  //     AtropaMath: await lib3C.getAddress(),
  //     //VotePass : await lib4C.getAddress(),
  //     LibRegistry: await lib2C.getAddress(),
  //   },
  // });
  // const NFT = await ethers.getContractFactory(`LitPass`, {
  //   libraries: {
  //     AtropaMath: await lib3C.getAddress(),
  //     // Expireable:  await lib1C.getAddress(),
  //     LibRegistry: await lib2C.getAddress(),
  //   },
  // });
  
  const Token = await ethers.getContractFactory(`ClassRegistry`, {
    libraries: {
      AtropaMath: await lib3C.getAddress(),

      LibRegistry: await lib2C.getAddress(),
    },
  });
  
  // const toker = await class21.deploy(
  //   ".",
  //   ".",
  //   "18",
  //   ethers.parseEther("10000000000000000000000"),
  //   {
  //     nonce: nonce++,

  //   }
  // );
  console.log(1);
  // const classReg1 = await classReg.deploy(await toker.getAddress(), {
  //   nonce: nonce++,
  // });

  // const lit = await NFT.deploy(
  //   "0xEb14f3192A37ad2501F3BF6627C565e6799aD661",
  //   await classReg1.getAddress(),
  //   {
  //     nonce: nonce++,
  //   }
  // );
  const token = await Token.deploy( {
    nonce: nonce++,
  });
  const userClass1 = await class2.deploy("2000", "10", "2", "15", {
    nonce: nonce++,
  });

  console.log(2);
  const userClass2 = await class2.deploy("10", "2000", "2", "15", {
    nonce: nonce++,
  });

  console.log(2);

  const userClass3 = await class3.deploy("1000", ["0x1beD8319Ad56780F303B226BfcA60BAd29db9e66"], {
    nonce: nonce++,
  });

  // console.log(await lib1C.getAddress())

 

/////Function start ups

  


  
  try {
    let g = await toker.setRegistry(await token.getAddress(), { nonce: nonce++ });
    await g.wait();
    await token.setWhitelistedClassToFee(await big.getAddress(), true, { nonce: nonce++ });
    await token.setWhitelistedClassToFee(await userClass3.getAddress(), true, { nonce: nonce++ });
    await token.setWhitelistedClassToFee(await userClass3.getAddress(), true, { nonce: nonce++ });
    await token.setWhitelistedClassFromFee(await userClass3.getAddress(), true, { nonce: nonce++ });
    await token.setWhitelistedClassNowFee(await userClass1.getAddress(), true, { nonce: nonce++ });
    await token.setWhitelistedClassCallerFee(await userClass3.getAddress(), true, { nonce: nonce++ });
  } catch {}

await token.recalculateFees({ nonce: nonce++ })
console.log(await toker.balanceOf("0x84D55D12384653d9e701F8eb74C60Ee9140A67b5"))
  await toker.transfer("0x1beD8319Ad56780F303B226BfcA60BAd29db9e66", ethers.parseEther("1000"), { nonce: nonce++ });

  console.log(await toker.balanceOf("0x1beD8319Ad56780F303B226BfcA60BAd29db9e66"))
  console.log(await toker.balanceOf("0x84D55D12384653d9e701F8eb74C60Ee9140A67b5"))

  let num1 = await toker.balanceOf("0x1beD8319Ad56780F303B226BfcA60BAd29db9e66")

  let num2 = await toker.balanceOf("0x84D55D12384653d9e701F8eb74C60Ee9140A67b5")

  let something = num2 / ethers.parseEther("1000")

  console.log(something)
//   try {
//     let p = await lit.setXusd(await toker.getAddress(), {
//       nonce: nonce++,
//     });
//     await p.wait();
//   } catch {}

  
//   console.log(await userClass1.getAddress());
//   //    // await class1T.waitForDeployment()
//   //    console.log(await lib3C.getAddress())

//   try {
//     let q = await classReg1.RegisterAccess(await token.getAddress(), 5, {
//       nonce: nonce++,
//     });
//     await q.wait();
//   } catch {}

//   try {
//     let q = await classReg1.RegisterAccess(await lit.getAddress(), 5, {
//       nonce: nonce++,
//     });
//     await q.wait();
//   } catch {}
//   try {
//     console.log("TUSD Registry:", await token.getAddress());
//   } catch {}
//   try {
//     console.log("LITPORT:", await lit.getAddress());
//   } catch {}
//   try {
//     console.log("XUSD:", await toker.getAddress());
//   } catch {}
//   try {
//     console.log("CLASS1:", await userClass1.getAddress());
//   } catch {}
//   try {
//     console.log("CLASS2:", await userClass2.getAddress());
//   } catch {}
//   try {
//     console.log("CLASS3:", await senderClass.getAddress());
//   } catch {}
//   try {
//     console.log("CLASS4:", await senderClass2.getAddress());
//   } catch {}
//   try {
//     console.log("class reg:", await classReg1.getAddress());
//   } catch {}

//   try {
//     //await lit.setRegistry(await token.getAddress(), {nonce: nonce++})
//     let r = await lit.setPurchaseAmount(0, { nonce: nonce++ });
//     await r.wait();

  
   
   
  

//     h = await toker.setRegistry(await token.getAddress(), {
//       nonce: nonce++,
//     });
//     await h.wait();

//     console.log("Registry Applied to classes:");
//     // await class1T2.addSignatureAdd("0x23b872dd", "0x165C3410fC91EF562C50559f7d2289fEbed552d9", {
//     //     nonce: nonce++
//     // })
//     // h = await senderClass.addSenderAdd(
//     //   "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
//     //   { nonce: nonce++ }
//     // );
//     console.log("Sender Applied");
//   //  await h.wait();
//   } catch {}
//    // await toker.mint("0x1bed8319ad56780f303b226bfca60bad29db9e66", ethers.parseEther("1000000000"))
// //    await token.setXusd(await toker.getAddress(), {
// //       nonce: nonce++
// //   })
// //   await token._addUser("0x295929A981426148Cd4085d7e2e129e51DCEa84C", {
// //     nonce: nonce++
// //   })

// //   await token.setLit(await lit.getAddress(), {
// //     nonce: nonce++
// //   })
//   console.log("Set Xusd")
// //   await token.addClass(await userClass1.getAddress(), {
// //       nonce: nonce++
// //   })

//   console.log("Added class");
//   // await token.addClass(await userClass1.getAddress(), {
//   //     nonce: nonce++
//   // })
//   console.log(await classReg1.getActiveClassTax());
//   console.log(await classReg1.getTotalProposals());

//   // let g = await token.ProposeClass("0x165C3410fC91EF562C50559f7d2289fEbed552d9", {
//   //     nonce: nonce++
//   // })

//   // console.log(g)
//   // await token.addClass(await senderClass.getAddress(), {
  //     nonce: nonce++
  // })
  // await token.RegisterGovAccess(await toker.getAddress(), 2, {
  //     nonce: nonce++
  // })

  // await token.RegisterGovAccess("0xA1077a294dDE1B09bB078844df40758a5D0f9a27", 2, {
  //     nonce: nonce++
  // })

  // //   //  await token.addUser("0x1bed8319ad56780f303b226bfca60bad29db9e66")
  //  await token.addClassToUser("0x1bed8319ad56780f303b226bfca60bad29db9e66", await class1T21.getAddress(), {
  //     nonce: nonce++
  // })

  //  await token.RegisterUserClass("0x1bed8319ad56780f303b226bfca60bad29db9e66", await userClass2.getAddress(), true, {nonce: nonce++})
  //    await token.addClassToUser("0x1bed8319ad56780f303b226bfca60bad29db9e66", await class1T2.getAddress(), 99999999999999999n, {
  //     nonce: nonce++
  // })
  //await token.addClassToUser("0x850AeAfCaEd8f7CF409843840Cb8c4C6146AC04C", await class1T2.getAddress(), 99999999999999999n)
  //await token.addClassToUser("0x1bed8319ad56780f303b226bfca60bad29db9e66", await class1T21.getAddress(), 99999999999999999n)
  //  await token.addClassToUser("0x1bed8319ad56780f303b226bfca60bad29db9e66", await class1T21.getAddress(), 99999999999999999n)
  // //   //  await token.addClassToUser("0x1bed8319ad56780f303b226bfca60bad29db9e66", await class1T.getAddress())
  //     const classParam = {
  //         classAddress: await class1T.getAddress(),
  //         basisFee: 1000,
  //         upOrDown: true,
  //     }

  //     const classParam2 = {
  //         classAddress: await class1T2.getAddress(),
  //         basisFee: 1000,
  //         upOrDown: true,
  //     }
  //     //console.log(await token.classesShow())
  //await token.setFees("transferFrom(address,address,uint256)")
  //await token.setFees("transfer(address,uint256)")
  //await token.setFees("swapExactTokensForTokensSupportingFeeOnTransferTokens(uint256, uint256,address[], address, uint256",  {
  //     nonce: nonce++
  // })
  //    let g = await token.addClass(classParam, {
  //         nonce: nonce++
  //     })
  //  console.log(await token.getUserClasses("0x1bed8319ad56780f303b226bfca60bad29db9e66"))
  //  console.log(await token.getUserClasses("0x850AeAfCaEd8f7CF409843840Cb8c4C6146AC04C"))
  //  console.log(await token.getUserClasses("0x165C3410fC91EF562C50559f7d2289fEbed552d9"))
  //     let g1 = await token.addClass(classParam2, {
  //         nonce: nonce++
  //     })
  //     let g31 = await token.addClass(classParam2, {
  //         nonce: nonce++
  //     })
  let regAbi = [
    {
      inputs: [],
      stateMutability: "nonpayable",
      type: "constructor",
    },
    {
      inputs: [],
      name: "AlreadyProposed",
      type: "error",
    },
    {
      inputs: [],
      name: "ArrayLengthMismatch",
      type: "error",
    },
    {
      inputs: [],
      name: "FeeAboveMaxLimit",
      type: "error",
    },
    {
      inputs: [],
      name: "NotAllowedAccess",
      type: "error",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "owner",
          type: "address",
        },
      ],
      name: "OwnableInvalidOwner",
      type: "error",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "account",
          type: "address",
        },
      ],
      name: "OwnableUnauthorizedAccount",
      type: "error",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "bytes32",
          name: "feeId",
          type: "bytes32",
        },
        {
          indexed: true,
          internalType: "address",
          name: "classContract",
          type: "address",
        },
        {
          indexed: true,
          internalType: "bytes4",
          name: "functionSig",
          type: "bytes4",
        },
        {
          indexed: false,
          internalType: "int256",
          name: "fee",
          type: "int256",
        },
      ],
      name: "ClassFeeRegistered",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "address",
          name: "previousOwner",
          type: "address",
        },
        {
          indexed: true,
          internalType: "address",
          name: "newOwner",
          type: "address",
        },
      ],
      name: "OwnershipTransferred",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: false,
          internalType: "int256",
          name: "fee",
          type: "int256",
        },
      ],
      name: "TotalFee",
      type: "event",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
        {
          internalType: "enum GovAccessRegistry.AccessType",
          name: "class",
          type: "uint8",
        },
      ],
      name: "AccessIsClass",
      outputs: [
        {
          internalType: "bool",
          name: "",
          type: "bool",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [],
      name: "AccessRegistryCount",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "dom",
          type: "address",
        },
      ],
      name: "ClassProposedValid",
      outputs: [
        {
          internalType: "bool",
          name: "",
          type: "bool",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [],
      name: "ClassRegistryCount",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "dom",
          type: "address",
        },
      ],
      name: "ClassValid",
      outputs: [
        {
          internalType: "bool",
          name: "",
          type: "bool",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
      ],
      name: "GetAccess",
      outputs: [
        {
          components: [
            {
              internalType: "address",
              name: "Address",
              type: "address",
            },
            {
              internalType: "enum GovAccessRegistry.AccessType",
              name: "Class",
              type: "uint8",
            },
            {
              internalType: "string[]",
              name: "Notes",
              type: "string[]",
            },
            {
              internalType: "uint256",
              name: "burnAmount",
              type: "uint256",
            },
            {
              internalType: "address",
              name: "litPass",
              type: "address",
            },
          ],
          internalType: "struct GovAccessRegistry.Accessor",
          name: "",
          type: "tuple",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "uint256",
          name: "i",
          type: "uint256",
        },
      ],
      name: "GetAccessByIndex",
      outputs: [
        {
          components: [
            {
              internalType: "address",
              name: "Address",
              type: "address",
            },
            {
              internalType: "enum GovAccessRegistry.AccessType",
              name: "Class",
              type: "uint8",
            },
            {
              internalType: "string[]",
              name: "Notes",
              type: "string[]",
            },
            {
              internalType: "uint256",
              name: "burnAmount",
              type: "uint256",
            },
            {
              internalType: "address",
              name: "litPass",
              type: "address",
            },
          ],
          internalType: "struct GovAccessRegistry.Accessor",
          name: "",
          type: "tuple",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "uint256",
          name: "i",
          type: "uint256",
        },
      ],
      name: "GetClassByIndex",
      outputs: [
        {
          components: [
            {
              internalType: "address",
              name: "classAddress",
              type: "address",
            },
            {
              internalType: "int256",
              name: "basisFee",
              type: "int256",
            },
          ],
          internalType: "struct ClassRegistry.Class",
          name: "",
          type: "tuple",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "uint256",
          name: "i",
          type: "uint256",
        },
      ],
      name: "GetProspectClassByIndex",
      outputs: [
        {
          components: [
            {
              internalType: "address",
              name: "classAddress",
              type: "address",
            },
            {
              internalType: "uint256",
              name: "votes",
              type: "uint256",
            },
          ],
          internalType: "struct ClassRegistry.ProposedClass",
          name: "",
          type: "tuple",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "uint256",
          name: "i",
          type: "uint256",
        },
      ],
      name: "GetUserByIndex",
      outputs: [
        {
          components: [
            {
              internalType: "address",
              name: "userAddress",
              type: "address",
            },
            {
              internalType: "bool",
              name: "active",
              type: "bool",
            },
            {
              components: [
                {
                  internalType: "address",
                  name: "classAddress",
                  type: "address",
                },
                {
                  internalType: "int256",
                  name: "basisFee",
                  type: "int256",
                },
              ],
              internalType: "struct UserClassRegistry.Class1",
              name: "class",
              type: "tuple",
            },
          ],
          internalType: "struct UserClassRegistry.UserWithClass",
          name: "",
          type: "tuple",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
        {
          internalType: "address",
          name: "dom",
          type: "address",
        },
      ],
      name: "GetUserClass",
      outputs: [
        {
          components: [
            {
              internalType: "address",
              name: "userAddress",
              type: "address",
            },
            {
              internalType: "bool",
              name: "active",
              type: "bool",
            },
            {
              components: [
                {
                  internalType: "address",
                  name: "classAddress",
                  type: "address",
                },
                {
                  internalType: "int256",
                  name: "basisFee",
                  type: "int256",
                },
              ],
              internalType: "struct UserClassRegistry.Class1",
              name: "class",
              type: "tuple",
            },
          ],
          internalType: "struct UserClassRegistry.UserWithClass",
          name: "",
          type: "tuple",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
        {
          internalType: "enum GovAccessRegistry.AccessType",
          name: "min",
          type: "uint8",
        },
      ],
      name: "HasAccess",
      outputs: [
        {
          internalType: "bool",
          name: "",
          type: "bool",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
        {
          internalType: "address",
          name: "dom",
          type: "address",
        },
      ],
      name: "HasUserClass",
      outputs: [
        {
          internalType: "bool",
          name: "",
          type: "bool",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "dom",
          type: "address",
        },
      ],
      name: "ProposeClass",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [],
      name: "ProposedClassRegistryCount",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "dom",
          type: "address",
        },
      ],
      name: "RegisterClass",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "addr",
          type: "address",
        },
        {
          internalType: "enum GovAccessRegistry.AccessType",
          name: "class",
          type: "uint8",
        },
      ],
      name: "RegisterGovAccess",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
        {
          internalType: "address",
          name: "dom",
          type: "address",
        },
        {
          internalType: "bool",
          name: "active",
          type: "bool",
        },
      ],
      name: "RegisterUserClass",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
      ],
      name: "RemoveAccess",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [],
      name: "UserRegistryCount",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "dom",
          type: "address",
        },
      ],
      name: "VoteClass",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "enum GovAccessRegistry.AccessType",
          name: "",
          type: "uint8",
        },
      ],
      name: "accessValues",
      outputs: [
        {
          internalType: "uint8",
          name: "",
          type: "uint8",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "class",
          type: "address",
        },
      ],
      name: "addClass",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
      ],
      name: "addUser",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
        {
          internalType: "enum GovAccessRegistry.AccessType",
          name: "Class",
          type: "uint8",
        },
      ],
      name: "assignAccess",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [],
      name: "burn",
      outputs: [
        {
          internalType: "address",
          name: "",
          type: "address",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      name: "classes",
      outputs: [
        {
          internalType: "address",
          name: "classAddress",
          type: "address",
        },
        {
          internalType: "int256",
          name: "basisFee",
          type: "int256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "dom",
          type: "address",
        },
      ],
      name: "getBasis",
      outputs: [
        {
          internalType: "int256",
          name: "",
          type: "int256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "dom",
          type: "address",
        },
      ],
      name: "getClass",
      outputs: [
        {
          components: [
            {
              internalType: "address",
              name: "classAddress",
              type: "address",
            },
            {
              internalType: "int256",
              name: "basisFee",
              type: "int256",
            },
          ],
          internalType: "struct ClassRegistry.Class",
          name: "",
          type: "tuple",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "dom",
          type: "address",
        },
      ],
      name: "getProposed",
      outputs: [
        {
          components: [
            {
              internalType: "address",
              name: "classAddress",
              type: "address",
            },
            {
              internalType: "uint256",
              name: "votes",
              type: "uint256",
            },
          ],
          internalType: "struct ClassRegistry.ProposedClass",
          name: "",
          type: "tuple",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
      ],
      name: "getUserClasses",
      outputs: [
        {
          internalType: "address[]",
          name: "",
          type: "address[]",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [],
      name: "minBurnBalance",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [],
      name: "owner",
      outputs: [
        {
          internalType: "address",
          name: "",
          type: "address",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [],
      name: "participantAmount",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "caller",
          type: "address",
        },
        {
          internalType: "address",
          name: "to",
          type: "address",
        },
        {
          internalType: "address",
          name: "from",
          type: "address",
        },
        {
          internalType: "bytes4",
          name: "selector",
          type: "bytes4",
        },
        {
          internalType: "address",
          name: "sender",
          type: "address",
        },
        {
          internalType: "uint256",
          name: "amount",
          type: "uint256",
        },
      ],
      name: "processTransaction",
      outputs: [
        {
          internalType: "int256",
          name: "",
          type: "int256",
        },
      ],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [],
      name: "renounceOwnership",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
        {
          internalType: "address",
          name: "litPass",
          type: "address",
        },
      ],
      name: "setLitpass",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "uint256",
          name: "amount",
          type: "uint256",
        },
      ],
      name: "setMinBurnBalance",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "uint256",
          name: "_userAmount",
          type: "uint256",
        },
        {
          internalType: "uint256",
          name: "_participantAmount",
          type: "uint256",
        },
        {
          internalType: "uint256",
          name: "_soldierAmount",
          type: "uint256",
        },
      ],
      name: "setRankingAmounts",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "_xusd",
          type: "address",
        },
      ],
      name: "setXusd",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [],
      name: "soldierAmount",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "newOwner",
          type: "address",
        },
      ],
      name: "transferOwnership",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "user",
          type: "address",
        },
      ],
      name: "updateUser",
      outputs: [],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [],
      name: "userAmount",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [],
      name: "userIndex",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      name: "userList",
      outputs: [
        {
          internalType: "bool",
          name: "",
          type: "bool",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [],
      name: "xusd",
      outputs: [
        {
          internalType: "address",
          name: "",
          type: "address",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
  ];
  let arc20Abi = [
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "address",
          name: "owner",
          type: "address",
        },
        {
          indexed: true,
          internalType: "address",
          name: "spender",
          type: "address",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "value",
          type: "uint256",
        },
      ],
      name: "Approval",
      type: "event",
    },
    {
      anonymous: false,
      inputs: [
        {
          indexed: true,
          internalType: "address",
          name: "from",
          type: "address",
        },
        {
          indexed: true,
          internalType: "address",
          name: "to",
          type: "address",
        },
        {
          indexed: false,
          internalType: "uint256",
          name: "value",
          type: "uint256",
        },
      ],
      name: "Transfer",
      type: "event",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "owner",
          type: "address",
        },
        {
          internalType: "address",
          name: "spender",
          type: "address",
        },
      ],
      name: "allowance",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "spender",
          type: "address",
        },
        {
          internalType: "uint256",
          name: "value",
          type: "uint256",
        },
      ],
      name: "approve",
      outputs: [
        {
          internalType: "bool",
          name: "",
          type: "bool",
        },
      ],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "account",
          type: "address",
        },
      ],
      name: "balanceOf",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [],
      name: "totalSupply",
      outputs: [
        {
          internalType: "uint256",
          name: "",
          type: "uint256",
        },
      ],
      stateMutability: "view",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "to",
          type: "address",
        },
        {
          internalType: "uint256",
          name: "value",
          type: "uint256",
        },
      ],
      name: "transfer",
      outputs: [
        {
          internalType: "bool",
          name: "",
          type: "bool",
        },
      ],
      stateMutability: "nonpayable",
      type: "function",
    },
    {
      inputs: [
        {
          internalType: "address",
          name: "from",
          type: "address",
        },
        {
          internalType: "address",
          name: "to",
          type: "address",
        },
        {
          internalType: "uint256",
          name: "value",
          type: "uint256",
        },
      ],
      name: "transferFrom",
      outputs: [
        {
          internalType: "bool",
          name: "",
          type: "bool",
        },
      ],
      stateMutability: "nonpayable",
      type: "function",
    },
  ];

  let litAbi = [
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "_oneSwap",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "classReg",
          "type": "address"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "constructor"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "sender",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        },
        {
          "internalType": "address",
          "name": "owner",
          "type": "address"
        }
      ],
      "name": "ERC721IncorrectOwner",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "operator",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "ERC721InsufficientApproval",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "approver",
          "type": "address"
        }
      ],
      "name": "ERC721InvalidApprover",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "operator",
          "type": "address"
        }
      ],
      "name": "ERC721InvalidOperator",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "owner",
          "type": "address"
        }
      ],
      "name": "ERC721InvalidOwner",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "receiver",
          "type": "address"
        }
      ],
      "name": "ERC721InvalidReceiver",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "sender",
          "type": "address"
        }
      ],
      "name": "ERC721InvalidSender",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "ERC721NonexistentToken",
      "type": "error"
    },
    {
      "inputs": [],
      "name": "LitPassAlreadyMinted",
      "type": "error"
    },
    {
      "inputs": [],
      "name": "LitPassCanOnlyHoldOne",
      "type": "error"
    },
    {
      "inputs": [],
      "name": "LitPassDelegated",
      "type": "error"
    },
    {
      "inputs": [],
      "name": "LitPassNonExistant",
      "type": "error"
    },
    {
      "inputs": [],
      "name": "LitPassNotDelegated",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "owner",
          "type": "address"
        }
      ],
      "name": "OwnableInvalidOwner",
      "type": "error"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "account",
          "type": "address"
        }
      ],
      "name": "OwnableUnauthorizedAccount",
      "type": "error"
    },
    {
      "inputs": [],
      "name": "UserDoesNotOwnLitPassId",
      "type": "error"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "owner",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "approved",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "Approval",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "owner",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "operator",
          "type": "address"
        },
        {
          "indexed": false,
          "internalType": "bool",
          "name": "approved",
          "type": "bool"
        }
      ],
      "name": "ApprovalForAll",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "_fromTokenId",
          "type": "uint256"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "_toTokenId",
          "type": "uint256"
        }
      ],
      "name": "BatchMetadataUpdate",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "_tokenId",
          "type": "uint256"
        }
      ],
      "name": "MetadataUpdate",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "previousOwner",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "newOwner",
          "type": "address"
        }
      ],
      "name": "OwnershipTransferred",
      "type": "event"
    },
    {
      "anonymous": false,
      "inputs": [
        {
          "indexed": true,
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "indexed": true,
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "Transfer",
      "type": "event"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "i",
          "type": "uint256"
        }
      ],
      "name": "GetNftByIndexHash",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "approve",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "owner",
          "type": "address"
        }
      ],
      "name": "balanceOf",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "user",
          "type": "address"
        }
      ],
      "name": "calculateBurn",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "user",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "number",
          "type": "uint256"
        }
      ],
      "name": "calculateTriHash",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "getApproved",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "user",
          "type": "address"
        }
      ],
      "name": "getIdFromOwner",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "getOwner",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "user",
          "type": "address"
        }
      ],
      "name": "getProtocolBurn",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "user",
          "type": "address"
        }
      ],
      "name": "getUserBurns",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "user",
          "type": "address"
        }
      ],
      "name": "hasLitPass",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "owner",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "operator",
          "type": "address"
        }
      ],
      "name": "isApprovedForAll",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "mintPass",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "name",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "oneSwap",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "owner",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "ownerOf",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "purchaseAmount",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "renounceOwnership",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "safeTransferFrom",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        },
        {
          "internalType": "bytes",
          "name": "data",
          "type": "bytes"
        }
      ],
      "name": "safeTransferFrom",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "operator",
          "type": "address"
        },
        {
          "internalType": "bool",
          "name": "approved",
          "type": "bool"
        }
      ],
      "name": "setApprovalForAll",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "amount",
          "type": "uint256"
        }
      ],
      "name": "setPurchaseAmount",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "registry",
          "type": "address"
        }
      ],
      "name": "setRegistry",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "user",
          "type": "address"
        },
        {
          "internalType": "string",
          "name": "userName",
          "type": "string"
        }
      ],
      "name": "setUserName",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "_xusd",
          "type": "address"
        }
      ],
      "name": "setXusd",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "bytes4",
          "name": "interfaceId",
          "type": "bytes4"
        }
      ],
      "name": "supportsInterface",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "symbol",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "tokenURI",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "from",
          "type": "address"
        },
        {
          "internalType": "address",
          "name": "to",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "tokenId",
          "type": "uint256"
        }
      ],
      "name": "transferFrom",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "newOwner",
          "type": "address"
        }
      ],
      "name": "transferOwnership",
      "outputs": [],
      "stateMutability": "nonpayable",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "user",
          "type": "address"
        }
      ],
      "name": "viewTotalBurn",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "user",
          "type": "address"
        }
      ],
      "name": "viewUrl",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "user",
          "type": "address"
        }
      ],
      "name": "viewUserBurns",
      "outputs": [
        {
          "internalType": "uint256",
          "name": "",
          "type": "uint256"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [
        {
          "internalType": "address",
          "name": "user",
          "type": "address"
        }
      ],
      "name": "viewUserName",
      "outputs": [
        {
          "internalType": "string",
          "name": "",
          "type": "string"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    },
    {
      "inputs": [],
      "name": "xusd",
      "outputs": [
        {
          "internalType": "address",
          "name": "",
          "type": "address"
        }
      ],
      "stateMutability": "view",
      "type": "function"
    }
  ]

  // await token.addClassToContract("0xc7a8bac2a7545bc33e799cc1ff60d648c57ccbeb", class1T21, true)
  let nonce2 = await privider.getTransactionCount(
    "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f"
  );
  //const nft = new ethers.Contract(await lit.getAddress(), litAbi, signer3);
  const tokenOne = new ethers.Contract(
    "0xEb14f3192A37ad2501F3BF6627C565e6799aD661",
    arc20Abi,
    signer
  );
  const router = new ethers.Contract(
    "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
    abi,
    signer
  );
  const token2 = new ethers.Contract(
    "0xA1077a294dDE1B09bB078844df40758a5D0f9a27",
    arc20Abi,
    signer
  );
  const token22 = new ethers.Contract(
    "0xA1077a294dDE1B09bB078844df40758a5D0f9a27",
    arc20Abi,
    signer2
  );

  const t1 = new ethers.Contract(await toker.getAddress(), arc20Abi, signer2);

  const router2 = new ethers.Contract(
    "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
    abi,
    signer2
  );

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
  const router12 = new ethers.Contract(
    "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
    abi,
    signer3
  );
  await toker.approve(
    "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
    ethers.parseEther("10000000000000000000000000000000000000000"),
    {
      nonce: nonce++,
    }
  );
  await token2.approve(
    "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
    ethers.parseEther("10000000000000000000000000000000000000000"),
    {
      nonce: nonce++,
    }
  );
  await token22.approve(
    "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
    ethers.parseEther("10000000000000000000000000000000000000000"),
    {
      nonce: nonce2++,
    }
  );

console.log(await toker.balanceOf("0x1beD8319Ad56780F303B226BfcA60BAd29db9e66"))
console.log(await toker.balanceOf("0x84D55D12384653d9e701F8eb74C60Ee9140A67b5"))
  let g2 = await toker.transfer(
    "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f",
    ethers.parseEther("1000000"),
    {
        nonce: nonce++
    }
  );
 console.log(await toker.balanceOf("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f"))
//   let a2 = await toker.balanceOf("0x84D55D12384653d9e701F8eb74C60Ee9140A67b5")

//   console.log(a, a2, b , b2)
//   await token122.transfer( await signer.getAddress(),
//    ethers.parseEther("100"))
//   await lit.mintPass( { nonce: nonce++ });
//   console.log("mint");
//   await nft.mintPass();
//   console.log("mint");
//   //await token.setLitPass("0x295929A981426148Cd4085d7e2e129e51DCEa84C", await nft.getIdFromOwner("0x295929A981426148Cd4085d7e2e129e51DCEa84C"),{nonce: nonce++})
//   console.log("mint");
//   await tokenOne.approve(
//     await lit.getAddress(),
//     ethers.parseEther("10000000000000000000000000000000000000000"),
//     {
//       nonce: nonce++,
//     }
//   );

//   await tokenX.approve(
//     "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
//     ethers.parseEther("10000000000000000000000000000000000000000"),
//     { nonce: nonce2++ }
//   );
//   //await lit.mintPass({ nonce: nonce++})

//   //await token.setLitpass("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f", await nft.getIdFromOwner("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f"), { nonce: nonce++})
//   console.log(
//     await lit.getIdFromOwner("0x1beD8319Ad56780F303B226BfcA60BAd29db9e66")
//   );
//   console.log(await classReg1.classRegistryCount());
//   console.log(
//     await toker.balanceOf("0x1beD8319Ad56780F303B226BfcA60BAd29db9e66")
//   );
//   console.log(
//     await toker.balanceOf("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")
//   );
//   await classReg1.setClass(userClass2, { nonce: nonce++ });
//   let g = await toker.transfer(
//     "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f",
//     ethers.parseEther("100000000"),
//     {
//       nonce: nonce++,
//     }
//   );
//   let g3 = await toker.transfer(
//     "0x84D55D12384653d9e701F8eb74C60Ee9140A67b5",
//     ethers.parseEther("100000000"),
//     {
//       nonce: nonce++,
//     }
//   );




 
   console.log(await toker.balanceOf("0x84D55D12384653d9e701F8eb74C60Ee9140A67b5"))
  await router.addLiquidityETH(
    await toker.getAddress(),
    ethers.parseEther("100000000"),
    "1",
    "1",
    "0x295929A981426148Cd4085d7e2e129e51DCEa84C",
    "999999999999999999999",
    { value: ethers.parseEther("100"), nonce: nonce++ }
  );
  console.log(await toker.balanceOf("0x84D55D12384653d9e701F8eb74C60Ee9140A67b5"))
  console.log(await toker.balanceOf("0x84D55D12384653d9e701F8eb74C60Ee9140A67b5"))
  await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
    ethers.parseEther("1000000"),
    "1",
    [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"],
    "0x295929A981426148Cd4085d7e2e129e51DCEa84C",
    "9999999999999999999999999",
    {
      nonce: nonce++,
    }
  );
  console.log(await toker.balanceOf("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f"))
  await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens( ethers.parseEther("100"), "1", [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], "0x295929A981426148Cd4085d7e2e129e51DCEa84C", "9999999999999999999999999", { nonce: nonce2++})
  
  console.log(
    await toker.balanceOf("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")
  );
  // await router12.swapExactTokensForTokensSupportingFeeOnTransferTokens( ethers.parseEther(".0001"), "1", ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await toker.getAddress(), ], "0x295929A981426148Cd4085d7e2e129e51DCEa84C", "9999999999999999999999999", {
  //     nonce: nonce3++
  // })

  await toker.transfer(
    "0x205f6448a64Ae37e8bA5D1c44ba888395980e131",
    ethers.parseEther("100"),
    {
      nonce: nonce++,
    }
  );
  // await classReg1.proposeClass(await userClass2.getAddress(), {
  //   nonce: nonce++,
  // });

  await toker.transfer(
    "0x321300E6897B21c096D83d14Aaf84C39AAf76d96",
    ethers.parseEther("100"),
    {
      nonce: nonce++,
    }
  );
//await classReg1.proposeClass(await userClass2.getAddress(), {     nonce: nonce++,});

  //await nft.turnOnDelegate(1n,  { nonce: nonce2++});
  // await classReg1.voteClass(
  //   await userClass2.getAddress(),
  //   "0x1bed8319ad56780f303b226bfca60bad29db9e66",
  //   { nonce: nonce++ }
  // );
  // console.log(await classReg1.getActiveClassTax());
  // console.log(await classReg1.getTotalProposals());
  //await nft.delegateNft("0x1bed8319ad56780f303b226bfca60bad29db9e66", 2n, 1n, { nonce: nonce2++})

  // await router.addLiquidityETH(
  //   await toker.getAddress(),
  //   ethers.parseEther("100000000"),
  //   "1",
  //   "1",
  //   "0x1bed8319ad56780f303b226bfca60bad29db9e66",
  //   "999999999999999999999",
  //   { value: ethers.parseEther("100"), nonce: nonce++ }
  // );

//   await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther("4300"),
//     "0",
//     [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"],
//     "0x1bed8319ad56780f303b226bfca60bad29db9e66",
//     "9999999999999999999999999",
//     {
//       nonce: nonce++,
//     }
//   );
//   console.log(
//     await token22.balanceOf("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")
//   );
//   await router.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther(".00001"),
//     "0",
//     ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await toker.getAddress()],
//     "0x1bed8319ad56780f303b226bfca60bad29db9e66",
//     "9999999999999999999999999",
//     {
//       nonce: nonce++,
//     }
//   );
//   console.log(
//     await toker.balanceOf("0x1bed8319ad56780f303b226bfca60bad29db9e66")
//   );

//   console.log(
//     await toker.balanceOf("0x46dfF191646bA20453c6F6D9C7ff60431C17f07B")
//   );
//   await toker.transfer(
//     "0x46dfF191646bA20453c6F6D9C7ff60431C17f07B",
//     ethers.parseEther("1000"),
//     {
//       nonce: nonce++,
//     }
//   );
//   console.log(
//     await toker.balanceOf("0x46dfF191646bA20453c6F6D9C7ff60431C17f07B")
//   );
//   await tokenX.transfer(
//     "0x46dfF191646bA20453c6F6D9C7ff60431C17f07B",
//     ethers.parseEther("1000"),
//     {
//       nonce: nonce2++,
//     }
//   );
//   console.log(
//     await toker.balanceOf("0x46dfF191646bA20453c6F6D9C7ff60431C17f07B")
//   );
//   console.log(
//     await toker.balanceOf("0x1bed8319ad56780f303b226bfca60bad29db9e66")
//   );
//   // console.log(await token22.balanceOf('0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f'))
//   await tokenX.approve(
//     "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
//     ethers.parseEther("10000000000000000000000000"),
//     { nonce: nonce2++ }
//   );
//   await token22.approve(
//     "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
//     ethers.parseEther("10000000000000000000000000"),
//     { nonce: nonce2++ }
//   );
//   await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther("430000"),
//     "0",
//     [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"],
//     "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f",
//     "9999999999999999999999999",
//     {
//       nonce: nonce2++,
//     }
//   );
//   console.log(
//     await token22.balanceOf("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")
//   );
//   await router2.swapExactTokensForTokensSupportingFeeOnTransferTokens(
//     ethers.parseEther(".00001"),
//     "0",
//     ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await toker.getAddress()],
//     "0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f",
//     "9999999999999999999999999",
//     {
//       nonce: nonce2++,
//     }
//   );



//   console.log(await classReg1.getActiveClassTax());
//   // try{
//   //     await lit.mintPass({ nonce: nonce++})
//   // } catch(e){
//   //     console.log(e)
//   // }
//   // console.log(await lit.calculateBurn.staticCall(1n))

//   console.log(
//     await lit.getIdFromOwner("0x90Eb5C565f188bd73C3A6714d9daf21854A4B25f")
//   );

  // console.log(await lit.calculateBurn.staticCall(1n))
  // console.log(await nft.calculateBurn.staticCall(2n))
  // console.log(await classReg1.getProposed((await userClass1.getAddress())))
  // await classReg1.voteClass(await userClass1.getAddress(), "0x295929A981426148Cd4085d7e2e129e51DCEa84C", { nonce: nonce++})
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
