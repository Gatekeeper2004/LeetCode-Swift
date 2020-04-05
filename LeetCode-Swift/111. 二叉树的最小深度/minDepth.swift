//
//  minDepth.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func minDepth(_ root: TreeNode?) -> Int {

    if root == nil {
        return 0
    }

    if root?.left == nil && root?.right == nil {
        return 1
    }

    var mindep = Int.max
    if let left = root?.left {
        mindep = min(minDepth(left), mindep)
    }

    if let right = root?.right {
        mindep = min(minDepth(right), mindep)
    }

    return mindep + 1
}
