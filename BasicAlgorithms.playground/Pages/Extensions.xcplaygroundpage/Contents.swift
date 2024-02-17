//: [Previous](@previous)

import Foundation

public extension Int {
    
    var isPrime: Bool {
        guard self > 2 else { return false }
        return !(2..<self).contains(where: { self % $0 == 0})
    }
    
    static func isGoldBach(_ firstPrime: Self,_ secondPrime: Self) -> Bool {
        guard firstPrime.isPrime && secondPrime.isPrime else { return false }
        
    }   
}
