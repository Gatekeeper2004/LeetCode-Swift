//
//  isSubtree.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/7.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
    if t == nil {
        return true
    }
    if s == nil {
        return false
    }
    
    return isSameTree(s, t) || isSubtree(s?.left, t) || isSubtree(s?.right, t)
}
