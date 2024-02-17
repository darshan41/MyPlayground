//: [Previous](@previous)

import Foundation

public class StackTest: ExtraStackable {
    
    public typealias Element = Double
    
    private (set) var stack: Stack = [1.0,2.0,3.0]
    
    public var isEmpty: Bool { self.stack.isEmpty }
    
    public func peek() -> Double? {
        stack.peek()
    }
    
    public func push(_ element: Double) {
        stack.push(element)
    }
    
    public func pop() -> Double? {
        stack.pop()
    }
}

let test: StackTest = StackTest()
print(test.peek() ?? "None")

print(test.pop() ?? "None")

print(test.push(10))

print(test.peek() ?? "None")

print(test.peek() ?? "None")


//: [Next](@next)
