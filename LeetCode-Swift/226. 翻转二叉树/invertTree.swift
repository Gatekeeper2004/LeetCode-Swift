//
//  invertTree.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/15.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let _ = root else {
        return root
    }

    _ = invertTree(root!.left)
    _ = invertTree(root!.right)
    let temp = root!.left
    root!.left = root!.right
    root!.right = temp
    return root
}
