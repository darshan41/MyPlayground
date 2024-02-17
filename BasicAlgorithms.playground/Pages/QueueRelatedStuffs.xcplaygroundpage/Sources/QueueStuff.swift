import Foundation
import PlaygroundSupport


// Create a serial queue

public protocol Exampler {
    func startExample()
}

public class SerialSyncExample: Exampler {
    
    //.sync with Serial Queue:
    
    let serialQueue = DispatchQueue(label: "com.example.serial.sync")
    
    public func startExample() {
        serialQueue.sync {
            for i in 1...5 {
                print("Task 1: \(i)")
            }
        }
        
        serialQueue.sync {
            for j in 1...5 {
                print("Task 2: \(j)")
            }
        }
    }
}

public  class SerialASyncExample: Exampler {
    
    //.sync with Serial Queue:
    
    let serialQueue = DispatchQueue(label: "com.example.serial.async")
    
    public func startExample() {
        serialQueue.async {
            for i in 1...5 {
                print("Task 1: \(i)")
            }
        }
        
        serialQueue.async {
            for j in 1...5 {
                print("Task 2: \(j)")
            }
        }
    }
}

public  class ConcurrentSyncExample: Exampler {
    
    //.sync with Serial Queue:
    
    let serialQueue = DispatchQueue(label: "com.example.concurrent.sync")
    
    public func startExample() {
        serialQueue.sync {
            for i in 1...5 {
                print("Task 1: \(i)")
            }
        }
        
        serialQueue.sync {
            for j in 1...5 {
                print("Task 2: \(j)")
            }
        }
    }
}

public class ConcurrentASyncExample: Exampler {
    
    //.sync with Serial Queue:
    
    let serialQueue = DispatchQueue(label: "com.example.concurrent.async",attributes: .concurrent)
    
    public func startExample() {
        serialQueue.async {
            for i in 1...5 {
                print("Task 1: \(i)")
            }
        }
        
        serialQueue.async {
            for j in 1...5 {
                print("Task 2: \(j)")
            }
        }
    }
}

class ConcurrentAsyncBarrierExample: Exampler {
    
    let concurrentQueue = DispatchQueue(label: "com.example.concurrent.async.barrier", attributes: .concurrent)
    
    // Shared resource
    var sharedArray = [Int]()
    
    func startExample() {
        
        // Task 1: Append elements to the shared array
        concurrentQueue.async {
            for i in 1...5 {
                self.concurrentAppend(element: i)
            }
        }
        
        // Task 2 with a barrier: Print the shared array
        concurrentQueue.async(flags: .barrier) {
            print("Barrier Block: Start")
            // This block will only start after Task 1 completes
            // and it will prevent other tasks (Task 3 in this case) from starting until it finishes.
            self.printSharedArray()
            print("Barrier Block: End")
        }
        
        // Task 3: Append more elements to the shared array
        concurrentQueue.async {
            for j in 6...10 {
                self.concurrentAppend(element: j)
            }
        }
    }
    
    // Function to safely append elements to the shared array using a barrier
    private func concurrentAppend(element: Int) {
        concurrentQueue.async(flags: .barrier) {
            self.sharedArray.append(element)
            print("Appended: \(element)")
        }
    }
    
    // Function to safely print the shared array
    private func printSharedArray() {
        print("Shared Array: \(sharedArray)")
    }
}

public class ConcurrentAsyncBarrierCrashExample: Exampler {
    
    let concurrentQueue = DispatchQueue(label: "com.example.concurrent.async.barrier.crash", attributes: .concurrent)
    
    // Shared resource
    var sharedArray = [Int]()
    
    public func startExample() {
        
        // Task 1: Append elements to the shared array
        concurrentQueue.async {
            for i in 1...5 {
                self.concurrentAppend(element: i)
            }
        }
        
        // Task 2 with a barrier: Read and print the shared array
        concurrentQueue.async(flags: .barrier) {
            print("Barrier Block: Start")
            // Introduce a delay to increase the chance of a race condition
            sleep(1)
            self.printSharedArray()
            print("Barrier Block: End")
        }
        
        // Task 3: Append more elements to the shared array
        concurrentQueue.async {
            for j in 6...10 {
                self.concurrentAppend(element: j)
            }
        }
    }
    
    // Function to safely append elements to the shared array using a barrier
    private func concurrentAppend(element: Int) {
        concurrentQueue.async(flags: .barrier) {
            self.sharedArray.append(element)
            print("Appended: \(element)")
        }
    }
    
    // Function to safely print the shared array
    private func printSharedArray() {
        // Intentionally not using a barrier here to increase the likelihood of a race condition
        print("Shared Array: \(sharedArray)")
    }
}

public class ConcurrentAsyncBarrierCrashExample2: Exampler {
    
    let concurrentQueue = DispatchQueue(label: "com.example.concurrent.async.barrier.ConcurrentAsyncBarrierCrashExample2", attributes: .concurrent)
    
    // Shared resource
    var sharedArray = [Int]()
    
    public func startExample() {
        
        // Task 1: Append elements to the shared array
        concurrentQueue.async {
            for i in 1...5 {
                self.concurrentAppend(element: i)
            }
        }
        
        // Task 2 with a barrier: Read and print the shared array
        concurrentQueue.async(flags: .barrier) {
            print("Barrier Block: Start")
            // Introduce a delay to increase the chance of a race condition
//            sleep(3)
            self.printSharedArray()
            print("Barrier Block: End")
        }
        
        // Task 3: Append more elements to the shared array
        concurrentQueue.async {
            for j in 6...10 {
                self.concurrentAppend(element: j)
            }
        }
    }
    
    // Function to safely append elements to the shared array using a barrier
    private func concurrentAppend(element: Int) {
        concurrentQueue.async(flags: .barrier) {
            self.sharedArray.append(element)
            print("Appended: \(element)")
        }
    }
    
    // Function to safely print the shared array
    private func printSharedArray() {
        // Intentionally not using a barrier here to increase the likelihood of a race condition
        print("Shared Array: \(sharedArray)")
    }
}
//
//// Instantiate and run the example
//let example = ConcurrentAsyncBarrierExample()
//example.startExample()
//
//// Keep the playground running to observe potential issues
//
//
//let exampler1: Exampler = SerialSyncExample()
//let exampler2: Exampler = SerialASyncExample()
//let exampler3: Exampler = ConcurrentSyncExample()
//let exampler4: Exampler = ConcurrentASyncExample()
//let exampler5: Exampler = ConcurrentAsyncBarrierExample()
//let exampler6: Exampler = ConcurrentAsyncBarrierCrashExample()
//let exampler7: Exampler = ConcurrentAsyncBarrierCrashExample2()
//
//PlaygroundPage.current.needsIndefiniteExecution = true
////exampler1.startExample()
////exampler2.startExample()
////exampler3.startExample()
////exampler4.startExample()
//
//for i in 0...100 {
//    exampler7.startExample()
//}
