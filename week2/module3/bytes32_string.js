const { ethers } = require("ethers");

let text = "Buidling with Devfolio!"

let bytes32 = ethers.utils.formatBytes32String(text)

let originalText = ethers.utils.parseBytes32String(bytes32)

console.log(bytes32);
console.log(originalText);