//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract SimpleStorage {
    uint8 public number;

    function incrementNumber() public {
        number += 1;
    }
}
