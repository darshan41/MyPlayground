//: [Previous](@previous)

import Foundation

let trie = Trie<String>()


trie.insert("apple")
trie.insert("app")
trie.insert("banana")

print(trie.search("apple")) // true
print(trie.search("app"))   // true
print(trie.search("apples")) // false

print(trie.startsWith("app")) // true
print(trie.startsWith("ban")) // true
print(trie.startsWith("cat")) // false
