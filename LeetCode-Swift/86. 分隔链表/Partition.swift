//
//  Partition.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/4.
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
func partition(_ head: ListNode?, _ x: Int) -> ListNode? {
    if(head == nil || head?.next == nil){
        return head;
    }
    var less = ListNode(0)
    let dummyHeadLess = less
    var more = ListNode(0)
    let dummyHeadMore = more
    var current = head
    
    while current != nil {
        if let headValue = current {
            if headValue.val < x {
                less.next = current
                if let lessNext = less.next {
                    less = lessNext
                }
            } else {
                more.next = current
                if let moreNext = more.next {
                    more = moreNext
                }
            }
        }
        current = current?.next
    }
    more.next = nil
    less.next = dummyHeadMore.next
    return dummyHeadLess.next
}
