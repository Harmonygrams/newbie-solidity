// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.8; 
contract FallbackExample {
    address public sender;
    address public contractAddress; 
    uint256 public result; 
    /*
        The receive function is called when the a transaction is not sent along with a data.
    */
    receive() external payable {
        result += 1;
        sender = msg.sender;
        contractAddress = address(this); //referst to this contract address

    }
    /*
        The fallback function is triggered by solidity when data is sent with a transactions 
    */
    fallback() external payable {
        result += 5; 
        sender = msg.sender; 
        contractAddress = address(this); //refers to this contract address
    }
}