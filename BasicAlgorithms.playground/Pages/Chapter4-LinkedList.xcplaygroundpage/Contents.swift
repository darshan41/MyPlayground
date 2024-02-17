//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

public class LLTests {
    
    var list: LinkedList<Int> = LinkedList()
    
    func pushTest() {
        list.push(3)
        list.push(2)
        list.push(1)
        print("Before inserting: \(list)")
        var middleNode = list.node(at: 1)!
        for _ in 1...4 {
            middleNode = list.insert(-1, after: middleNode)
        }
        print("After inserting: \(list)")
    }
    
    func printValues() {
        print(list.values)
    }
    
    func sum() {
        print(list.values.reduce(0, +))
    }
    
    func copyTest() {
        var list1 = LinkedList<Int>()
        list1.append(1)
        list1.append(2)
        var list2 = list1
        print("List1: \(list1)")
        print("List2: \(list2)")
        print("After appending 3 to list2")
        list2.append(3)
        print("List1: \(list1)")
        print("List2: \(list2)")
    }
}

let test = LLTests()

test.pushTest()
test.printValues()
test.sum()
test.copyTest()
