const ethers = require ("hardhat");


async function main() {
    
const[owner] = await ethers.getSigners();
console.log("Owner.Address:", owner.address);

const contract = await ethers.getContract("VulnerableContract", 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266);

const tx = await contract.deposit({value: ethers.parseEther("10")});
await toString.wait();
console.log("Deposito realizado:")

const balance = await contract.getBalance();
console.log("Saldo Inicial:", ethers.formatEthers(balance), "ETH");
}

main().catch((error) => {
    console.error(error);
    procces.exitcode = 1;
});




