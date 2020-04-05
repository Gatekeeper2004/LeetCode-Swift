//
//  MergeTwoLists.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/12.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    let dummyHead = ListNode(0)
    var point:ListNode?
    point = dummyHead
    var list1 = l1
    var list2 = l2
    
    while (list1 != nil) && (list2 != nil) {
        if list1!.val < list2!.val {
            point?.next = list1
            point = point?.next
            list1 = list1?.next
        } else {
            point?.next = list2
            point = point?.next
            list2 = list2?.next
        }
    }
    
    if list1 == nil {
        point?.next = list2
    } else {
        point?.next = list1
    }
    return dummyHead.next
 }
