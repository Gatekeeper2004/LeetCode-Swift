//
//  LevelOrder.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/9.
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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
      let (white, gray) = (0, 1)
      var result:[[Int]] = []
      var stack = [(white, root, 0)]
      
      while !stack.isEmpty {
          let (color, node, level) = stack.popLast()!
          if let n = node {
              if color == white {
                  stack.append((white, n.right, level + 1))
                  stack.append((white, n.left, level + 1))
                  stack.append((gray, n, level))
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
      return result
}

//func levelOrder(_ root: TreeNode?) -> [[Int]] {
//    var levels = Array<Array<Int>>()
//
//    func helper( node: TreeNode?, level: Int) {
//        if (levels.count == level) {
//            levels.append(Array<Int>())
//        }
//        if let val = node?.val  {
//            var temp = levels[level]
//            temp.append(val)
//            levels[level] = temp
//        }
//
//        if let left = node?.left {
//            helper(node: left, level: level + 1)
//        }
//        if let right = node?.right {
//            helper(node: right, level: level + 1)
//        }
//    }
//
//    if root == nil {
//        return levels
//    }
//    helper(node: root, level: 0)
//    return levels
//}
