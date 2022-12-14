// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Deployed to Goerli at 0x59AE2a145b8245863875CF83D00D834Fe77f7eF6
// Deployed to Goerli at UPDATED - 0xC4F9Ed97d1a6979eDDa96a9Ec388685181f0B56e

// Import this file to use console.log
import "../node_modules/hardhat/console.sol";

contract BuyMeACoffee {
    // Event to emit when a Memo is created.
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
    // Challenge Number #1.
    address payable originalOwner;

    // Deploy logic.
    constructor(){
        owner = payable(msg.sender);
        originalOwner = owner;
    }

    /**
     * @dev buy a coffee for contract owner
     * @param _name name of the coffee buyer
     * @param _message a nice message from the coffe buyer
     */
    function buyCoffee(string memory _name, string memory _message) public payable{
        require(msg.value > 0, "Can't buy coffee with 0 eth");

        // Add the memo to storage!
        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));

        // Emit a log event when a new memo is created!
        emit NewMom(
            msg.sender,
            block.timestamp,
            _name,
            _message
        );
    }
    /**
     * @dev buy a large coffee for contract owner
     * @param _name name of the coffee buyer
     * @param _message a nice message from the coffe buyer
     */
    function buyLargeCoffee(string memory _name, string memory _message) public payable{
        require(msg.value > 0, "Can't buy coffee with 0 eth");

        // Add the memo to storage!
        memos.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));

        // Emit a log event when a new memo is created!
        emit NewMom(
            msg.sender,
            block.timestamp,
            _name,
            _message
        );
    }
    /**
     * @dev send the entire balance stored in this contract to the owner
     */
    function withdrawTips() public {
        require(owner.send(address(this).balance));
    }
    /**
     * @dev update the owner's variable, which allows you to send the funds
     * to other wallets. Orginal owenr or new owner can execute this function.
     */
    function newOwner(address _newOwner) public {
        require(owner == msg.sender || originalOwner == msg.sender, "Not an owner!");
        owner = payable(_newOwner);
    }

    /**
     * @dev retrieve all the memos received and stored on the blockchain
     */
    function getMemos() public view returns(Memo[] memory){
        return memos;
    }
}