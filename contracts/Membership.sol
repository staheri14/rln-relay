// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

contract Membership {
	uint256 public immutable MEMBERSHIP_DEPOSIT;
	uint256 public immutable SET_SIZE;
	uint256 public pubkeyIndex = 0;
	mapping(uint256 => uint256) public members;

	event MemberRegistered(uint256 indexed pubkey, uint256 indexed index);

	constructor() {
		MEMBERSHIP_DEPOSIT = 5;
		SET_SIZE = 100;
	}

	function register(uint256 pubkey) external payable {
		require(pubkeyIndex < SET_SIZE, "RLN, register: set is full");
		require(msg.value == MEMBERSHIP_DEPOSIT, "RLN, register: membership deposit is not satisfied");
		_register(pubkey);
	}

	function _register(uint256 pubkey) internal {
		members[pubkeyIndex] = pubkey;
		pubkeyIndex += 1;
		emit MemberRegistered(pubkey, pubkeyIndex);	
	}
}
