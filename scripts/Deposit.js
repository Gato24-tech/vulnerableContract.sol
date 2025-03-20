const { ethers } = require("hardhat"); // ✅ Importamos ethers desde Hardhat correctamente

async function main() {
    // ✅ Obtenemos la cuenta del owner
    const [owner] = await ethers.getSigners();
    console.log("Owner Address:", owner.address);

    // ✅ Obtenemos la instancia del contrato vulnerable
    const contract = await ethers.getContractAt("VulnerableContract", "0x5FbDB2315678afecb367f032d93F642f64180aa3");
    const tx = await contract.deposit({ value: ethers.parseEther("10") });
    await tx.wait();
    console.log("✅ Depósito realizado");
    console.log("🔗 Hash de la transacción de depósito:", tx.hash);


    // ✅ Consultamos el saldo del contrato vulnerable
    const balance = await ethers.provider.getBalance(contract.target);
    console.log("💰 Saldo del contrato:", ethers.formatEther(balance), "ETH");
}

// ✅ Ejecutamos la función main con manejo de errores
main().catch((error) => {
    console.error(error);
    process.exitCode = 1; // Se usa "process", no "procces"
});
