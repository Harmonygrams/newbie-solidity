//SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;
import "./FundMeLibrary.sol";
error notOwner();
error insufficientBalance();

contract FundMe {
    using FundMeLibrary for uint256;
    address[] public funders;
    address public immutable i_owner;
    mapping(address => uint256) public addressToAmount;
    uint256 minimumUsd = 50 * 1e18; 

    //this contructor runs when the contract was executed
    constructor() {
        i_owner = msg.sender;
    }
    //security check 
    modifier onlyOwner () {
        // require(msg.sender == owner, "Not authorized");
        if(msg.sender != i_owner){
            revert notOwner();
        }
        _;
    }
    //chainlink contract
    function fund () public payable  {
        //check if the amount is more than 50USD 
        if(msg.value.convertWeiToUSD() >= minimumUsd){
            funders.push(msg.sender);
            addressToAmount[msg.sender] = msg.value;
        }
        revert insufficientBalance();
    }
    function withdraw () public onlyOwner {
        //reset wallet addresses 
        for(uint256 index = 0; index < funders.length; index++){
            addressToAmount[funders[index]] = 0;
        }
        funders = new address[](0);
        //send ether to the owner's wallet 
        (bool callSuccess, ) = payable(msg.sender).call{value : address(this).balance}("");
        require(callSuccess, "call failed");
    }
    function viewContractAddress () public view returns(address){
        return address(this);
    }
    /*
        If the user makes a transaction without calling the fund function directly, 
        any of these functions will be executed
    */
    receive() external payable  {
        fund();
    }
    fallback() external payable {
        fund();
    }
}