const { expect } = require("chai");
const { ethers } = require("hardhat");

describe("Deployment of Contracts", function () {
  let libRegistry, atropaMath, token, flatRateTaxCalculator;
  let timeBasedTaxCalculator1, timeBasedTaxCalculator2, stakingIncentiveTaxCalculator;
  let signer, signer2;

  before(async function () {
    const provider = new ethers.JsonRpcProvider("http://127.0.0.1:8545/");
    signer = new ethers.Wallet(process.env.PK, provider);
    signer2 = new ethers.Wallet(process.env.PK1, provider);
  });

  it("Should deploy LibRegistry and AtropaMath", async function () {
    const LibRegistry = await ethers.getContractFactory("LibRegistry");
    libRegistry = await LibRegistry.deploy();

    const AtropaMath = await ethers.getContractFactory("AtropaMath");
    atropaMath = await AtropaMath.deploy();

    expect(libRegistry.address).to.properAddress;
    expect(atropaMath.address).to.properAddress;
  });

  it("Should deploy MyTokenMock", async function () {
    const MyTokenMock = await ethers.getContractFactory("MyTokenMock");
    token = await MyTokenMock.deploy("TokenName", "TKN", "18", "1000000000000000000000000000000");

    expect(token.address).to.properAddress;
  });

  it("Should deploy FlatRateTaxCalculator", async function () {
    const FlatRateTaxCalculator = await ethers.getContractFactory("FlatRateTaxCalculator");
    flatRateTaxCalculator = await FlatRateTaxCalculator.deploy("1000");

    expect(flatRateTaxCalculator.address).to.properAddress;
  });

  it("Should deploy TimeBasedTaxCalculators", async function () {
    const TimeBasedTaxCalculator = await ethers.getContractFactory("TimeBasedTaxCalculator");
    timeBasedTaxCalculator1 = await TimeBasedTaxCalculator.deploy("2000", "10", "2", "15");
    timeBasedTaxCalculator2 = await TimeBasedTaxCalculator.deploy("10", "2000", "2", "15");

    expect(timeBasedTaxCalculator1.address).to.properAddress;
    expect(timeBasedTaxCalculator2.address).to.properAddress;
  });

  it("Should deploy StakingIncentiveTaxCalculator", async function () {
    const StakingIncentiveTaxCalculator = await ethers.getContractFactory("StakingIncentiveTaxCalculator", {
      libraries: {
        AtropaMath: atropaMath.address,
        LibRegistry: libRegistry.address,
      },
    });

    stakingIncentiveTaxCalculator = await StakingIncentiveTaxCalculator.deploy(
      "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
      "0x165C3410fC91EF562C50559f7d2289fEbed552d9",
      "-300",
      "6000"
    );

    expect(stakingIncentiveTaxCalculator.address).to.properAddress;
  });

  it("Should transfer tokens between signers", async function () {
    await token.transfer(signer2.address, ethers.parseEther("1000"));
    const signerBalance = await token.balanceOf(signer.address);
    const signer2Balance = await token.balanceOf(signer2.address);

    expect(signerBalance).to.be.below(ethers.parseEther("1000"));
    expect(signer2Balance).to.equal(ethers.parseEther("1000"));
  });
});