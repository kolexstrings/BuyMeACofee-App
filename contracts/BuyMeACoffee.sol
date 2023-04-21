// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract BuyMeACofee{
    //Event to emit when a memo is created
    event NewMemo (
        address indexed from,
        uint256 timestamp,
        string _name,
        string _message
    );
    // Memo Struct
    struct Memo {
        address from;
        uint256 timestamp;
        string _name;
        string _message;
    }

    // Contract owner address
    //We can use this address to recieve payment later
    address payable owner;

    //Makes a list of the Memos
    Memo[] memo;

    constructor() {
        owner = payable(msg.sender);
    }

    /**
    * @dev allows someone to buy coffee for contract owner
    * @param _name: name of the coffee buyer
    * @param _message: a nice message from the coffee buyer
    */
    function buycoffee (string memory _name, string memory _message) public payable {
        require(msg.value > 0, "Sorry you can't buy any body coffee with 0 eth");

        //Add to memo to storage
        memo.push(Memo(
            msg.sender,
            block.timestamp,
            _name,
            _message
        ));

        //Emit a NewMemo event with details about the memo.
        emit NewMemo (
            msg.sender,
            block.timestamp,
            _name,
            _message
        );
    }

    function getMemos() public view returns (Memo[] memory) {
       return memo;
    }

    /*@dev this function, when called sends the balance of this tip which was stored
    in the contract address to the address of the owner i.e msg.sender */
    function withdrawTip() public payable {
        require(owner.send(address(this).balance));
    }
}
