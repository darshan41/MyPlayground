import Foundation
import UIKit

public class CustomThreadPrinter {
    
    public init() { threadPrinter() }
    
    public func threadPrinter() {
        let current = Thread.current
        print(current, "isMainThread \(current.isMainThread)")
        let newThread = Thread()
        newThread.name = "new Thread"
        print(newThread, "isMainThread \(newThread.isMainThread)")
        let newNewThread = Thread()
        newNewThread.name = "new Thread"
        newNewThread.stackSize = 4096 * 512
        print(newNewThread, "isMainThread \(newNewThread.isMainThread)")
    }
}

public class CustomThreadTest {
    
    public func createThread() {
        Thread.detachNewThreadSelector(#selector(customPrint), toTarget: self, with: nil)
    }
    
    public func createInitThread() {
        let thread = Thread(target: self, selector: #selector(customPrint), object: nil)
        thread.start()
        let thread2 =  Thread()
        thread2.perform(#selector(customPrint), on: thread, with: nil, waitUntilDone: false, modes: nil)
        thread2.start()
    }
    
    @objc public func customPrint() {
        print("Current Thread \(Thread.current), isMainThread: \(Thread.current.isMainThread)")
    }
}

public class SyncAndAsyncTest {
    
    public func syncDemo() {
        print("Started Sync Block - Step 1")
        DispatchQueue.global().sync {
            print("Inside sync of global - Step 2")
        }
        print("Complted Step - 3")
    }
    
    public func asyncDemo() {
        print("Started Sync Block - Step 1")
        DispatchQueue.global().async {
            print("Inside sync of global - Step 2")
        }
        print("Complted Step - 3")
    }
    
    public func asyncDemoWithDefer() {
        defer {
            print("Ending scope")
        }
        print("Started Sync Block - Step 1")
        DispatchQueue.global().async {
            print("Inside sync of global - Step 2")
        }
        print("Complted Step - 3")
    }
}

public class PrivateQueueTest {
    
    private let serialQueue = DispatchQueue(label: "private Serial Queue")
    private let concurrentQueue = DispatchQueue(label: "private Concurrent Queue",attributes: .concurrent)
    
    public init() {
        serialDemo()
        concurrentDemo()
    }
    
    public func serialDemo() {
        
        print("Step 1")
        print("Queue: \(serialQueue.label) with qos: \(serialQueue.qos)")
        print("Queue: \(serialQueue.label) Starting... ")
        
        serialQueue.async {
            for i in (0...4) {
                print("\(self.serialQueue.label) async index: \(i)")
            }
            print("Queue: \(self.serialQueue.label) End.")
        }
        
        print("Step 2")
        
        serialQueue.sync {
            for i in (5...10) {
                print("\(self.serialQueue.label) sync index: \(i)")
            }
            print("Queue: \(self.serialQueue.label) End.")
        }
        print("Step 3 Serial Queue Ended.")
    }
    
    public func concurrentDemo() {
        print("Step 1")
        print("Queue: \(concurrentQueue.label) with qos: \(concurrentQueue.qos)")
        print("Queue: \(concurrentQueue.label) Starting... ")
        
        concurrentQueue.async {
            for i in (0...4) {
                print("\(self.concurrentQueue.label) async index: \(i)")
            }
            print("Queue: \(self.concurrentQueue.label) End.")
        }
        
        print("Step 2")
        
        concurrentQueue.sync {
            for i in (5...10) {
                print("\(self.concurrentQueue.label) sync index: \(i)")
            }
            print("Queue: \(self.concurrentQueue.label) End.")
        }
        print("Step 3 Concurrent Queue Ended.")
    }
}

public class BarrierTest {
    
    private let queue: DispatchQueue = DispatchQueue(
        label: "BarrierTest",
        attributes: .concurrent
    )
    
    public init() { }
    
    public func startDemo() {
        
        for i in 0...3 {
            queue.async {
                print("queue async \(i)")
            }
        }
        
        for i in 4...6 {
            queue.async(flags: .barrier) {
                print("queue Barrier async \(i)")
            }
        }
        
        for i in 7...10 {
            queue.async {
                print("queue async \(i)")
            }
        }
    }
    
}

//BarrierTest().startDemo()
