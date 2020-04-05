//
//  rob3.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/24.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func rob_3(_ root: TreeNode?) -> Int {
    let res = robRecursion(root)
    return max(res[0], res[1])
}

fileprivate func robRecursion(_ node: TreeNode?) -> [Int] {
    guard let root = node else {
        return [0,0]
    }
    let leftResult = robRecursion(root.left)
    let rightResult = robRecursion(root.right)
    
    let choose = root.val + leftResult[1] + rightResult[1]
    let noChoose = max(leftResult[0], leftResult[1]) + max(rightResult[0], rightResult[1])
    return [choose, noChoose]
}


