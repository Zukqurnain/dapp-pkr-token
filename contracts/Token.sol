//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Token {
  string public name = "PKR Token";
  string public symbol = "PKR";
  uint public totalSupply = 10000;

  mapping(address => uint) balances;

  constructor() {
    balances[msg.sender] = totalSupply;
  }

  function transfer(address to, uint amount) external {
    require(balances[msg.sender] >= amount, "Insufficient tokens");
    balances[msg.sender] -= amount;
    balances[to] += amount;
  }

  function balanceOf(address account) external view returns (uint) {
    return balances[account];
  }
}
