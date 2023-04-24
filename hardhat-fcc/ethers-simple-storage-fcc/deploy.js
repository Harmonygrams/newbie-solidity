const ethers = require("ethers");
const fs = require("fs");
require("dotenv").config();
async function main() {
  const provider = new ethers.JsonRpcProvider(process.env.RPC_URL);
  const wallet = new ethers.Wallet(process.env.PRIVATE_KEY, provider);
  const abi = fs.readFileSync("./SimpleStorage_sol_SimpleStorage.abi", "utf-8");
  const binary = fs.readFileSync(
    "./SimpleStorage_sol_SimpleStorage.bin",
    "utf-8"
  );
}
main()
  .then(() => process.exit(1))
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
