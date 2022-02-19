// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract DeadManSwitch {
    address payable reciever;
    address public owner;
    uint public lastAliveBlock = 0;
    uint constant public maxBlockDifferenceAllowed = 10;


    // Initialize the contract
    constructor(address payable _reciever){
        reciever = _reciever;
        owner = msg.sender;
    }

    modifier onlyOwner {
        require(msg.sender == owner, "Account can only be accessed by owner!");
        _;
    }

    // Check the last block the owner did a transaction on. 
    // Since this method can be called by the owner only - It updates the last 
    // block owner did a transaction on.
    function stillAlive() external onlyOwner {
        lastAliveBlock = block.number;
    }

    // Transferring all the funds to a pre defined payable address
    function destroy() internal {
        selfdestruct(reciever);
    }

    // Check if blockDifference between 2 consecutive transactions exceed 10
    function checkIfAlive() public returns (bool) {
        if(block.number >= maxBlockDifferenceAllowed  && block.number - lastAliveBlock > maxBlockDifferenceAllowed){
            destroy();
            return false;
        }
        return true;
    }   
}