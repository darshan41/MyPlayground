import Foundation

public class QueueTest {
    
    public enum TestCase {
        case array
//        case linkedListQueue
    }
    
    public private (set)var testWith: TestCase = .array
    
    private lazy var arrayQueue: ArrayQueue<String> = { ArrayQueue() }()
    
    public init(testCase: TestCase = .array) {
        self.testWith = testCase
    }
}

// MARK: Public func's

public extension QueueTest {
    
    func testCase() {
        switch self.testWith {
        case .array:
            testArrayCase()
//        case .linkedListQueue:
//            testDoublyLinkedListCase()
        }
    }
}

// MARK: Helper func's

private extension QueueTest {
    
    func testArrayCase() {
        arrayQueue.enqueue("Ray")
        arrayQueue.enqueue("Brian")
        arrayQueue.enqueue("Eric")
        arrayQueue.dequeue()
        print(arrayQueue.peek ?? "None")
    }
    
    func testDoublyLinkedListCase() {
        #warning("To Do")
        print("TO DO")
    }
}
