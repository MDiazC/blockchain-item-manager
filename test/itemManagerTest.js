const ItemManager = artifacts.require("./ItemManager.sol");

const assert = require("chai").assert;
const TruffleAssert = require('truffle-assertions');
//const Math = require('mathjs');

contract("ItemManager", accounts => {

	var itMan;

	it("Add an item", async () => {
		var itMan = await ItemManager.deployed();

		var itemName = "test1";
		var itemPrice = 200;

		var result = await itMan.createItem(itemName, itemPrice, {from: accounts[0]});
		var item_index = result.logs[0].args.index;
		assert.equal(item_index, 0, "It must be zero because is the first item");

		var item = await itMan.items(item_index);
		assert.equal(item.id, itemName, "Item name doesn't match");
		assert.equal(item.price, itemPrice, "Item price doesn't match");
	});

});
