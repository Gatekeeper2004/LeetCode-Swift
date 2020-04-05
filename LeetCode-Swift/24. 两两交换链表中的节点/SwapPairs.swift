//
//  swapPairs.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/11/29.
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

func swapPairs(_ head: ListNode?) -> ListNode? {
    guard let nextNode = head?.next, let current = head else { return head }
    
    current.next = swapPairs(nextNode.next)
    nextNode.next = current
    return nextNode
}
