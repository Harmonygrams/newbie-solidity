// SPDX-License-Identifier: MIT
pragma solidity 0.8.8; 

contract SimpleStorage {
    uint256 favoriteNumber; 
    struct People {
        uint256 favoriteNumber; 
        string name; 
    }
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber; 
    //the store function just stores number 
    function store(uint256 _favoriteNumber) public {
        favoriteNumber = _favoriteNumber;
    }
    //the retrieve function retrieves the number stored by the store function
    function retrieve() public view returns(uint256){
        return favoriteNumber;
    }
    //the addPerson functon adds person to the function 
    function addPerson(string memory _name,uint256 _favoriteNumber) public {
        people.push(People({
            favoriteNumber : _favoriteNumber, 
            name : _name
        }));
        //adding to the mapping 
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

}