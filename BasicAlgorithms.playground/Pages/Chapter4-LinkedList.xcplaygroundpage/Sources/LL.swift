import Foundation

public protocol LinkedNodeCrudOperable {
    
    associatedtype Value
    
    @discardableResult
    mutating func push(_ value: Value) -> Node<Value>
    
    @discardableResult
    mutating func append(_ value: Value) -> Node<Value>
    
    func node(at index: Int) -> Node<Value>?
    
    @discardableResult
    mutating func insert(
        _ value: Value,
        after node: Node<Value>
    ) -> Node<Value>
    
    @discardableResult
    mutating func pop() -> Value?
    
    @discardableResult
    mutating func removeLast() -> Value?
    
    @discardableResult
    mutating func remove(after node: Node<Value>) -> Value?
    
    var values: [Value] { get }
}

public struct LinkedList<Value>: LinkedNodeCrudOperable {
    
    public private (set)var head: Node<Value>?
    public private (set)var tail: Node<Value>?
    
    public init(head: Node<Value>? = nil, tail: Node<Value>? = nil) {
        self.head = head
        self.tail = tail
    }
    
    public init() {}
}

public extension LinkedList {
    
    var isEmpty: Bool { head == nil }
    
    @discardableResult
    mutating func push(_ value: Value) -> Node<Value> {
        copyNodes()
        let head = Node(value: value, next: self.head)
        self.head = head
        if tail == nil {
            tail = head
        }
        return head
    }
    
    @discardableResult
    mutating func pop() -> Value? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }
    
    @discardableResult
    mutating func removeLast() -> Value? {
        copyNodes()
        guard let head = head else {
            return nil
        }
        guard head.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        while let next = current.next {
            prev = current
            current = next
        }
        prev.next = nil
        tail = prev
        return current.value
    }
    
    @discardableResult
    mutating func append(_ value: Value) -> Node<Value> {
        copyNodes()
        guard !isEmpty else {
            return push(value)
        }
        let node = Node(value: value)
        tail!.next = node
        tail = node
        return node
    }
    
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }
    
    @discardableResult
    mutating func insert(
        _ value: Value,
        after node: Node<Value>
    ) -> Node<Value> {
        copyNodes()
        guard tail !== node else {
            append(value)
            return tail!
        }
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    @discardableResult
    mutating func remove(after node: Node<Value>) -> Value? {
        copyNodes()
        defer {
            if node.next === tail {
                tail = node
            }
            node.next = node.next?.next
        }
        return node.next?.value
    }
    
    var values: [Value] { self.compactMap({ $0 }) }
}

// MARK: CustomStringConvertible

extension LinkedList: CustomStringConvertible {
    
    public var description: String {
        guard let head = head else {
            return "Empty list"
        }
        return String(describing: head)
    }
}

extension LinkedList: Collection {
    
    public var startIndex: Index { Index(node: head) }
    
    public var endIndex: Index { Index(node: tail?.next) }
    
    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }
    
    public subscript(position: Index) -> Value {
        position.node!.value
    }
    
    public struct Index: Comparable {
        
        public var node: Node<Value>?
        
        public static func == (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            switch (lhs.node,rhs.node) {
            case let (left?,right?):
                return left.next === right.next
            case (nil,nil):
                return true
            default:
                return false
            }
        }
        
        public static func < (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            guard lhs != rhs else {
                return false
            }
            let nodes = sequence(first: lhs.node) { $0?.next }
            return nodes.contains { $0 === rhs.node }
        }
    }
}

// MARK: Helper func's

private extension LinkedList {
    
    mutating func copyNodes() {
        guard var oldNode = head else {
            return
        }
        guard !isKnownUniquelyReferenced(&head) else {
            return
        }
        head = Node(value: oldNode.value)
        var newNode = head
        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        tail = newNode
    }
}
