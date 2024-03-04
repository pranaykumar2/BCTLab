//SPDX-License-Identifier: MIT

pragma solidity >0.8.0;

contract VoteColor {
    uint violet = 0;
    uint indigo = 0;
    uint blue = 0;

    function voteViolet() public {
        violet = violet + 1;
    }

    function getViolet() public view returns(uint) {
        return violet;
    }

    function voteIndigo() public{
        indigo = indigo + 1;
    }

    function getIndigo() public view returns(uint) {
        return indigo;
    }

    function voteBlue() public{
        blue = blue + 1;
    }

    function getBlue() public view returns(uint) {
        return blue;
    }
}
