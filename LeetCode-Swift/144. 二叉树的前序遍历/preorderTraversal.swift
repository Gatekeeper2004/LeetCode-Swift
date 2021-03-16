//
//  preorderTraversal.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

/**
* Definition for a binary tree node.
* public class TreeNode {
*     public var val: Int
*     public var left: TreeNode?
*     public var right: TreeNode?
*     public init(_ val: Int) {
*         self.val = val
*         self.left = nil
*         self.right = nil
*     }
* }
*/
//递归
//func preorderTraversal(_ root: TreeNode?) -> [Int] {
//    var result = Array<Int>.init()
//    guard let theRoot = root else {
//        return result
//    }
//    result.append(theRoot.val)
//    result.append(contentsOf: preorderTraversal(theRoot.left))
//    result.append(contentsOf: preorderTraversal(theRoot.right))
//
//    return result
//}
//迭代
func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = Array<Int>.init()
    var stack = [TreeNode?]()
    var point = root
    while !stack.isEmpty || point != nil {
        if point != nil {
            result.append(point!.val)
            stack.append(point)
            point = point?.left
        } else {
            let node = stack.last!
            stack.removeLast()
            point = node?.right
        }
    }
    return result
}
