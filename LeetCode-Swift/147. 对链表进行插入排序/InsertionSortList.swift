//
//  InsertionSortList.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/13.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func insertionSortList(_ head: ListNode?) -> ListNode? {
    if head?.next == nil {
        return head
    }
    let dummyHead = ListNode(Int.min)
    var dummyTail:ListNode? = dummyHead
    var pre:ListNode? = dummyHead
    var point: ListNode? = head
    
    while point != nil {
        if dummyTail!.val < point!.val {
            dummyTail?.next = point
            dummyTail = dummyTail?.next
            point = point?.next
        } else {
            let tempNode = point?.next
            dummyTail?.next = tempNode
            while (pre != nil) && (pre!.next!.val < point!.val) {
                pre = pre?.next
            }
            point?.next = pre?.next
            pre?.next = point
            pre = dummyHead
            point = tempNode
        }
    }
    
    return dummyHead.next
}
