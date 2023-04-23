//SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;
import "./FundMeLibrary.sol";
error notOwner();
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
        //check if the amount if good 
        require(msg.value.convertWeiToUSD() >= minimumUsd, "Didn't send");
        funders.push(msg.sender);
        addressToAmount[msg.sender] = msg.value;
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
}