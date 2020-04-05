//
//  allPossibleFBT.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/3.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func allPossibleFBT(_ N: Int) -> [TreeNode?] {
    if N % 2 == 0 {
        return []
    }

    if N  == 1 {
        return [TreeNode.init(0)]
    }

    var leftNum = 1
    var rightNum = N - 2 //去掉root + left
    var result = Array<TreeNode>()
    while rightNum > 0 {
        let leftTree = allPossibleFBT(leftNum)
        let rightTree = allPossibleFBT(rightNum)

        for i in 0..<leftTree.count {
            for j in 0..<rightTree.count {
                let root = TreeNode.init(0)
                root.left = leftTree[i]
                root.right = rightTree[j]
                result.append(root)
            }
        }
        leftNum += 2
        rightNum -= 2
    }
    return result
}


