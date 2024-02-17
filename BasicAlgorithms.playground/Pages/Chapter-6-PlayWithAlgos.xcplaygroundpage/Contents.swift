//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

public class Test {
    
    public class func ringBufferTest(_ maxCount: Int) {
        
        var buffer = RingBuffer<Int>(count: 5)

        buffer.write(123)
        sleep(1)
        buffer.write(456)
        sleep(1)
        buffer.write(789)
        sleep(1)
        buffer.write(666)
        sleep(1)

        print(buffer.read())    // 123
        sleep(1)
        print(buffer.read())    // 456
        sleep(1)
        print(buffer.read())    // 789
        sleep(1)

        buffer.write(333)
        sleep(1)
        buffer.write(555)

        print(buffer.read())   // 666
        sleep(1)
        print(buffer.read())   // 333
        sleep(1)
        print(buffer.read())   // 555
        sleep(1)
        buffer.read()
    }
}


Test.ringBufferTest(5)
