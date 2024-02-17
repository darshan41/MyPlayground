//: [Previous](@previous)

import Foundation

func createMemoryLeak() {
    let size = MemoryLayout<String>.size(ofValue: "Barbara")
    print("size for Barbara \(size)")
    let bytesPtr = malloc(1024 * 16)
    var ppp: String = "Barbara"
    guard var bytesPtr else {
        print("Did'nt find any allocation")
        return
    }
    print("Deallocation Success \(bytesPtr)")
    bytesPtr.initializeMemory(as: String.self, to: ppp)
    bytesPtr.deallocate()
    print("Deallocation Success \(bytesPtr.load(as: String.self))")
}

func createDanglingPointer() {
    var ptr: UnsafeMutablePointer<Int>? = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    ptr?.pointee = 42
    // deallocate ptr and set it to nil
    ptr?.deallocate()
//    ptr = nil
    // try to access ptr, which now points to deallocated memory
    let value = ptr?.pointee // this is a dangling pointer!
    if let val = value as? Int {
        print(val)
    }
}

func createUseAfterFree() {
    let ptr = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    ptr.pointee = 42
    // deallocate ptr
    ptr.deallocate()
    // try to access ptr, which now points to deallocated memory
    // this is called not a bug a feauture because i referenced deallocated memory
    let value = ptr.pointee
    print(value)
}

func createDoubleFree() {
    let ptr = UnsafeMutablePointer<Int>.allocate(capacity: 1)
    // free the memory twice
    ptr.deallocate()
    ptr.deallocate() // this is a double-free bug!
}

func createBufferOverflow() {
    let buffer = UnsafeMutablePointer<Int>.allocate(capacity: 5)
    buffer[5] = 42 // this is a buffer overflow!
}

func createBufferUnderflow() {
    let buffer = UnsafeMutablePointer<Int>.allocate(capacity: 5)
    let value = buffer[-1] // this is a buffer underflow!
}

createDanglingPointer()
//createMemoryLeak()
//createUseAfterFree()
//createDoubleFree()
//createBufferOverflow()
//createBufferUnderflow()




