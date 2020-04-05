//
//  MinStack.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/23.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//链表解法

class MinStack {
    private var head:StackNode?
    /** initialize your data structure here. */
    init() {
        
    }
    
    func push(_ x: Int) {
        if let _ = self.head {
            let node = StackNode.init(x, min: min(head?.min ?? 0, x))
            let temp = self.head
            self.head = node
            self.head?.next = temp
        } else {
            self.head = StackNode.init(x, min: x)
        }
    }
    
    func pop() {
        head = head?.next
    }
    
    func top() -> Int {
        if let val = head?.val {
            return val
        } else {
            return 0
        }
    }
    
    func getMin() -> Int {
        if let min = self.head?.val {
            return min
        } else {
            return 0
        }
    }
}

fileprivate class StackNode {
    var val = 0
    var min = 0
    var next:StackNode?
    
    init(_ val:Int, min:Int) {
        self.val = val
        self.min = min
    }
}
    

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
