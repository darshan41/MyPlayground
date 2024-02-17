import Foundation
import XCTest

public protocol HyperTesting {
    
    @discardableResult
    func tryBruteForceMethod() -> CustomStringConvertible
    
    @discardableResult
    func tryBetter() -> CustomStringConvertible
    
    @discardableResult
    func tryOptimised() -> CustomStringConvertible
    
}

public extension HyperTesting {
    
    @discardableResult
    func tryBetter() -> CustomStringConvertible {
        tryBruteForceMethod()
    }
    
    @discardableResult
    func tryOptimised() -> CustomStringConvertible {
        tryBetter()
    }
}

public class ProblemsTester {
    
    public enum Problem: String,CaseIterable {
        case twoSum
        case buySellStockTimings
        case leadersInArray
    }
    
    public init() { }
    
    public class func testFor(_ problem: Problem) -> HyperTesting {
        switch problem {
        case .twoSum:
            return TwoSum()
        case .buySellStockTimings:
            return BuySellStockTimings()
        case .leadersInArray:
            return LeadersInArray()
        }
    }
}

public class HyperTester<T: HyperTesting> {
    
    public private(set) var tester: T
    
    public init(with tester: T) {
        self.tester = tester
    }
}
