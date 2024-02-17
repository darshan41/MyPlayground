import Foundation

public class BuySellStockTimings: HyperTesting {
    
    public init() { }
    
    public class func costOfStocksInIndexBasedDay() -> [Int] {
        [7,1,5,3,6,4]
    }
    
    public let stocks = costOfStocksInIndexBasedDay()
}


public extension BuySellStockTimings {
    
    @discardableResult
    func tryBruteForceMethod() -> CustomStringConvertible {
        let count = stocks.count
        guard count != 0 else { return 0 }
        guard count != 1 else { return stocks[0] }
        var mini = stocks[0]
        var profit = 0
        for index in 1..<stocks.count {
            let cost = stocks[index] - mini
            profit = max(cost, profit)
            mini = min(profit, stocks[index])
        }
        return "Profit \(profit), mini \(mini)"
    }
    
    @discardableResult
    func tryBetter() -> CustomStringConvertible {
        tryBruteForceMethod()
    }
    
    @discardableResult
    func tryOptimised() -> CustomStringConvertible {
        tryBruteForceMethod()
    }
}
