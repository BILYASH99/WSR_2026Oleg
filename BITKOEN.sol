// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract MyToken {
    string public name = "RedTon";
    string public symbol = "RTK";
    uint8 public decimals = 18 ;
    uint256 public totalSupply;

    mapping (address => uint256) public balanceOf;
    mapping (address => mapping(address => uint256)) public allowance;

    constructor(uint256 initialSupply){
        totalSupply = initialSupply *10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
    }


    function transfer(address recipient, uint256 amount) public returns (bool){
        require(recipient !=address(0), "ERC20: transfer to the zero address");
        require(balanceOf[msg.sender] >= amount,"ERC20: transfer amount exceeds balance" );

        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;

        emit Transfer (msg.sender, recipient, amount);
        return true;
    
    }

    function approve(address spender, uint256 amount) public returns (bool) {
        require(spender != address(0), "ERC20: approve to the zero address");

        allowance[msg.sender][spender] = amount;

        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom (address sender, address recipient, uint256 amount) public returns (bool) {
    require(sender != address(0), "ERC20: transfer from the zero address");
    require(recipient != address(0), "ERC20: transfer to the zero address");
    require(balanceOf[sender] >= amount, "ERC20: transfer amount exceeds balance");
    require(allowance[sender][msg.sender] >= amount, "ERC20: transfer amount exceeds allowance");

    balanceOf[sender] -= amount;
    balanceOf[recipient] += amount;
    allowance[sender][msg.sender] -= amount;
    
    emit Transfer(sender, recipient, amount);
    return true;
    }

    function alowance(address owner, address spender) public view returns (uint256) {
        return allowance [owner] [spender];
    }
    event Transfer(address indexed from, address indexed to, uint value);

    event Approval(address indexed owner, address indexed spender, uint256 value);
}  