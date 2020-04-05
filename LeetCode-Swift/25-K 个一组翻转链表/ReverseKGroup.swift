//
//  ReverseKGroup.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/5.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

//https://mp.weixin.qq.com/s/kFx2yMqA26bP8VlwX2aGTA

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    let dummy = ListNode(0)
    dummy.next = head
    
    var prev = dummy
    var end: ListNode?
    end = dummy
    
    while end?.next != nil {
        for _ in stride(from: 0, to: k, by: 1) {
            end = end?.next
        }
        if end == nil {
            break
        }
        
        let start = prev.next
        let next = end?.next
        end?.next = nil
        
        prev.next = reverseList(start)
        start?.next = next
        if let s = start {
            prev = s
        }
        end = prev
    }
    
    
    return dummy.next
}

/*
private func reverseList(_ head: ListNode?) -> ListNode? {
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
*/
