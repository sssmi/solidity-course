// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.12;

contract Deposit {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    // declaring the receive() function that is executed when sending ETH to the contract address
    // it was introduced in Solidity 0.6 and a contract can have only one receive function, 
    // declared with this syntax (without the function keyword and without arguments).
    receive() external payable {
    }

    // declaring a fallback payable function that is called when msg.data is not empty or
    // when no other function matches
    fallback() external payable {
    }
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // ether can be send and received by the contract in the trasaction that calls this function as well
    function sendEther() public payable {
    }

    function transferEther(address payable recipient, uint amount) public returns(bool) {
        // checking that only contract owner can send ether from the contract to another address
        require(owner == msg.sender, "Transfer failed, you are not the owner!!");

        if (amount <= getBalance()) {
            recipient.transfer(amount);
            return true;
        } else {
            return false;
        }
    }
}
