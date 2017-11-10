//: Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"


class Node {
    var value:Int!
    var next:Node?
    
}

class Stack {
    private var top:Node?
    private var current:Node?
    
    // 入栈
    func push(value: Int) {
        let node:Node = Node()
        node.value = value
        node.next = top
        top = node
    }
    
    // 出栈
    func pop() -> Int {
        let value = top?.value
        top = top?.next
        return value!
    }
    
    // 获取个数
    func get_count() -> Int {
        if top == nil {
            return 0
        }
        var point  = top
        var count:Int = 1
        
        while   point!.next != nil {
            point  =  point!.next
            count += 1
        }
        return count
    }
    
   
    // 遍历打印
    func show() {
        var point = top
        while point  != nil  {
            print(point!.value,terminator:"->")
            point = point?.next
        }
    }
}

let stack:Stack = Stack()
stack.push(value: 1)
stack.push(value: 2)
stack.push(value: 3)
stack.push(value: 4)
stack.push(value: 5)
stack.show()

