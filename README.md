# Contract Deployment on Ganache
- Install and Run [Ganache](https://trufflesuite.com/ganache/index.html) on `127.0.0.1:8540`
- Link the truffle project to Ganach: Go to the `setting -> Workspace` in Ganache and add the address of the `truffle-config.js` file to the `TRUFFLE PROJECTS` section. Save and restart Ganache.
- Run `truffle deploy` in the project directory (contracts will be deployed to Ganache)
- Inspect and copy the address of the deployed contracts i.e., `Faucet` and `Membership` under the `Contracts` tab of Ganache. 

# Running tests
- Nim tests: Navigate to the test folders `test/nim`, replace the `contractAddress` variable with the address of the deployed contract. The file names are prefixed with their corresponding contract.
- JS tests: Navigate to the test folders `test/js`, replace the `contract_address` variable with the address of the deployed contract. The file names are prefixed with their corresponding contract.