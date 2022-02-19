// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ChocoToken {

    string public constant name = "ChocoToken";
    string public constant symbol = "CCT";
    uint8 public constant decimals = 0;

    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);
    event Transfer(address indexed from, address indexed to, uint tokens);

    uint totalChocoTokens;
    address chocoTokenCreator;

    mapping(address => uint256) balances;
    mapping(address => mapping (address => uint256)) allowed;

    using SafeMath for uint256;

    constructor(uint _totalChocoTokens) {
        chocoTokenCreator = msg.sender;
        totalChocoTokens = _totalChocoTokens;
        balances[msg.sender] = totalChocoTokens;
    }

    function getOwner() public view returns (address) {
        return chocoTokenCreator;
    }

    function totalSupply() public view returns (uint) {
        return totalChocoTokens;
    }

    function balanceOf(address _chocoTokenOwner) public view returns (uint) {
        return balances[_chocoTokenOwner];
    }

    function transfer(address _receiver, uint _numChocoTokens) public returns (bool) {
        require(_numChocoTokens <= balances[msg.sender], "Insufficient ChocoTokens!");
        balances[msg.sender] = balances[msg.sender].sub(_numChocoTokens);
        balances[_receiver] = balances[_receiver].add(_numChocoTokens);
        emit Transfer(msg.sender, _receiver, _numChocoTokens);
        return true;
    }

    function approve(address _delegate, uint _numChocoTokens) public returns (bool) {
        allowed[msg.sender][_delegate] = _numChocoTokens;
        emit Approval(msg.sender, _delegate, _numChocoTokens);
        return true;
    }

    function allowance(address _owner, address _delegate) public view returns (uint) {
        return allowed[_owner][_delegate];
    }

    function transferFrom(
        address _owner, 
        address _reciever,
        uint _numChocoTokens) public returns (bool) {

        require(_numChocoTokens <= balances[_owner], "Insufficient ChocoTokens!");
        require(_numChocoTokens <= allowed[_owner][msg.sender], "Approved ChocoTokens Limit Exceeded!");
        balances[_owner] = balances[_owner].sub(_numChocoTokens);
        allowed[_owner][msg.sender] = allowed[_owner][msg.sender].sub(_numChocoTokens);
        balances[_reciever] = balances[_reciever].add(_numChocoTokens);
        emit Transfer(_owner, _reciever, _numChocoTokens);
        return true;
    }

}

library SafeMath { 
    function sub(uint256 a, uint256 b) internal pure returns (uint256) {
      assert(b <= a);
      return a - b;
    }
    
    function add(uint256 a, uint256 b) internal pure returns (uint256) {
      uint256 c = a + b;
      assert(c >= a);
      return c;
    }
}
