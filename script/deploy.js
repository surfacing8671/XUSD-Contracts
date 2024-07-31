const { AbiCoder } = require("ethers");
const { ethers} = require("hardhat");

/*
 If you have contracts with similar byte-codes, you can use the scripts in this format for verification
 npx hardhat verify --network <network-name> <contract-address> --contract "contracts/Tokens/TokenETH.sol:TokenETH(contract file path)" 
 */
let abi = [
    {
        "inputs": [
            {
                "internalType": "address",
                "name": "_factory",
                "type": "address"
            },
            {
                "internalType": "address",
                "name": "_WPLS",
                "type": "address"
            }
        ],
        "type": "constructor"
    },
    {
        "inputs": [],
        "name": "WPLS",
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
                "name": "tokenA",
                "type": "address"
            },
            {
                "internalType": "address",
                "name": "tokenB",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "amountADesired",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountBDesired",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountAMin",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountBMin",
                "type": "uint256"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "addLiquidity",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "amountA",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountB",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "liquidity",
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
                "name": "token",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "amountTokenDesired",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountTokenMin",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountETHMin",
                "type": "uint256"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "addLiquidityETH",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "amountToken",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountETH",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "liquidity",
                "type": "uint256"
            }
        ],
        "stateMutability": "payable",
        "type": "function"
    },
    {
        "inputs": [],
        "name": "factory",
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
                "name": "amountOut",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "reserveIn",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "reserveOut",
                "type": "uint256"
            }
        ],
        "name": "getAmountIn",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "amountIn",
                "type": "uint256"
            }
        ],
        "stateMutability": "pure",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountIn",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "reserveIn",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "reserveOut",
                "type": "uint256"
            }
        ],
        "name": "getAmountOut",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "amountOut",
                "type": "uint256"
            }
        ],
        "stateMutability": "pure",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountOut",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            }
        ],
        "name": "getAmountsIn",
        "outputs": [
            {
                "internalType": "uint256[]",
                "name": "amounts",
                "type": "uint256[]"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountIn",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            }
        ],
        "name": "getAmountsOut",
        "outputs": [
            {
                "internalType": "uint256[]",
                "name": "amounts",
                "type": "uint256[]"
            }
        ],
        "stateMutability": "view",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountA",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "reserveA",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "reserveB",
                "type": "uint256"
            }
        ],
        "name": "quote",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "amountB",
                "type": "uint256"
            }
        ],
        "stateMutability": "pure",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "address",
                "name": "tokenA",
                "type": "address"
            },
            {
                "internalType": "address",
                "name": "tokenB",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "liquidity",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountAMin",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountBMin",
                "type": "uint256"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "removeLiquidity",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "amountA",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountB",
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
                "name": "token",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "liquidity",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountTokenMin",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountETHMin",
                "type": "uint256"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "removeLiquidityETH",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "amountToken",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountETH",
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
                "name": "token",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "liquidity",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountTokenMin",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountETHMin",
                "type": "uint256"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "removeLiquidityETHSupportingFeeOnTransferTokens",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "amountETH",
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
                "name": "token",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "liquidity",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountTokenMin",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountETHMin",
                "type": "uint256"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            },
            {
                "internalType": "bool",
                "name": "approveMax",
                "type": "bool"
            },
            {
                "internalType": "uint8",
                "name": "v",
                "type": "uint8"
            },
            {
                "internalType": "bytes32",
                "name": "r",
                "type": "bytes32"
            },
            {
                "internalType": "bytes32",
                "name": "s",
                "type": "bytes32"
            }
        ],
        "name": "removeLiquidityETHWithPermit",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "amountToken",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountETH",
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
                "name": "token",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "liquidity",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountTokenMin",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountETHMin",
                "type": "uint256"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            },
            {
                "internalType": "bool",
                "name": "approveMax",
                "type": "bool"
            },
            {
                "internalType": "uint8",
                "name": "v",
                "type": "uint8"
            },
            {
                "internalType": "bytes32",
                "name": "r",
                "type": "bytes32"
            },
            {
                "internalType": "bytes32",
                "name": "s",
                "type": "bytes32"
            }
        ],
        "name": "removeLiquidityETHWithPermitSupportingFeeOnTransferTokens",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "amountETH",
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
                "name": "tokenA",
                "type": "address"
            },
            {
                "internalType": "address",
                "name": "tokenB",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "liquidity",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountAMin",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountBMin",
                "type": "uint256"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            },
            {
                "internalType": "bool",
                "name": "approveMax",
                "type": "bool"
            },
            {
                "internalType": "uint8",
                "name": "v",
                "type": "uint8"
            },
            {
                "internalType": "bytes32",
                "name": "r",
                "type": "bytes32"
            },
            {
                "internalType": "bytes32",
                "name": "s",
                "type": "bytes32"
            }
        ],
        "name": "removeLiquidityWithPermit",
        "outputs": [
            {
                "internalType": "uint256",
                "name": "amountA",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountB",
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
                "name": "amountOut",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "swapETHForExactTokens",
        "outputs": [
            {
                "internalType": "uint256[]",
                "name": "amounts",
                "type": "uint256[]"
            }
        ],
        "stateMutability": "payable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountOutMin",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "swapExactETHForTokens",
        "outputs": [
            {
                "internalType": "uint256[]",
                "name": "amounts",
                "type": "uint256[]"
            }
        ],
        "stateMutability": "payable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountOutMin",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "swapExactETHForTokensSupportingFeeOnTransferTokens",
        "outputs": [],
        "stateMutability": "payable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountIn",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountOutMin",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "swapExactTokensForETH",
        "outputs": [
            {
                "internalType": "uint256[]",
                "name": "amounts",
                "type": "uint256[]"
            }
        ],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountIn",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountOutMin",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "swapExactTokensForETHSupportingFeeOnTransferTokens",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountIn",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountOutMin",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "swapExactTokensForTokens",
        "outputs": [
            {
                "internalType": "uint256[]",
                "name": "amounts",
                "type": "uint256[]"
            }
        ],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountIn",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountOutMin",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "swapExactTokensForTokensSupportingFeeOnTransferTokens",
        "outputs": [],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountOut",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountInMax",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "swapTokensForExactETH",
        "outputs": [
            {
                "internalType": "uint256[]",
                "name": "amounts",
                "type": "uint256[]"
            }
        ],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "inputs": [
            {
                "internalType": "uint256",
                "name": "amountOut",
                "type": "uint256"
            },
            {
                "internalType": "uint256",
                "name": "amountInMax",
                "type": "uint256"
            },
            {
                "internalType": "address[]",
                "name": "path",
                "type": "address[]"
            },
            {
                "internalType": "address",
                "name": "to",
                "type": "address"
            },
            {
                "internalType": "uint256",
                "name": "deadline",
                "type": "uint256"
            }
        ],
        "name": "swapTokensForExactTokens",
        "outputs": [
            {
                "internalType": "uint256[]",
                "name": "amounts",
                "type": "uint256[]"
            }
        ],
        "stateMutability": "nonpayable",
        "type": "function"
    },
    {
        "type": "receive"
    }
]
// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
async function deployRouter() {
    let privider = new ethers.JsonRpcProvider("http://127.0.0.1:8545/")
    
    const signer = new ethers.Wallet(process.env.PK, privider)
    let nonce = await privider.getTransactionCount("0x1bed8319ad56780f303b226bfca60bad29db9e66")

     const class21 = await ethers.getContractFactory(`MyTokenMock`);
    // const class13 = await ethers.getContractFactory(`LibRegistry2`);
     const tx1 = await class21.deploy("A", "A", "18", ethers.parseEther('10000000000000000000000'), {
        nonce: nonce++
    });

 

   // const lib1 = await ethers.getContractFactory(`Expireable`);
    const lib2 = await ethers.getContractFactory(`LibRegistry`);
    const lib3 = await ethers.getContractFactory(`AtropaMath`);

    // const lib1C = await lib1.deploy({
    //     nonce: nonce++
    // });
   // console.log(await lib1C.getAddress())
    const lib2C = await lib2.deploy({
        nonce: nonce++
    });
    const lib3C = await lib3.deploy({
        nonce: nonce++
    });

    const class1 = await ethers.getContractFactory(`BasicUserClass`);
    const class2 = await ethers.getContractFactory(`SenderActivateClass`,{libraries: {
        AtropaMath:  await lib3C.getAddress()}});

         
    const userClass1 = await class1.deploy(2500, 1, {
        nonce: nonce++
    });
    // const tx2 = await class13.deploy();
  //  console.log(await tx1.getAddress())
    const userClass2 = await class1.deploy(-1000, 1,{
        nonce: nonce++
    });

    const senderClass = await class2.deploy(2500, 0, {
        nonce: nonce++
    });

    const senderClass2 = await class2.deploy(1500, 0, {
        nonce: nonce++
    });
    console.log(await userClass1.getAddress());
//    // await class1T.waitForDeployment()
//    console.log(await lib3C.getAddress())
    const Token = await ethers.getContractFactory(`TUSDRegistry`, {libraries: {
        AtropaMath:  await lib3C.getAddress(),
        // Expireable:  await lib1C.getAddress(),
        LibRegistry:  await lib2C.getAddress(),
      }});
    const token = await Token.deploy( {
        nonce: nonce++
    }
    );

    console.log(await token.getAddress())
await token.waitForDeployment()
userClass1.updateClassRegistry(await token.getAddress(), {
        nonce: nonce++
    })
 await   tx1.setRegistry(await token.getAddress(), {
    nonce: nonce++
})
userClass2.updateClassRegistry(await token.getAddress(), {
        nonce: nonce++
    })


    senderClass.updateClassRegistry(await token.getAddress(), {
        nonce: nonce++
    })

// await class1T2.addSignatureAdd("0x23b872dd", "0x165C3410fC91EF562C50559f7d2289fEbed552d9", {
//     nonce: nonce++
// })
senderClass.addSenderAdd("0x165C3410fC91EF562C50559f7d2289fEbed552d9", {nonce: nonce++})
 //   await tx1.mint("0x1bed8319ad56780f303b226bfca60bad29db9e66", ethers.parseEther("1000000000"))

    await token.addClass(await userClass1.getAddress(), {
        nonce: nonce++
    })
     await token.addClass(await userClass2.getAddress(), {
        nonce: nonce++
    })
    await token.addClass(await senderClass.getAddress(), {
        nonce: nonce++
    })
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

let arc20Abi = [
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
          "name": "spender",
          "type": "address"
        },
        {
          "indexed": false,
          "internalType": "uint256",
          "name": "value",
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
          "indexed": false,
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "Transfer",
      "type": "event"
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
          "name": "spender",
          "type": "address"
        }
      ],
      "name": "allowance",
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
          "name": "spender",
          "type": "address"
        },
        {
          "internalType": "uint256",
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "approve",
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
          "name": "account",
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
      "inputs": [],
      "name": "totalSupply",
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
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "transfer",
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
          "name": "value",
          "type": "uint256"
        }
      ],
      "name": "transferFrom",
      "outputs": [
        {
          "internalType": "bool",
          "name": "",
          "type": "bool"
        }
      ],
      "stateMutability": "nonpayable",
      "type": "function"
    }
  ]

// await token.addClassToContract("0xc7a8bac2a7545bc33e799cc1ff60d648c57ccbeb", class1T21, true)

 const router = new ethers.Contract("0x165C3410fC91EF562C50559f7d2289fEbed552d9", abi, signer)
 const token2 = new ethers.Contract("0xA1077a294dDE1B09bB078844df40758a5D0f9a27", arc20Abi, signer)
 await tx1.approve("0x165C3410fC91EF562C50559f7d2289fEbed552d9", ethers.parseEther("10000000000000000000000000000000000000000"),  {
    nonce: nonce++
})
 await token2.approve("0x165C3410fC91EF562C50559f7d2289fEbed552d9", ethers.parseEther("10000000000000000000000000000000000000000"), {
    nonce: nonce++
})
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))
console.log(await tx1.balanceOf('0x850AeAfCaEd8f7CF409843840Cb8c4C6146AC04C'))
await tx1.transfer("0x850AeAfCaEd8f7CF409843840Cb8c4C6146AC04C", ethers.parseEther('100'), {
    nonce: nonce++
})
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))

console.log(await tx1.balanceOf('0x850AeAfCaEd8f7CF409843840Cb8c4C6146AC04C'))
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))

await router.addLiquidityETH(await tx1.getAddress(), ethers.parseEther("100000000"), "1", "1", "0x1bed8319ad56780f303b226bfca60bad29db9e66", "999999999999999999999", {value: ethers.parseEther("1000000"), nonce: nonce++})
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))
await router.swapExactTokensForTokensSupportingFeeOnTransferTokens( ethers.parseEther("1000000"), "1", [await tx1.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], "0x1bed8319ad56780f303b226bfca60bad29db9e66", "9999999999999999999999999", {
    nonce: nonce++
})
senderClass.addSenderSub("0x165C3410fC91EF562C50559f7d2289fEbed552d9", {nonce: nonce++})
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))
await router.swapExactTokensForTokensSupportingFeeOnTransferTokens( ethers.parseEther("10"), "1", ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await tx1.getAddress(), ], "0x1bed8319ad56780f303b226bfca60bad29db9e66", "9999999999999999999999999", {
    nonce: nonce++
})
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))

console.log(await tx1.balanceOf('0x205f6448a64Ae37e8bA5D1c44ba888395980e131'))
await tx1.transfer("0x205f6448a64Ae37e8bA5D1c44ba888395980e131", ethers.parseEther('100'), {
    nonce: nonce++
})

console.log(await tx1.balanceOf('0x205f6448a64Ae37e8bA5D1c44ba888395980e131'))
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))

console.log(await tx1.balanceOf('0x321300E6897B21c096D83d14Aaf84C39AAf76d96'))
await tx1.transfer("0x321300E6897B21c096D83d14Aaf84C39AAf76d96", ethers.parseEther('100'), {
    nonce: nonce++
})
console.log(await tx1.balanceOf('0x321300E6897B21c096D83d14Aaf84C39AAf76d96'))
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))

await router.addLiquidityETH(await tx1.getAddress(), ethers.parseEther("100000000"), "1", "1", "0x1bed8319ad56780f303b226bfca60bad29db9e66", "999999999999999999999", {value: ethers.parseEther("1000000"), nonce: nonce++})
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))
await router.swapExactTokensForTokensSupportingFeeOnTransferTokens( ethers.parseEther("1000000"), "1", [await tx1.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"], "0x1bed8319ad56780f303b226bfca60bad29db9e66", "9999999999999999999999999", {
    nonce: nonce++
})
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))
await router.swapExactTokensForTokensSupportingFeeOnTransferTokens( ethers.parseEther("10"), "1", ["0xA1077a294dDE1B09bB078844df40758a5D0f9a27", await tx1.getAddress(), ], "0x1bed8319ad56780f303b226bfca60bad29db9e66", "9999999999999999999999999", {
    nonce: nonce++
})
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))

console.log(await tx1.balanceOf('0x46dfF191646bA20453c6F6D9C7ff60431C17f07B'))
await tx1.transfer("0x46dfF191646bA20453c6F6D9C7ff60431C17f07B", ethers.parseEther('100'), {
    nonce: nonce++
})
console.log(await tx1.balanceOf('0x46dfF191646bA20453c6F6D9C7ff60431C17f07B'))
console.log(await tx1.balanceOf('0x1bed8319ad56780f303b226bfca60bad29db9e66'))
     console.log(await token.returnFunctionSelectorFromSignature("transfer(address,uint256)"))
// //     // console.log(await token.classList[await class1T.getAddress()])
// // // console.log(g)
// // // console.log(await token.classesShow())
// //    //await token.addClassToUser(await class1T.getAddress(), "0x1beD8319Ad56780F303B226BfcA60BAd29db9e66")
// //  await token.setFees("transferFrom(address,address,uint256)", [await class1T.getAddress(), await class1T2.getAddress()], [-100, 200])

// //  //console.log(await token.getClassFee(await class1T.getAddress(), await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)")))
// // //  let sel = await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)")
// //console.log(await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)"))
//  console.log(await token.processTransaction.staticCall("0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x165C3410fC91EF562C50559f7d2289fEbed552d9", "0x165C3410fC91EF562C50559f7d2289fEbed552d9", "0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x23b872dd"))
// // // console.log(sel)
// // //  let g = await token.getClassFee(await class1T.getAddress(), '0x23b872dd')
// //     console.log(g);
// await token.addClassToUser("0x1bed8319ad56780f303b226bfca60bad29db9e66", await class1T2.getAddress())
// console.log(await token.getUser("0x1bed8319ad56780f303b226bfca60bad29db9e66"))

//await token.processTransaction("0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x850AeAfCaEd8f7CF409843840Cb8c4C6146AC04C", await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)"))

// console.log(await token.processTransaction.staticCall("0x1bed8319ad56780f303b226bfca60bad29db9e66", "0x850AeAfCaEd8f7CF409843840Cb8c4C6146AC04C", await token.returnFunctionSelectorFromSignature("transferFrom(address,address,uint256)")))

};

// eslint-disable-next-line @typescript-eslint/explicit-function-return-type
async function deployFactory() {
    const Token = await ethers.getContractFactory(`SniperWalletFactory`);
    const token = await Token.deploy(666);
    console.log(`deployed to: `, token.address);
};


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
    .catch(error => {
        console.error(error);
        process.exitCode = 1;
    });
