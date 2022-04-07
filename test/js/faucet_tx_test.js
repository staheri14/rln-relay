//  sends a tx enacting the `withdraw` function of the `Faucet` contract

var Web3 = require('web3')
var web3 = new Web3('HTTP://127.0.0.1:8540')

var abi = [
  {
    "anonymous": false,
    "inputs": [
      {
        "indexed": false,
        "internalType": "address",
        "name": "from",
        "type": "address"
      },
      {
        "indexed": false,
        "internalType": "uint256",
        "name": "withdraw_amount",
        "type": "uint256"
      }
    ],
    "name": "Withdraw",
    "type": "event"
  },
  {
    "payable": true,
    "stateMutability": "payable",
    "type": "fallback"
  },
  {
    "constant": false,
    "inputs": [
      {
        "internalType": "uint256",
        "name": "withdraw_amount",
        "type": "uint256"
      }
    ],
    "name": "withdraw",
    "outputs": [],
    "payable": false,
    "stateMutability": "nonpayable",
    "type": "function"
  }
]
var contract_address = '0x3A41381ebe117E475182A154c92Ef1644C2047e1'
var contract = new web3.eth.Contract(abi, contract_address)


web3.eth.getAccounts().then(e => 
  contract.methods.withdraw(0).send({from:e[0]}).then(function(receipt){
    // receipt can also be a new contract instance, when coming from a "contract.deploy({...}).send()"
  })
);



