const account1 = "0xBc494C334338940B563bc533942978C3D58af4bb";
const account2 = "0x5893b76fd7ec4bef2a019bafb42f0af915b28852";
const message = "gEth is Money";

// Check account balance
web3.fromWei(eth.getBalance(account1), "ether");

//sign the message
web3.eth.sign(account1, web3.sha3(message));

//Send ethers to account 2
(web3.eth.sendTransaction({
    from: account1,
    to: account2,
    value: web3.toWei(0.5, "ether")
}));

//Check balance of account 2
console.log(web3.fromWei(eth.getBalance(account2), "ether"));

//find the transaction details
const transactionHash = "0xbf751e88b949df709c825dbc3773cffb9fc9d2da0b7659fb00694f37068f5d35";
console.log(web3.eth.getTransaction(transactionHash));