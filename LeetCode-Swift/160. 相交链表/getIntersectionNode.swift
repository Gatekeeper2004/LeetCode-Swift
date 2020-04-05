//
//  getIntersectionNode.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/25.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func getIntersectionNode(_ headA: ListNode?, _ headB: ListNode?) -> ListNode? {
    var pointA = headA
    var pointB = headB
    while unsafeBitCast(pointA, to: Int.self) != unsafeBitCast(pointB, to: Int.self) {
        pointA = pointA == nil ? headB : pointA?.next
        pointB = pointB == nil ? headA : pointB?.next
    }
    return pointA
}
