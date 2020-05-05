//
//  isValidBST.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/5.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func isValidBST(_ root: TreeNode?) -> Bool {
    var queue = [(root, "black")]
    
    var result = [Int]()
    while !queue.isEmpty {
        let (node, color) = queue.popLast()!
        if let n = node {
            if color == "black" {
                queue.append((n.right, "black"))
                queue.append((n, "red"))
                queue.append((n.left, "black"))
            } else {
                if result.count > 0 && n.val <= result.last! {
                    return false
                }
                result.append(n.val)
            }
        }
    }
    
    return true
}
