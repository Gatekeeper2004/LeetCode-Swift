//
//  lowestCommonAncestor.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/31.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//二叉树搜索树 答案一样

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let nodeRoot = root else {
        return root
    }
    if nodeRoot.val == p?.val || nodeRoot.val == q?.val {
        return root
    }
    
    let left = lowestCommonAncestor(nodeRoot.left, p, q)
    let right = lowestCommonAncestor(nodeRoot.right, p, q)
    if left == nil {
        return right
    }
    
    if right == nil {
        return left
    }
    
    return root
}
