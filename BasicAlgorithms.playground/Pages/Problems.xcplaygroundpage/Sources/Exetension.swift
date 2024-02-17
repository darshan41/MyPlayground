import Foundation

public extension Array where Element == Int {
    
    var cMinimum: Int? {
        guard !self.isEmpty else { return nil }
          var minValue = self[0]
          for value in self {
              if value < minValue {
                  minValue = value
              }
          }
          return minValue
    }
    
}
