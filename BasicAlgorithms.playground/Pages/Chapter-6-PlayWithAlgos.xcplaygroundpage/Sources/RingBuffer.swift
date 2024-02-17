
import Foundation

public struct RingBuffer<T> {
    
    fileprivate var array: [T?]
    fileprivate var readIndex = 0
    fileprivate var writeIndex = 0
    
    public init(count: Int) {
        array = [T?](repeating: nil, count: count)
    }
    
    public mutating func write(_ element: T) -> Bool {
        if !isFull {
            array[writeIndex % array.count] = element
            writeIndex += 1
            return true
        } else {
            return false
        }
    }
    
    public mutating func read() -> T? {
        if !isEmpty {
            let element = array[readIndex % array.count]
            readIndex += 1
            return element
        } else {
            return nil
        }
    }
    
    fileprivate var availableSpaceForReading: Int { writeIndex - readIndex }
    
    public var isEmpty: Bool { availableSpaceForReading == 0 }
    
    fileprivate var availableSpaceForWriting: Int { array.count - availableSpaceForReading }
    
    public var isFull: Bool { availableSpaceForWriting == 0 }
}
