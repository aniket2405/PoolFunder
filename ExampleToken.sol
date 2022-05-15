pragma solidity ^0.7.4;

import "openzeppelin-solidity/contracts/token/ERC20/DetailedERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol";
import "openzeppelin-solidity/contracts/token/ERC20/BurnableToken.sol";
import "openzeppelin-solidity/contracts/math/SafeMath.sol";


contract ExampleToken is  StandardToken, DetailedERC20, BurnableToken{

  //We inherited the DetailedERC20 
  constructor(string _name, string _symbol, uint8 _decimals) 
  DetailedERC20(_name, _symbol, _decimals)
  public {
  	totalSupply_ = 10000;
  	balances[msg.sender] = 10000;
  }

}

