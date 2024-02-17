import Foundation
import XCTest

public protocol HyperTesting {
    
    @discardableResult
    func tryBruteForceMethod() -> CustomStringConvertible
    
    @discardableResult
    func tryOptimised() -> CustomStringConvertible
    
}

public class ProblemsTester {
    
    public enum Problem: String,CaseIterable {
        case twoSum
        case buySellStockTimings
    }
    
    public init() { }
    
    public class func testFor(_ problem: Problem) -> HyperTesting {
        switch problem {
        case .twoSum:
            return TwoSum()
        case .buySellStockTimings:
            return BuySellStockTimings()
        }
    }
}

public class HyperTester<T: HyperTesting> {
    
    public private(set) var tester: T
    
    public init(with tester: T) {
        self.tester = tester
    }
}
