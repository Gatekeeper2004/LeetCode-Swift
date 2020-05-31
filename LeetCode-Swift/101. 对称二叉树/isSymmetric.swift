//
//  isSymmetric.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/31.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func isSymmetric(_ root: TreeNode?) -> Bool {
    if root == nil {
        return true
    }
    
    return check(root, root)
}

private func check(_ left: TreeNode?, _ right: TreeNode?) -> Bool {
    if left == nil && right == nil {
        return true
    }
    if left == nil || right == nil {
        return false
    }
    return (left?.val == right?.val) && check(left?.left, right?.right) && check(left?.right, right?.left)
}
