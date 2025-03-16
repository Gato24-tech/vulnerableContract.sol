// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract VulnerableContract {
    mapping(address => uint256) public balances;

function deposit() external payable {
    balances[msg.sender] += msg.value;
}
  // Retirar fondos (Vulnerable a Reentrada)
function withdraw() external {
    uint256 amount = balances[msg.sender];
    require(amount > 0, "saldo insuficiente"); 

   // ⚠️ Vulnerabilidad: Enviamos Ether antes de actualizar el balance
 (bool success,) = msg.sender.call{value: amount}("");
    require(success, "transferencia fallida");

    balances[msg.sender] = 0;
}

 // Obtener el balance del contrato
function getBalance() external view returns (uint256) {
    return balances[msg.sender];
}
}
