require("@nomicfoundation/hardhat-toolbox");
// require("@nomiclabs/hardhat-ethers");
// require("@nomiclabs/hardhat-waffle");
require("dotenv").config();

const SEPOILA_URL = process.env.SEPOILA_URL;
const PRIVATE_KEY = process.env.PRIVATE_KEY;

/** @type import('hardhat/config').HardhatUserConfig */

module.exports = {
  solidity: "0.8.18",
  networks: {
    sepoila: {
      url: SEPOILA_URL,
      accounts: [PRIVATE_KEY]
    }
  }
};
