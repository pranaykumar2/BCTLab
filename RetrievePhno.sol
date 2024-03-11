//SPDX-License-Identifier: MIT

pragma solidity >0.8.0;

contract RetrievePhno {

    address public contract_owner;
    address public ph_owner;

    constructor(){
        contract_owner = msg.sender;
    }

    mapping(address => string) public phoneNumbers;

    function setPhno(string memory _number, address _owner) public {
        ph_owner = _owner;
        phoneNumbers[ph_owner] =  _number;
    }

    function getPhno(address _user) public view returns(string memory) {
        return  phoneNumbers[_user];
    }

}
