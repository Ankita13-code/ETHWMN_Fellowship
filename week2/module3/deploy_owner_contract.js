//impementation using ethers.js

(async() => {
    try {
        console.log('Running deployWithEthers script...')

        const contractName = 'Owner'
        const constructorArgs = []

        const artifactsPath = `./artifacts/${contractName}.json`

        const metadata = JSON.parse(await remix.call('fileManager', 'getFile', artifactsPath))
            // 'web3Provider' is a remix global variable object
        const signer = (new ethers.providers.Web3Provider(web3Provider)).getSigner()

        let factory = new ethers.ContractFactory(metadata.abi, metadata.data.bytecode.object, signer);

        let contract = await factory.deploy(...constructorArgs);

        console.log('Contract Address: ', contract.address);

        await contract.deployed();

        console.log('Deployment successful.');
        console.log(JSON.stringify(contract.deployTransaction));

    } catch (e) {
        console.log(e.message)
    }
})()