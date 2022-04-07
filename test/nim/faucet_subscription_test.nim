{.used.}

import
  std/options, sequtils, times,
  testutils/unittests,
  chronos, chronicles, stint, web3, json,
  stew/byteutils, stew/shims/net as stewNet

contract(Faucet):
  proc withdraw(amount: Uint256) # external payable 
  proc Withdraw(address: Address, amount: Uint256) {.event.}

const ETH_CLIENT* = "ws://localhost:8540/"

procSuite "Waku rln relay":
  asyncTest  "event subscription faucet":
    echo "hello"
    if true: 
      debug "ethereum client address", ETH_CLIENT
      # let contractAddress = await uploadContract(ETH_CLIENT)
      # connect to the eth client
      let web3 = await newWeb3(ETH_CLIENT)
      debug "web3 connected to", ETH_CLIENT 

      # fetch the list of registered accounts
      let accounts = await web3.provider.eth_accounts()
      web3.defaultAccount = accounts[2]
      debug "contract deployer account address ", defaultAccount=web3.defaultAccount 

      # prepare a contract sender to interact with it
      var contractObj = web3.contractSender(Faucet, Address("0x3A41381ebe117E475182A154c92Ef1644C2047e1".hexToByteArray(20))) # creates a Sender object with a web3 field and contract address of type Address
      echo "create obj done"

      var fut = newFuture[void]()
      # int count = 0;

      let s = await contractObj.subscribe(Withdraw, %*{"fromBlock": "0x0"}) do(
        address: Address, amount: Uint256){.raises: [Defect], gcsafe.}:
        try:
          echo "onDeposit"
          echo "address", address
          echo "amount", amount
          #  fut.complete()
        except Exception as err:
          # chronos still raises exceptions which inherit directly from Exception
          doAssert false, err.msg
      do (err: CatchableError):
          echo "Error from DepositEvent subscription: ", err.msg

      # discard await contractObj.withdraw(0.u256).send()
      # echo "tx sent"

      await fut
      await web3.close()
 