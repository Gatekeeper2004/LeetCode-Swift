//
//  ReverseBetween.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/2.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}
//反转链表2
/*
 实现思路 ：以1->2->3->4->5, m = 2, n=4 为例:

 定位到要反转部分的头节点 2，head = 2；前驱结点 1，pre = 1；
 当前节点的下一个节点3调整为前驱节点的下一个节点 1->3->2->4->5,
 当前结点仍为2， 前驱结点依然是1，重复上一步操作。。。
 1->4->3->2->5.
 */

func reverseBetween(_ head: ListNode?, _ m: Int, _ n: Int) -> ListNode? {
    if m == n {
        return head
    }
    let dummy = ListNode.init(0)
    dummy.next = head
    var preNode = dummy
    for _ in 1..<m {
        if let next = preNode.next {
            preNode = next
        }
    }
    let head = preNode.next
    for _ in m..<n {
        let nextNode = head?.next
        head?.next = nextNode?.next
        nextNode?.next = preNode.next
        preNode.next = nextNode
    }
    
    return dummy.next
}
