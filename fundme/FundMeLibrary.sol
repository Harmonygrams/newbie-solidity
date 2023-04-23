// SPDX-License-Identifier: MIT 
pragma solidity ^0.8.0;
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
library FundMeLibrary {
    function getPrice () internal view returns(uint256) {
        AggregatorV3Interface chainLink = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (,int256 price,,,) = chainLink.latestRoundData();
        return uint256(price * 1e10);
    }
    function convertWeiToUSD(uint256 _ethAmount) internal view returns(uint256){
        //first convert eth to wei 
        uint256 amountInWei = _ethAmount * 1e18; 
        //then convert wei to usd 
        uint256 priceInUsd = getPrice();
        return (amountInWei * priceInUsd) / 1e18;

    }
}