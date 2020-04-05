//
//  ReverseList.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/2.
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

func reverseList(_ head: ListNode?) -> ListNode? {
    if head == nil {
        return nil
    }
        
    var pre : ListNode?
    var next : ListNode?
    var cur : ListNode? = head

    while (cur != nil) {
        next = cur?.next;
        cur?.next = pre;
        pre = cur;
        cur = next;
    }
    
    return pre;
}
