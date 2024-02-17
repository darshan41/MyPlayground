//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

let blockchain = Blockchain()
blockchain.createBlock(data: "Transaction 1", previousHash: blockchain.chain.last!.hash)
blockchain.createBlock(data: "Transaction 2", previousHash: blockchain.chain.last!.hash)

// Print the blockchain
for block in blockchain.chain {
    print("Block #\(block.index)")
    print("Timestamp: \(block.timestamp)")
    print("Data: \(block.data)")
    print("Previous Hash: \(block.previousHash)")
    print("Hash: \(block.hash)")
    print("")
}
