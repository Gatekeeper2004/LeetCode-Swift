//
//  minDiffInBST.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/12.
//  Copyright © 2020 yidingw. All rights reserved.
//
//same as 530 中序遍历 存上一个node
import Foundation

func minDiffInBST(_ root: TreeNode?) -> Int {
    var pre: TreeNode? = nil
    var result = Int.max
    func helper(node: TreeNode?) {
        if let nood = node {
            helper(node: nood.left)
            if let preval = pre?.val {
                result = min(result, nood.val - preval)
            }
            pre = node
            helper(node: nood.right)
            
        } else {
            return
        }
    }
    
    helper(node: root)
    
    return result
}
