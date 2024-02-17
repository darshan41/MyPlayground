import Foundation

public class BuySellStockTimings: HyperTesting {
    
    public init() { }
    
    public class func costOfStocksInIndexBasedDay() -> [Int] {
        [1,3,6,9,5,33]
    }
    
    public let stocks = costOfStocksInIndexBasedDay()
}


public extension BuySellStockTimings {
    
    @discardableResult
    func tryBruteForceMethod() -> CustomStringConvertible {
        guard !stocks.isEmpty else { return 0 }
        
        return ""
    }
    
    @discardableResult
    func tryOptimised() -> CustomStringConvertible {
        return ""
    }
}
