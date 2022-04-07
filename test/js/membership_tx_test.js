//  sends a tx enacting the `register` function of the `Membership` contract

var Web3 = require('web3')
var web3 = new Web3('HTTP://127.0.0.1:8540')

var abi = [
  {
    "inputs": [],
    "stateMutability": "nonpayable",
    "type": "constructor"
  },
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "pubkey",
        "type": "uint256"
      },
      {
        "indexed": true,
        "internalType": "uint256",
        "name": "index",
        "type": "uint256"
      }
    ],
    "name": "MemberRegistered",
    "type": "event"
  },
  {
    "inputs": [],
    "name": "MEMBERSHIP_DEPOSIT",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [],
    "name": "SET_SIZE",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "name": "members",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [],
    "name": "pubkeyIndex",
    "outputs": [
      {
        "internalType": "uint256",
        "name": "",
        "type": "uint256"
      }
    ],
    "stateMutability": "view",
    "type": "function",
    "constant": true
  },
  {
    "inputs": [
      {
        "internalType": "uint256",
        "name": "pubkey",
        "type": "uint256"
      }
    ],
    "name": "register",
    "outputs": [],
    "stateMutability": "payable",
    "type": "function",
    "payable": true
  }
];
var contract_address = '0x663512ee4a68cb3B4164AD252B8f27b15f20b6c4';
var contract = new web3.eth.Contract(abi, contract_address);

var pk = 900;
web3.eth.getAccounts().then(e => 
  contract.methods.register(pk).send({from:e[0], value: 5}).then(function(receipt){
    // receipt can also be a new contract instance, when coming from a "contract.deploy({...}).send()"
  })
);