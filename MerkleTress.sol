// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MerkleTree {
    uint256 public stateRoot;
    uint256 public transactionRoot;
    uint256 public receiptRoot;

    constructor(uint256[] memory stateLeaves, uint256[] memory transactionLeaves, uint256[] memory receiptLeaves) {
        stateRoot = computeMerkleRoot(stateLeaves);
        transactionRoot = computeMerkleRoot(transactionLeaves);
        receiptRoot = computeMerkleRoot(receiptLeaves);
    }

    function computeMerkleRoot(uint256[] memory leaves) public pure returns (uint256) {
        uint256 root = uint256(leaves[0]);
        for (uint i = 1; i < leaves.length; i++) {
            root = uint256(keccak256(abi.encodePacked(root, leaves[i])));
        }
        return root;
    }

    
}
