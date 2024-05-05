// SPDX-LICENSCE IDENTIFIER: MIT

pragma solidity ^0.8.0;

contract MerkleTree {
    bytes32 public stateRoot;
    bytes32 public transactionRoot;
    bytes32 public receiptRoot;

    constructor(bytes32[] memory stateLeaves, bytes32[] memory transactionLeaves, bytes32[] memory receiptLeaves) {
        stateRoot = computeMerkleRoot(stateLeaves);
        transactionRoot = computeMerkleRoot(transactionLeaves);
        receiptRoot = computeMerkleRoot(receiptLeaves);
    }

    function computeMerkleRoot(bytes32[] memory leaves) public pure returns (bytes32) {
        bytes32 root = leaves[0];
        for (uint i = 1; i < leaves.length; i++) {
            root = keccak256(abi.encodePacked(root, leaves[i]));
        }
        return root;
    }

    function verifyProof(bytes32[] memory proof, bytes32 leaf, bytes32 root) public pure returns (bool) {
        bytes32 computedHash = leaf;
        for (uint i = 0; i < proof.length; i++) {
            computedHash = keccak256(abi.encodePacked(computedHash, proof[i]));
        }
        return computedHash == root;
    }
}
