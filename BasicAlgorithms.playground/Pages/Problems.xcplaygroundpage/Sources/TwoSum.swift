import Foundation
import XCTest

public class TwoSum: HyperTesting {
    
    public init() { }
    
    public class func elementAndTargetToTest() -> ([Int],Int) {
        ([1,2,3,4,5],3)
    }
    
    public let elements = elementAndTargetToTest().0
    public let target = elementAndTargetToTest().1
}


public extension TwoSum {
    
    @discardableResult
    func tryBruteForceMethod() -> CustomStringConvertible {
        var indexList: Set<HashableStorage> = []
        for (innerIndex,rootElement) in elements.enumerated() {
            for (index,element) in elements.enumerated() {
                guard index != innerIndex else { continue }
                if element + rootElement == self.target {
                    indexList.insert(HashableStorage(value1: innerIndex, value2: index))
                }
            }
        }
        print(indexList.description)
        return indexList
    }
    
    @discardableResult
    func tryBetter() -> CustomStringConvertible {
        tryBruteForceMethod()
    }
    
    @discardableResult
    func tryOptimised() -> CustomStringConvertible {
        var map = [Int: Int]()
        for (i, n) in elements.enumerated() {
            let diff = target - n
            if let j = map[diff] {
                print([i, j])
            }
            map[n] = i
        }
        print(map)
        return map
    }
}

public struct HashableStorage: Hashable,Equatable {
    
    public let value1: Int
    public let value2: Int
    
    public init(value1: Int, value2: Int) {
        self.value1 = value1
        self.value2 = value2
    }
    
    public static func == (lhs: HashableStorage, rhs: HashableStorage) -> Bool {
        return lhs.value1 == rhs.value2 && lhs.value2 == rhs.value1
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(value1)
        hasher.combine(value2)
    }
}

extension HashableStorage: CustomStringConvertible {
    
    public var description: String { "\(value1)-\(value2)" }
}
