[signer, signer2] = await ethers.getSigners();

// Deploy libraries
LibRegistry = await ethers.getContractFactory("LibRegistry");
AtropaMath = await ethers.getContractFactory("AtropaMath");
lib2C = await LibRegistry.deploy();
lib3C = await AtropaMath.deploy();

// Deploy token
MyTokenMock = await ethers.getContractFactory("MyTokenMock");
toker = await MyTokenMock.deploy("d", "d", "18", "1000000000000000000000000000000", );

// Deploy ClassRegistry with libraries
const ClassRegistry = await ethers.getContractFactory("ClassRegistry", {
    libraries: {
        AtropaMath: await lib3C.getAddress(),
        LibRegistry: await lib2C.getAddress(),
    },
});
token = await ClassRegistry.deploy();

// Deploy classes
FlatRateTaxCalculator = await ethers.getContractFactory("FlatRateTaxCalculator");
TimeBasedTaxCalculator = await ethers.getContractFactory("TimeBasedTaxCalculator");
StakingIncentiveTaxCalculator = await ethers.getContractFactory("StakingIncentiveTaxCalculator", {
    libraries: {
        AtropaMath: await lib3C.getAddress(),
        LibRegistry: await lib2C.getAddress(),
    },
});

big = await FlatRateTaxCalculator.deploy("1000", );
userClass1 = await TimeBasedTaxCalculator.deploy("2000", "10", "2", "15", );
userClass2 = await TimeBasedTaxCalculator.deploy("10", "2000", "2", "15", );
userClass3 = await StakingIncentiveTaxCalculator.deploy(signer.address, signer2.address, "-300", "6000", );
});

it("Should deploy contracts correctly", async function () {
expect(await lib2C.getAddress()).to.properAddress;
expect(await lib3C.getAddress()).to.properAddress;
expect(await token.getAddress()).to.properAddress;
expect(await toker.balanceOf(signer.address)).to.equal(ethers.parseEther("1000000000000000000000000000000"));
});

it("Should add liquidity and perform token swaps", async function () {
const router = await ethers.getContractFactory("PulseXRouter02");
const routerDeployed = await router.deploy(); // Assuming Router contract doesn't need constructor args

// Add liquidity
await toker.approve(routerDeployed.address, ethers.parseEther("100000000"));
await routerDeployed.addLiquidityETH(
    await toker.getAddress(),
    ethers.parseEther("100000000"),
    "1",
    "1",
    signer.address,
    "999999999999999999999",
    { value: ethers.parseEther("100"), nonce: nonce++ }
);

// Swap tokens
await toker.approve(routerDeployed.address, ethers.parseEther("1000000"));
await routerDeployed.swapExactTokensForTokensSupportingFeeOnTransferTokens(
    ethers.utils.parseEther("1000000"),
    "1",
    [await toker.getAddress(), "0xA1077a294dDE1B09bB078844df40758a5D0f9a27"],
    signer.address,
    "9999999999999999999999999",
    
);

// Check balances after swap
const balanceSigner = await toker.balanceOf(signer.address);
const balanceSigner2 = await toker.balanceOf(signer2.address);

console.log("Balance of signer after swap: ", balanceSigner.toString());
console.log("Balance of signer2 after swap: ", balanceSigner2.toString());
