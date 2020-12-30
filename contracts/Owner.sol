pragma solidity ^0.6.0;

contract Ownable{
    address payable owner;

     constructor () public {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "Not the owner");
        _;
    }
}
