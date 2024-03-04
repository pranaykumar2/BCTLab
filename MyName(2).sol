// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

 contract MyName {

     struct user{
         string name;
         string email;
         uint phno;
     }
     user[] public Users;

     function userName(string memory _name, string memory email, uint phno) public {
         Users.push(user(_name,  email, phno));
     }
 }
