// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract DiceRoll {
    function rollDice(uint numberOfDice) public view returns(uint[] memory) {
        uint[] memory results = new uint[](numberOfDice);
        uint randomnum;
        
        for (uint i = 0; i < numberOfDice; i++) {
            randomnum = uint(keccak256(abi.encodePacked(block.timestamp, blockhash(block.number - 1), i))) % 6 + 1;
            results[i] = randomnum;
        }
        
        return results;
    }
}
