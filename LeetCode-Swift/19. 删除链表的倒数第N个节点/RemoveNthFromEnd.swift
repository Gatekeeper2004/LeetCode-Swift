//
//  RemoveNthFromEnd.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/3.
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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    if n == 0 {
    return head
}

if (n == 1) && (head?.next == nil) {
    return nil
}

let dummyHead = ListNode(0)
dummyHead.next = head
let p:ListNode = ListNode(0)
p.next = dummyHead
let q:ListNode = ListNode(0)
q.next = dummyHead
for _ in 1...(n+1) {
    if let next = q.next {
        q.next = next.next
    }
}
if q.next == nil {
    return head?.next
}

while (q.next != nil) {
    if let next = q.next {
        q.next = next.next
    }
    if let next = p.next {
        p.next = next.next
    }
}

let newNext = p.next?.next?.next
p.next?.next = nil
p.next?.next = newNext

return head
}
