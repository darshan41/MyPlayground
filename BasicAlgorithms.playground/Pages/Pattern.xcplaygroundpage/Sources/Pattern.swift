import Foundation

public class Pattern {
    
//    1.Pattern with square matrix with
    
    public class func printSquareMatrixWithStar(with n: Int) {
        var string: String = ""
        for _ in 0..<n {
            for _ in 0..<n {
                string += "*"
            }
            string += "\n"
        }
        print(string)
    }
    
//    2.Pattern with left pyramid
    
    public class func pattern2StarPyr(with n: Int) {
        var string: String = ""
        for i in 0..<n {
            for _ in 0..<i {
                string += "*"
            }
            string += "\n"
        }
        print(string)
    }
    
//    3.Pattern with left pyramid with numbers
    public class func pattern2StarPyrNumbers(with n: Int) {
        var string: String = ""
        for i in 1..<(n+1) {
            for j in 1..<(i+1) {
                string += String(j)
            }
            string += "\n"
        }
        print(string)
    }
    
//    4.Pattern with left pyramid with same numbers
    
        public class func pattern2StarPyrSameNumbers(with n: Int) {
            var string: String = ""
            for i in 1..<(n+1) {
                for _ in 1..<(i+1) {
                    string += String(i)
                }
                string += "\n"
            }
            print(string)
        }
    
    public class func pattern5(with n: Int) {
        var string: String = ""
        for i in 1..<(n+1) {
            var i: Int = i
            while i <= (n+1) {
                string += "*"
                i+=1
            }
            string += "\n"
        }
        print(string)
    }
    
    public class func pattern6(with n: Int) {
        var string: String = ""
        for i in 1..<(n+1) {
            var i: Int = i
            while i <= (n+1) {
                string += "\(i)"
                i+=1
            }
            string += "\n"
        }
        print(string)
    }
}

