//
//  InorderTraversal.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/2.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

public class TreeNode {
   public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/*
 颜色标记法-一种通用且简明的树遍历方法
 https://leetcode-cn.com/problems/binary-tree-inorder-traversal/solution/yan-se-biao-ji-fa-yi-chong-tong-yong-qie-jian-ming/
 */

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    let (white, gray) = (0, 1)
    var result:[Int] = []
    var stack = [(white, root)]
    
    while !stack.isEmpty {
        let (color, node) = (stack.popLast())!
        if let n = node {
            if color == white {
                stack.append((white, n.right))
                stack.append((gray, n))
                stack.append((white, n.left))
            } else {
                result.append(n.val)
            }
        } else {
            continue
        }
    }
    return result
}
