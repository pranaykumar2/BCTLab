// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract DecentralizedLottery {
    address public manager;
    address[] public players;
    uint public randomNumber;
    
    modifier restricted() {
        require(msg.sender == manager, "Only the manager can call this function");
        _;
    }
    
    constructor() {
        manager = msg.sender;
    }
    
    function enter() public payable {
        require(msg.value > 0, "You must send some ether to enter the lottery");
        
        players.push(msg.sender);
    }
    
    function random() private view returns (uint) {
        return uint(keccak256(abi.encodePacked(block.prevrandao, block.timestamp, players.length)));
    }

    
    function pickWinner() public restricted {
        require(players.length > 0, "There must be at least one player to pick a winner");
        
        randomNumber = random() % players.length;
        
        address winner = players[randomNumber];
        
        payable(winner).transfer(address(this).balance);
        
        players = new address[](0);
    }
}
