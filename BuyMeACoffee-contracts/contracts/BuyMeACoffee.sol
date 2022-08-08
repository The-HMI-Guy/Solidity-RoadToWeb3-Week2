// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Import this file to use console.log
import "../node_modules/hardhat/console.sol";

contract BuyMeACoffee {
    // Event to emit when a Memo is created
    event NewMom(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    // Memo struct.
    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    }
    
    // List of all memos received from friends.
    Memo[] memos;

    // Address of contract deployer.
    address payable owner;
}