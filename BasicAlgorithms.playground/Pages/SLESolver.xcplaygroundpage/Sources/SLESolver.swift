import Foundation

public protocol LinearResult {
    var a: Double { get set }
    var b: Double { get set }
    var c: Double { get set }
}

public enum SLEMethod {
    case cramersRule
}

/// Structure for matrix reference.
public struct Matrix2x2 {
    var m11: Double
    var m12: Double
    var m21: Double
    var m22: Double
    
    var determinant: Double {
        (m11 * m22) - (m12 * m21)
    }
}

public struct LinearEquation: LinearResult {
    public var a: Double
    public var b: Double
    public var c: Double
}

///Simple Linear Equations Solver
public class SLESolver {
    
    var methodology: SLEMethod = .cramersRule
    
    /// Solves Simple Linear Equations by cramer's Rule
    /// - Parameters:
    ///   - equation1: linear Equation 1 form (ax + by = c)
    ///   - equation2: linear Equation 2 form (ax + by = c)
    /// - Returns: Returns solution to Simple Linear Equations  and nil if determinant of A is zero (Currently only cramer's rule is applied).
    func solveLinearEquation(
        _ equation1: LinearResult,
        _ equation2: LinearResult
    ) -> (x: Double,y: Double)? {
        switch methodology {
        case .cramersRule:
            return solveByCramersRule(equation1, equation2)
        }
    }
    
    /// Solves Simple Linear Equations by cramer's Rule
    /// - Parameters:
    ///   - equation1: linear Equation 1 form (ax + by = c)
    ///   - equation2: linear Equation 2 form (ax + by = c)
    /// - Returns: Returns solution to Simple Linear Equations via Cramer's Rule and nil if determinant of A is zero
    func solveByCramersRule(
        _ equation1: LinearResult,
        _ equation2: LinearResult
    ) -> (x: Double,y: Double)? {
        let detA = Matrix2x2(
            m11: equation1.a,
            m12: equation1.b,
            m21: equation2.a,
            m22: equation2.b
        ).determinant
        guard detA != 0 else { return nil }
        let detAx = Matrix2x2(
            m11: equation1.c,
            m12: equation1.b,
            m21: equation2.c,
            m22: equation2.b
        ).determinant
        let detAy = Matrix2x2(
            m11: equation1.a,
            m12: equation1.c,
            m21: equation2.a,
            m22: equation2.c
        ).determinant
        return (detAx/detA,detAy/detA)
    }
}
/*:
 ```
 if let (x,y) = SLESolver().solveLinearEquation(LinearEquation(a: 2, b: 3, c: 7), LinearEquation(a: 4, b: -5, c: 3)) {
 print((x,y)) // prints (2.0, 1.0)
 } else {
 print("No Solution")
 }
 ```
 */
