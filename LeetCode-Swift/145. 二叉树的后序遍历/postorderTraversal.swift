//
//  postorderTraversal.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    let (white, gray) = (0, 1)
    var stack = [(white, root)]
    
    while !stack.isEmpty {
        let (color, node) = stack.popLast()!
        if let n = node {
            if color == white {
                stack.append((gray, n))
                stack.append((white, n.left))
                stack.append((white, n.right))
            } else {
                result.append(n.val)
            }
        } else {
            continue
        }
    }
    return result
}
