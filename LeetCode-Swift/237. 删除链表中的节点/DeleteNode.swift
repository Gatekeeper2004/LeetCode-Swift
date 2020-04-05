//
//  DeleteNode.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/12.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func deleteNode(_ node: ListNode?) {
    if let nextVal = node!.next?.val {
        node?.val = nextVal
        node?.next = node?.next?.next
    }
}
