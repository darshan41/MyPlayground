/*:
 # Introduction
 
 Lets start with Basic Algorithms....
 
 Refered from, [Book](Data Structures and Algorithms in Swift - Implementing practical data structures with Swift 4 [EnglishOnlineClub.com]-2)
 
 - Playground Exercises from - Darshan S
 - Date: Jun 05, 2023
 */

//: ## Fizz Buzz Algorithm

/*:
 SelectionSort
 */

import Foundation

public class SelectionSort<T: Sequence & Comparable> {
    
    public func selectionSort(_ inputArray: [T]) -> [T] {
        var arr = inputArray
        for i in 0..<arr.count {
            var min: Int?
            for j in i..<arr.count {
                if arr[j] < arr[min ?? i] {
                    min = j
                }
            }
            if let min = min {
                arr.swapAt(min, i)
            }
        }
        return arr
    }
}
