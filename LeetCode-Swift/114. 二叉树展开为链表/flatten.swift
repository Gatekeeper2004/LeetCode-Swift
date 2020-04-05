//
//  flatten.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/3.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

fileprivate var result:[TreeNode] = []
func flatten(_ root: TreeNode?) {
    guard var theRoot = root else { return }
    preorder(theRoot)
    theRoot.left = nil
    for n in result {
        let newNode = TreeNode.init(n.val)
        theRoot.right = newNode
        if let temp = theRoot.right {
            theRoot = temp
        }
    }
}

fileprivate func preorder(_ root: TreeNode?) {
    guard let node = root else {
        return
    }
    result.append(node)
    preorder(node.left)
    preorder(node.right)
}
