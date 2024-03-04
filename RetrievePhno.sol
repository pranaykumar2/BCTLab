//SPDX-License-Identifier: MIT

pragma solidity >0.8.0;

contract RetrievePhno {

    address public owner;

    mapping(address => string) public phoneNumbers;

    function setPhno(string memory _number, address _owner) public {
        owner = _owner;
        phoneNumbers[owner] =  _number;
    }

    function getPhno(address _user) public view returns(string memory) {
        return  phoneNumbers[_user];
    }

}
