//
//  maxPathSum.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/6/21.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func maxPathSum(_ root: TreeNode?) -> Int {
    var maxSum = Int.min
    func dfs(_ node: TreeNode?) -> Int {
        if let n = node {
            let left = max(0, dfs(n.left))
            let right = max(0, dfs(n.right))
            maxSum = max(maxSum, left + n.val + right)
            return n.val + max(left, right)
        } else {
            return 0
        }
    }
    _ = dfs(root)
    return maxSum
}
