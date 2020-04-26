//
//  mergeKLists.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/26.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//思路， 类似并归排序
func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        guard let l2 = l2 else {
            return l1
        }
        
        if l1.val < l2.val {
            l1.next = mergeTwoLists(l1.next, l2)
            return l1
        } else {
            l2.next = mergeTwoLists(l1, l2.next)
            return l2
        }
    }
    
    func merge(_ nodes:[ListNode?], _ left: Int, _ right: Int) -> ListNode? {
        if left == right {
            return nodes[left]
        }
        
        let mid = left + (right - left) / 2
        let l1 = merge(nodes, left, mid)
        let l2 = merge(nodes, mid + 1, right)
        return mergeTwoLists(l1, l2)
    }
    
    if lists.count == 0 {
        return nil
    }
    
    return merge(lists, 0, lists.count - 1)
    
}


