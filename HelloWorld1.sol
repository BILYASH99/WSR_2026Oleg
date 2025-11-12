// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HelloWorld {
    string public message;

    function saymMessage(string memory newMessage) public {
        message= newMessage;   
    }


    function resetMess() public {
        require(bytes(message).length > 0, "Message not empty");
        message="";
    }

}