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
  //create a contractFactory then
  const contractFactory = new ethers.ContractFactory(abi, binary, wallet);

  //deploy a contract using the deploy keyword
  // const contract = await contractFactory.deploy();
  // const transactionDeploy = await contract.deploymentTransaction(2);

  //deploy a contract after one block
  // const transactionReceipt = await contract.transactionReceipt();
  // console.log(transactionReceipt);

  //send a transaction to the blockchain by yourself
  // const nonce = await provider.getTransactionCount(wallet);
  // const tx = {
  //   nonce: nonce,
  //   to: null,
  //   gasPrice: 20000000000,
  //   gasLimit: 6721975,
  //   value: 0,
  //   data: "0x608060405234801561001057600080fd5b5061017f806100206000396000f3fe608060405234801561001057600080fd5b50600436106100365760003560e01c8063273ea3e31461003b5780638381f58a14610045575b600080fd5b610043610063565b005b61004d61009b565b60405161005a91906100bb565b60405180910390f35b60016000808282829054906101000a900460ff1661008191906100d6565b92506101000a81548160ff021916908360ff160217905550565b60008054906101000a900460ff1681565b6100b58161010d565b82525050565b60006020820190506100d060008301846100ac565b92915050565b60006100e18261010d565b91506100ec8361010d565b92508260ff038211156101025761010161011a565b5b828201905092915050565b600060ff82169050919050565b7f4e487b7100000000000000000000000000000000000000000000000000000000600052601160045260246000fdfea2646970667358221220ff4a725a4270dd4dd6f39a9b8193fe07b46b203d62a93ff3f91822d7e82a4faf64736f6c63430008070033",
  //   chainId: 1337,
  // };
  // const sentTrxResponse = await wallet.sendTransaction(tx);
  // console.log(sentTrxResponse);

  const contract = await contractFactory.deploy();
  const deployment = await contract.deploymentTransaction().wait(1);
  const currentFavoriteNumber = await contract.retrieve();
  console.log(currentFavoriteNumber.toString());
  //increasing the number
  const store = await contract.store("1000");
  const storeResponse = await store.wait(1);
  //retrieve the number again
  const currentNum = await contract.retrieve();
  console.log(currentNum.toString());
}
main()
  .then(() => process.exit(1))
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
