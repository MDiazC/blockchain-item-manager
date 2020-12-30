pragma solidity ^0.6.0;

import "./Item.sol";
import "./Owner.sol";

contract ItemManager is Ownable{
    enum SupplyChainState{Created, Paid, Delivered}

    mapping(uint => inStockItems) public items;
    uint itemIndex;
    struct inStockItems{
        Item item;
        string id;
        uint price;
        uint altprice;
        ItemManager.SupplyChainState status;
    }

    event SupplyItemStep(uint index, uint step, address itemAddress);

    function createItem(string memory identifier, uint itemPrice) public onlyOwner{
        Item itm = new Item(this, itemPrice, itemIndex);
        items[itemIndex].id = identifier;
        items[itemIndex].price = itemPrice;
        items[itemIndex].item = itm;
        items[itemIndex].status = ItemManager.SupplyChainState.Created;
        emit SupplyItemStep(itemIndex, uint(items[itemIndex].status), address(itm));
        itemIndex++;
    }

    function triggerPayment(uint index) payable public{
        require(items[index].price != 0, "Item doesn't exists");
        require(items[index].price == msg.value, "Note enough money");
        require(items[index].status == ItemManager.SupplyChainState.Created, "Item sold");
        items[index].status == ItemManager.SupplyChainState.Paid;
        emit SupplyItemStep(index, uint(items[index].status), address(items[index].item));
    }

    function triggerDelivery(uint index) public onlyOwner{
        require(items[index].price != 0, "Item doesn't exists");
        require(items[index].status == ItemManager.SupplyChainState.Paid, "Item status incorrect");
        items[index].status == ItemManager.SupplyChainState.Delivered;
        emit SupplyItemStep(index, uint(items[index].status), address(items[index].item));
    }

    function is_the_owner3 () public view returns (bool){
            if(msg.sender == owner){return true;}else{return false;}
        }
}
