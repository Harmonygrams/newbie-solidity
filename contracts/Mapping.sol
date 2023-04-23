// SPDX-License-Identifier: MIT 
pragma solidity 0.8.8;
contract MyFirstMapping {
    //creating a struct of students 
    struct StudentStruct {
        string name; 
        uint8 age; 
        string department;
        uint64 regNumber;
    }
    //creating a mapping that maps the students to their regNumber 
    mapping(uint64 => string) public studentToRegNumber;
    //creating an array that stores those structs 
    StudentStruct[] public students;
    //a function that adds to that array 
    function addStudentToArray(string memory _name, uint8 _age, string memory _department, uint64 _regNumber) public {
        StudentStruct memory newStudent = StudentStruct({
            name : _name, 
            age : _age, 
            department : _department, 
            regNumber : _regNumber
        });
        students.push(newStudent);
        studentToRegNumber[_regNumber] = _name;
    }
}