// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyName {

     string[] public names;

     function userName(string memory _name) public{
         names.push(_name);
     }
 }
