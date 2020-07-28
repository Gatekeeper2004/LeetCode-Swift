//
//  maxDepth.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/7/28.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func maxDepth(_ root: TreeNode?) -> Int {
    return root == nil ? 0 : max(maxDepth(root?.left), maxDepth(root?.right)) + 1
}
