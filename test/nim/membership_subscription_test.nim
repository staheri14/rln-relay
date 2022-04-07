import 
  std/options, sequtils, times,
  testutils/unittests, chronos, chronicles, stint, web3, json,
  stew/byteutils, stew/shims/net as stewNet


contract(Membership):
  proc register(pubkey: Uint256) # external payable
  proc MemberRegistered(pubkey: Uint256, index: Uint256) {.event.}

const 
  ETH_CLIENT = "ws://localhost:8540/"
  MembershipFee = 5.u256
procSuite "Waku rln relay":
  asyncTest  "event subscription rln": 
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
    var contractObj = web3.contractSender(Membership, Address("0x663512ee4a68cb3B4164AD252B8f27b15f20b6c4".hexToByteArray(20))) # creates a Sender object with a web3 field and contract address of type Address
    echo "create obj done"

    # # send takes three parameters, c: ContractCallBase, value = 0.u256, gas = 3000000'u64 gasPrice = 0 
    # # should use send proc for the contract functions that update the state of the contract
    let tx = await contractObj.register(77.u256).send(value = MembershipFee)
    debug "The hash of registration tx: ", tx # value is the membership fee
    echo "tx sent"


    var fut = newFuture[void]()

    let s = await contractObj.subscribe(MemberRegistered, %*{"fromBlock": "0x0"}) do(
      pubkey: Uint256, index: Uint256){.raises: [Defect], gcsafe.}:
      try:
        echo "onDeposit"
        echo "pubkey", pubkey
        echo "index", index
        #  fut.complete()
      except Exception as err:
        # chronos still raises exceptions which inherit directly from Exception
        doAssert false, err.msg
    do (err: CatchableError):
        echo "Error from DepositEvent subscription: ", err.msg

    
    await fut
    await web3.close()