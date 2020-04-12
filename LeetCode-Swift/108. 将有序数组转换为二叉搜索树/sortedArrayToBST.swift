//
//  sortedArrayToBST.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/12.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
    
    if nums.count == 0 {
        return nil
    }
    if nums.count == 1 {
        return TreeNode.init(nums[0])
    }
    
    let mid = nums.count/2
    
    let left = Array(nums[...(mid - 1)])
    let right = Array(nums[(mid+1)...])
    
    let node = TreeNode.init(nums[mid])
    node.left = sortedArrayToBST(left)
    node.right = sortedArrayToBST(right)
    return node
}
