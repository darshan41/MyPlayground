import Foundation

public protocol ArrayQueueable: Queue {
    
    associatedtype T
    
}

public struct ArrayQueue<T>: ArrayQueueable {
    
    private (set)var array: Array<T> = []
    
    public init() { }
    
    public init(with elements: Array<T>) {
        self.array = elements
    }
}

// MARK: Public Helper func's

public extension ArrayQueue {
    
    var isEmpty: Bool { self.array.isEmpty }
    
    var peek: T? { self.array.first }
    
    @discardableResult
    mutating func enqueue(_ element: T) -> Bool {
        self.array.append(element)
        return true
    }
    
    @discardableResult
    mutating func dequeue() -> T? { isEmpty ? nil : self.array.removeFirst() }
}

// MARK: CustomStringConvertible

extension ArrayQueue: CustomStringConvertible {
    
    public var description: String { array.description }
}

// MARK: Helper func's

private extension ArrayQueue { }
