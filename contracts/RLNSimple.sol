// SPDX-License-Identifier: MIT
pragma solidity 0.7.4;

contract RLNSimple {
	uint256 public immutable MEMBERSHIP_DEPOSIT;
	uint256 public immutable DEPTH;
	uint256 public immutable SET_SIZE;

	uint256 public pubkeyIndex = 0;
	mapping(uint256 => uint256) public members;

	event MemberRegistered(uint256 indexed pubkey, uint256 indexed index);

	constructor 
  (uint256 membershipDeposit,
		uint256 depth
	) {
		MEMBERSHIP_DEPOSIT = membershipDeposit;
		DEPTH = depth;
		SET_SIZE = 1 << depth;
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
