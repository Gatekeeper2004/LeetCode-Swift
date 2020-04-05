//
//  rotateRight.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/29.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
    guard let _ = head?.next else {
        return head
    }
    var fast = head
    var slow = head
    var count = 0
    while fast != nil {
        fast = fast?.next
        count += 1
    }
    
    if k % count == 0 {
        return head
    }
    
    var k = k % count
    fast = head
    while k > 0 {
        k -= 1
        fast = fast?.next
    }
    
    while fast?.next != nil {
        fast = fast?.next
        slow = slow?.next
    }
    
    fast?.next = head
    let newHead = slow?.next
    slow?.next = nil
    return newHead
}
