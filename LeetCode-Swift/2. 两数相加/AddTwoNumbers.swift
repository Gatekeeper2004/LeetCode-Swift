//
//  AddTwoNumbers.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/5.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.next = nil
 *     }
 * }
 */
/* 暴力两数相加，swift没有超长整形，弃用
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        if ((l1?.val == 0) && (l1?.next == nil)) && ((l2?.val == 0) && (l2?.next == nil))  {
            return ListNode(0)
            
        }
        var value1: Int64 = 0
        var value2: Int64 = 0
        var l1Head = l1
        var l2Head = l2
        var step = 1
        while l1Head != nil {
            value1 = value1 + Int64(((l1Head?.val ?? 0) * step))
            l1Head = l1Head?.next
            step = step * 10
        }
        step = 1
        while l2Head != nil {
            value2 = value2 + Int64(((l2Head?.val ?? 0) * step))
            l2Head = l2Head?.next
            step = step * 10
        }
        
        var value = value1 + value2
        let dummyHead = ListNode(0)
        var point = dummyHead
        while value >= 1 {
            let val = Int(value % 10)
            let node = ListNode(val)
            point.next = node
            value = (value - (value % 10)) / 10;
            if let next = point.next {
                point = next
            }
        }
        return dummyHead.next
    }
}
*/

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    if ((l1?.val == 0) && (l1?.next == nil)) && ((l2?.val == 0) && (l2?.next == nil))  {
        return ListNode(0)
        
    }
    let dummyHead = ListNode(-1)
    var point = dummyHead
    var l1Head = l1
    var l2Head = l2
    var carry = 0
    while (l1Head != nil || l2Head != nil) {
        let value1 = l1Head?.val ?? 0
        let value2 = l2Head?.val ?? 0
        
        var value = value1 + value2 + carry
        if value >= 10 {
            value = value % 10
            carry = 1
        } else {
            carry = 0
        }
        
        l1Head = l1Head?.next
        l2Head = l2Head?.next
        
        let node = ListNode(value)
        point.next = node
        if let next = point.next {
            point = next
        }
        carry = 0
    }
    if carry == 1 {
        point.next = ListNode(1)
    }
    
    return dummyHead.next
}
