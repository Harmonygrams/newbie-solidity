// SPDX-License-Identifier: MIT
pragma solidity 0.8.8;
contract MyStruct {
    //creating a struct of employees and their salaries adnd addresses
    struct EmployeeStruct {
        string name;
        uint32 salary;
        address walletAddress;
    }
    //creating an employee 
    EmployeeStruct public harmony = EmployeeStruct({
        name : "Harmony",
        salary : 15000,
        walletAddress :  0xdfc78467aD59C7450c745f13233a830Bca23FeF0
    });
    //creating a struct for praise 
    EmployeeStruct public praise = EmployeeStruct({
        name : "Praise", 
        salary : 50000, 
        walletAddress : 0xdfc78467aD59C7450c745f13233a830Bca23FeF0
    });
}