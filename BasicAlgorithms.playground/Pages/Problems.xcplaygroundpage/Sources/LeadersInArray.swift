import Foundation


public class LeadersInArray: HyperTesting {
    
    public init() { }
    
    public class func generateArray() -> [Int] {
        [7,1,5,3,6,4]
    }
    
    public let elements = generateArray()
}


public extension LeadersInArray {
    
    /// Fails
    @discardableResult
    func tryBruteForceMethod() -> CustomStringConvertible {
        guard !elements.isEmpty else { return "Empty Elements Found" }
        var leaders: [(Int,Int)] = []
        for index in 0..<elements.count {
            if getIsLeader(from: index) {
                leaders.append((index,elements[index]))
            }
        }
        return leaders
    }
    
    @discardableResult
    func tryBetter() -> CustomStringConvertible {
        tryOptimised()
    }
        
    @discardableResult
    func tryOptimised() -> CustomStringConvertible {
        var leaders: [(Int,Int)] = []
        var max = elements[elements.count - 1]
        guard !elements.isEmpty else { return leaders }
        for index in stride(from: elements.count, to: 0, by: -1) {
            let index = index - 1
            let element = elements[index]
            if element > max {
                max = element
                leaders.append((index,max))
            }
            print(index)
        }
        return leaders
    }
    
    private func getIsLeader(from index: Int) -> Bool {
        for i in index..<elements.count {
            if elements[index] > elements[i] {
                return true
            }
        }
        return false
    }
}
