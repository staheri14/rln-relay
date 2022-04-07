// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

contract Faucet {

    event Withdraw(address from, uint withdraw_amount);
    function withdraw(uint withdraw_amount) public {
        require(withdraw_amount <= 100000000000000000);
        msg.sender.transfer(withdraw_amount);

        emit Withdraw(msg.sender, withdraw_amount);
    }

    // function receive() external payable {}

}