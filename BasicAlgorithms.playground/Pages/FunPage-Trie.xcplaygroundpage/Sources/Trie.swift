
import Foundation

public class TrieNode<T> {
    public var children: [Character: TrieNode] = [:]
    public var value: T?
    public var isEndOfWord: Bool = false
}

public class Trie<T> {
    
    private let root: TrieNode = TrieNode<T>()
    
    public init() { }
    
    public func insert(_ word: String) {
        var currentNode = root
        for char in word {
            if let child = currentNode.children[char] {
                currentNode = child
            } else {
                let newNode = TrieNode<T>()
                currentNode.children[char] = newNode
                currentNode = newNode
            }
        }
        currentNode.isEndOfWord = true
    }
    
    public func search(_ word: String) -> Bool {
        var currentNode = root
        for char in word {
            if let child = currentNode.children[char] {
                currentNode = child
            } else {
                return false
            }
        }
        return currentNode.isEndOfWord
    }
    
    public func startsWith(_ prefix: String) -> Bool {
        var currentNode = root
        for char in prefix {
            if let child = currentNode.children[char] {
                currentNode = child
            } else {
                return false
            }
        }
        return true
    }
}
