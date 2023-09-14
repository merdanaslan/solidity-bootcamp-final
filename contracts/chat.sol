// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Chat {
    struct Message {
        address sender;
        string text;
    }

    Message[] public messages;

    event NewMessage(address indexed sender, string text);

    function sendMessage(string memory text) public {
        messages.push(Message(msg.sender, text));
        emit NewMessage(msg.sender, text);
    }

    function getMessagesCount() public view returns (uint) {
        return messages.length;
    }

    function getMessage(uint index) public view returns (address sender, string memory text) {
        require(index < messages.length, "Message index out of bounds");
        Message storage message = messages[index];
        sender = message.sender;
        text = message.text;
    }
}
