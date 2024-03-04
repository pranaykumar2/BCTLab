// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract MyName {

    struct user{
        string name;
        string email;
        uint phno;
    }

    user[] public Users;

    function userName(string memory _name, string memory email, uint phno) public payable returns(string memory){
        if(msg.value == 1 ether) {
            Users.push(user(_name,  email, phno));
            return "Added Successfully";
        }
        else {
            return "Pay money";
        }
    }
}
