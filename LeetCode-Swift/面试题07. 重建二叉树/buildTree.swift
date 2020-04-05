//
//  buildTree.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/12.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

//fileprivate
//fileprivate var preorder = Array<Int>.init()
//fileprivate var inorder = Array<Int>.init()
//fileprivate

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    var idx_map = Dictionary<Int, Int>()
    var pre_idx = 0
    
    func helper(_ inLeft: Int, _ inRight: Int) -> TreeNode? {
        if inLeft == inRight {
            return nil
        }
        let root = TreeNode.init(preorder[pre_idx])
        pre_idx += 1
        let index = idx_map[root.val]!
        
        root.left = helper(inLeft, index)
        root.right = helper(index + 1, inRight)
        return root
    }
    
    for (i, v) in inorder.enumerated() {
        idx_map[v] = i
    }
    return helper(0, inorder.count)
}
