//
//  isBalanced.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func isBalanced(_ root: TreeNode?) -> Bool {
    var result = true
    
    func helper(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        let left = helper(root?.left) + 1
        let right = helper(root?.right) + 1
        if abs(left - right) > 1 {
            result = false
        }
        return max(left, right)
    }
    _ = helper(root)
    
    return result
}
