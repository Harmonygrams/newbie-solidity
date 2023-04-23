// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract SimpleStorage {
    //first view function
    uint8 public myAge = 26; 
    function incrementAge(uint8 _numberOfYears) public {
        myAge += _numberOfYears;
        showCurrentAge();
    }
    function decrementAge(uint8 _numberOfYears) public {
        myAge -= _numberOfYears;
        showCurrentAge();
    }
    function showCurrentAge() public view returns(uint8) {
        return myAge;
    }
}