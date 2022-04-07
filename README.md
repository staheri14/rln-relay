# Contract Deployment on Ganache
- Install and Run [Ganache](https://trufflesuite.com/ganache/index.html) on `127.0.0.1:8540`
- Run `truffle deploy` in the project directory (contracts will be deployed to Ganache)
- Inspect and copy the address of the deployed contracts i.e., `Faucet` and `Membership`. 

# Running tests
- Nim tests: Navigate to the test folders `test/nim`, replace the `contractAddress` variable with the address of the deployed contract. The file names are prefixed with their corresponding contract.
- JS tests: Navigate to the test folders `test/js`, replace the `contract_address` variable with the address of the deployed contract. The file names are prefixed with their corresponding contract.