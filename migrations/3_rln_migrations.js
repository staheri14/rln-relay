const PoseidonHasher = artifacts.require("./crypto/PoseidonHasher");

// var address
// module.exports = function(deployer) {
//   deployer.deploy(PoseidonHasher)

//     // Option 2) Console log the address:
//     .then(() => address = PoseidonHasher.address)

//     // Option 3) Retrieve the contract instance and get the address from that:
//     // .then(() => SimpleStorage.deployed())
//     // .then(_instance => console.log(_instance.address));
// };
var deposit = web3.utils.toBN(5);
var depth = web3.utils.toBN(40);
const RLN = artifacts.require("RLN");
module.exports = function (deployer) {
  deployer.deploy(RLN, deposit, depth);
};