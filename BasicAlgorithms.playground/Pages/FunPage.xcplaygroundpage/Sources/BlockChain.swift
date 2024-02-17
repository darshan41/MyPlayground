
import Foundation
import CryptoKit

public protocol CodableBlock: Codable {
    var index: Int { get }
    var timestamp: Date { get }
    var data: String { get }
    var previousHash: Data { get }
    var hash: Data { get }
}

public struct Block: CodableBlock {
    public let index: Int
    public let timestamp: Date
    public let data: String
    public let previousHash: Data
    public let hash: Data
}

public class Blockchain {
    
    public var chain = [Block]()

    public init() {
        createBlock(data: "Genesis Block", previousHash: Data())
    }

    public func createBlock(data: String, previousHash: Data) {
        let newIndex = chain.count
        let newTimestamp = Date()
        let newHash = calculateHash(index: newIndex, timestamp: newTimestamp, data: data, previousHash: previousHash)
        let newBlock = Block(index: newIndex, timestamp: newTimestamp, data: data, previousHash: previousHash, hash: newHash)
        chain.append(newBlock)
    }

    public func calculateHash(index: Int, timestamp: Date, data: String, previousHash: Data) -> Data {
        var hashData = Data()
        hashData.append(Data(UInt32(index).bigEndian.bytes))
        hashData.append(Data(timestamp.timeIntervalSince1970.bitPattern.bigEndian.bytes))
        hashData.append(Data(data.utf8))
        hashData.append(previousHash)
        let hash = SHA256.hash(data: hashData)
        return Data(hash)
    }
}

fileprivate extension FixedWidthInteger {
    
    var bytes: [UInt8] {
        var source = self.bigEndian
        return withUnsafeBytes(of: &source) { Array($0) }
    }
}
