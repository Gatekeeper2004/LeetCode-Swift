//
//  isPalindrome.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/25.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func isPalindrome(_ head: ListNode?) -> Bool {
    guard let theHead = head, let _ = head?.next else {
        return true
    }
    var fast: ListNode? = theHead
    var slow: ListNode? = theHead
    var p: ListNode?
    var pre: ListNode?
    
    while fast != nil && fast?.next != nil {
        p = slow
        slow = slow?.next
        fast = fast?.next?.next
        
        p?.next = pre
        pre = p
    }
    
    if (fast != nil) {
        slow = slow?.next
    }
    
    while p != nil {
        if p?.val != slow?.val {
            return false
        }
        p = p?.next
        slow = slow?.next
    }
    return true
}

