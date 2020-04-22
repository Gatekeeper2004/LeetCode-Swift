//
//  rightSideView.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/22.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func rightSideView(_ root: TreeNode?) -> [Int] {
    if root == nil {
        return []
    }
    var levels = [[Int]]()
    func levelOrder(_ root: TreeNode?, _ level: Int) {
        if levels.count == level {
            levels.append(Array<Int>())
        }
        if let val = root?.val {
            var temp = levels[level]
            temp.append(val)
            levels[level] = temp
        }
        if let left = root?.left {
            levelOrder(left, level + 1)
        }
        if let right = root?.right {
            levelOrder(right, level + 1)
        }
        
        if root == nil {
            return
        }
    }
    levelOrder(root, 0)
    
    return levels.map{$0.last!}
}
