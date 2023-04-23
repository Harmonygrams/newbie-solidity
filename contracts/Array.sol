// SPDX-License-Identifier: MIT 
pragma solidity 0.8.8;
contract ArrayContract {
    //creating a struct and an array of struct
    struct StudentStruct {
        string studentName;
        uint64 regNumber;
        string department;
    }

    //creating an array that stores structs 
    StudentStruct[] public students;
    
    //function to add people 
    function addStudent (string memory _studentName, uint64 _regNumber, string memory department ) public {
        students.push(StudentStruct({
             studentName : _studentName, 
             regNumber : _regNumber, 
             department : department
        }));
    }
    
}