//
//  middleNode.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/23.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func middleNode(_ head: ListNode?) -> ListNode? {
    var fast = head
    var slow = head
    
    while fast != nil && fast?.next != nil {
        slow = slow?.next
        fast = fast?.next?.next
    }
    return slow
}
