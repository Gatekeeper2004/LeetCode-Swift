//
//  isSameTree.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/7.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil {
        return true
    }
    if p == nil || q == nil {
        return false
    }
    
    return isSameTree(p?.left, q?.left) && (p!.val == q!.val) && isSameTree(p?.right, q?.right)
}
