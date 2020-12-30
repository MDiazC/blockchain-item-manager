Item manager project

This project we developped with:
- Truffle v5.1.21 (core: 5.1.21)
- Solidity - v0.6.2 (solc-js)
- Node v11.15.0
- Web3.js v1.2.1
- Ganache v2.5.4
- Truffle React box
- chai v4.2.0
- chai-bn v0.2.1
- chai-as-promised v7.1.1

The goal of this project was to create a system to manage creation, payment and delivery of items using blockchain. The system registers when the items are created, when are paid and when are delivered.

The project is divided in three contracts.
- Item.sol Which represent each item 
- ItemManeger.sol that manages the creation, payment and delivery of the items
- Ownable.sol which is a mockup of the oppenzeppelin ownable contract


The project is developped with the Truffle React box so there is a frontend where you can interact with the smartontract.
