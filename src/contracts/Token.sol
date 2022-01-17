// SPDX-License-Identifier: MIT
pragma solidity >=0.6.0 <0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Token is ERC20 {
  address public minter;
  
  event minterChanged(address indexed from, address to);

  constructor() public payable ERC20("Decentralized Bank Currency", "DBC") {
    minter = msg.sender;
  }

  function passMinterRole(address dBank) public returns(bool) {
    require(msg.sender == minter, 'Error, only owner can pass this mentor role');
    minter = dBank;

    emit minterChanged(msg.sender, dBank);
    return true;
  }

  //Add pass minter role function

  function mint(address account, uint256 amount) public {
    require(msg.sender == minter, 'Error, only owner can pass this mentor role');
		_mint(account, amount);
	}
}