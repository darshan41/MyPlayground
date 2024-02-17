/*:
 # Introduction
 
 Lets start with Basic Algorithms....
 
 Refered from, [GoalKicker](https://goalkicker.com/AlgorithmsBook/)
 
 - Playground Exercises from - Darshan S
 - Date: October 13, 2022
 */

//: ## Fizz Buzz Algorithm

/*:
 Simple:
 - Fizz: A number Divisible by 3.
 - Buzz: A number Divisible by 5.
 - Fizz Buzz: A number Divisible by both 3 and 5.
 */

class FizzBuzzPrinter {
    
    private var numbers: [UInt]
         
    init(with numbers: [UInt]) {
        self.numbers = numbers
    }
    
    func startPrinting() {
        self.numbers.forEach({
            if $0 % 15 == 0 {
                print("Fizz Buzz")
            } else if ($0 % 3 == 0) {
                print("Fizz")
            } else if ($0 % 5 == 0) {
                print("Buzz")
            } else {
                print($0)
            }
        })
    }
}

FizzBuzzPrinter(with: Array(1...30)).startPrinting()

/*:
 > if a number is divisble by 3 and 5 then it must be divisible by 3 * 5
 */

//That's it...

//: [Next](@next)





