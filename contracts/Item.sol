pragma solidity ^0.6.0;
import "./ItemManager.sol";

contract Item{

    uint public price;
    uint public pricePaid;
    uint public index;
    ItemManager parentContract;

    constructor(ItemManager parent, uint pr, uint ind) public{
        parentContract = parent;
        price = pr;
        index = ind;
    }

    receive() external payable{
        require(pricePaid == 0, "Item is already paid");
        require(price == msg.value, "Amount incorrect");
        pricePaid += msg.value;
        //using tranfer is safer, in case something wrong but we spend more gas
        //address(parentContract).transfer(msg.value);
        (bool success, ) = address(parentContract).call.value(msg.value)(abi.encodeWithSignature("triggerPayment(uint256)", index));
        require(success, "Somethign went wrong with transaction. Cancelling");
    }

    fallback() external{}

}
