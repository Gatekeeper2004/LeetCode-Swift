//
//  zigzagLevelOrder.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    let (white, gray) = (0, 1)
    var result:[[Int]] = []
    var stack = [(white, root, 0)]
    
    while !stack.isEmpty {
        let (color, node, level) = stack.popLast()!
        if let n = node {
            if color == white {
                if (level + 1) % 2 == 0 {
                    stack.append((white, n.right, level + 1))
                    stack.append((white, n.left, level + 1))
                    stack.append((gray, n, level))
                } else if (level + 1) % 2 == 1 || level == 1 {
                    stack.append((white, n.left, level + 1))
                    stack.append((white, n.right, level + 1))
                    stack.append((gray, n, level))
                }
                
            } else {
                if result.count < level + 1 {
                    result.append([])
                }
                var a = Array.init(result[level])
                a.append(n.val)
                result[level] = a
            }
        } else {
            continue
        }
    }
    for i in 0..<result.count {
        if i % 2 == 1 {
            result[i] = result[i].reversed()
        }
    }
    return result
}
