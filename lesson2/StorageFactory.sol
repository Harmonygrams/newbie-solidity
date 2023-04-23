//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//first we import the other contract 
import "./SimpleStorage.sol";

contract StorageFactory {
    //objectives 
    //have access to all the methods in the simple storage contract 
    SimpleStorage public simpleStorage;
    uint256 storedNumber;
    function assignContractToVariable () public {
        simpleStorage = new SimpleStorage();
    }
    //let's store numbers to it 
    function storeNumberInContract (uint256 _number) public {
        simpleStorage.store(_number);
    }
    //let's retrieve the number we stored in it 
    function storeNumberInOtherContract () public view returns(uint256){
        return simpleStorage.retrieve();
    }

}