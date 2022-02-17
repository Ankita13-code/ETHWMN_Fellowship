//for finding hash of first 128 blocks
for (var i = 0; i < 128; i++) {
    console.log(web3.eth.getBlock(i).hash);
}

//finding first block with a smart contract. In this the "to" propoerty of a transaction is null
var blockNumber = 0;
while (blockNumber !== null) {
    console.log("Loop running on block number: ", value)
    var transactionFromBlock = web3.eth.getTransactionFromBlock(blockNumber);
    if (transactionFromBlock == null) {
        blockNumber++;
    } else {
        var getTransactionTo = transactionFromBlock.to;
        if (getTransactionTo == null) {
            console.log(blockNumber);
            console.log(transactionFromBlock.hash);
            blockNumber = null;
        } else {
            blockNumber++;
        }
    }
}