const RLNSimple = artifacts.require("RLNSimple");

var deposit = web3.utils.toBN(5);
var depth = web3.utils.toBN(40);
module.exports = function (deployer) {
  deployer.deploy(RLNSimple, deposit, depth);
};