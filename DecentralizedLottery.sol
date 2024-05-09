// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

contract DecentralizedLottery {
    address public manager;
    address[] public players;
    uint public randomNumber;

    // Event to log when a winner is picked
    event WinnerPicked(address winner, uint amount);

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
        
        uint prize = address(this).balance;
        payable(winner).transfer(prize);
        
        // Emit the WinnerPicked event
        emit WinnerPicked(winner, prize);
        
        players = new address[](0);
    }
}
