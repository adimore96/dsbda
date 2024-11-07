// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract Bank {
    uint256 balance = 0;

    // 0x1B38Da6a701c568545dCfcB03FcB875f56beddC4 => Main Account
    // 0xB57ee0797C3fc0205714a577c02F7205bB89dF30 => Receiver Account

    // Deposit Amount
    function deposit() public payable {
        require(msg.value>0, "Insufficient balance to deposit..!");
        balance += msg.value;
    }

    // Withdraw Amount
    function withdraw(uint256 amount) payable public {
        require(balance>=amount, "Insufficient balance to withdraw..!");
        payable(msg.sender).transfer(amount);
        balance -= amount;
        
    }

    // Show Balance
    function getBalance() public view returns (uint256) {
        
        return balance;
    }
}
