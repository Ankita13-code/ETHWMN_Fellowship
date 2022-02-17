//Merkle Tree

var fs = require('fs');
const { MerkleTree } = require('merkletreejs')

var text = fs.readFileSync("./blockHash.txt", 'utf-8');
var arr = text.split('\n')


const SHA256 = require('crypto-js/sha256')

const leaves = arr
const tree = new MerkleTree(leaves, SHA256)
const root = tree.getRoot().toString('hex')
console.log(root)

console.log(tree.toString())