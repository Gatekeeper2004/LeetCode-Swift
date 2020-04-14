//
//  addTwoNumbers.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/14.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var stack1 = [Int].init()
    var stack2 = [Int].init()
    let dummy = ListNode.init(Int.min)
    
    func pushBack(_ head: ListNode?, _ stack: inout [Int]) {
        var head = head
        while head != nil {
            stack.append(head!.val)
            head = head?.next
        }
    }
    pushBack(l1, &stack1)
    pushBack(l2, &stack2)
    
    var carry = 0
    while !stack1.isEmpty || !stack2.isEmpty || carry != 0 {
        var tmp1 = 0
        var tmp2 = 0
        if let last = stack1.last {
            tmp1 = last
            stack1.removeLast()
        }
        if let last = stack2.last {
            tmp2 = last
            stack2.removeLast()
        }
        
        let sum = tmp1 + tmp2 + carry
        carry = sum / 10
        let mod = sum % 10
        let newNode = ListNode.init(mod)
        newNode.next = dummy.next
        dummy.next = newNode
    }
    
    return dummy.next
}
