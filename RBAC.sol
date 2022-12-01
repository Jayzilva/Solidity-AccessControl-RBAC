// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./Roles.sol";

contract RBAC{
    using Roles for Roles.Role;
    Roles.Role private users;
    Roles.Role private admins;

    constructor() {
        admins.add(msg.sender); //super admin
    }



    function userProtectedFunction() external onlyUser(){}

    function adminProtectedFunction() external onlyAdmin(){}

    //add 
    function addUser(address _newUser) external onlyAdmin(){
        users.add(_newUser);
    }

    function addAdmin(address _newAdmin) external onlyAdmin(){
        admins.add(_newAdmin);
    }

    //remove
    function removeUser(address _oldUser) external onlyAdmin(){
        users.remove(_oldUser);
    }

    function removeAdmin(address _oldAdmin) external onlyAdmin(){
        admins.remove(_oldAdmin);
    }
    
    modifier onlyUser(){
        require(users.has(msg.sender)== true, "Must have an user Role");
        _;
    }

    modifier onlyAdmin(){
        require(admins.has(msg.sender)== true, "Must have an Admin Role");
        _;
    }
    
}

// Super Admin Account  - 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4

// Admin Account 01 - 0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
// Admin Account 02 - 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db

// User Account 01 - 0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB
// User Account 01 - 0x617F2E2fD72FD9D5503197092aC168c91465E7f2