var deposit = web3.utils.toBN(5);
var depth = web3.utils.toBN(40);
const RLN = artifacts.require("RLN");
module.exports = function (deployer) {
  deployer.deploy(RLN, deposit, depth);
};