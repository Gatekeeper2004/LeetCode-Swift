//
//  IsCompleteTree.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/10.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func isCompleteTree(_ root: TreeNode?) -> Bool {
    guard root != nil else {
        return true
    }
    var queue = [root]
    var flag = false
    while !queue.isEmpty {
        let count = queue.count
        for _ in 0..<count {
            let currentNode = queue.removeFirst()
            if currentNode != nil  {
                if flag {//// 如果在这之前出现过null节点，根据完全二叉树的性质，可以判断结果了
                    return false
                } else {
                    queue.append(currentNode?.left)
                    queue.append(currentNode?.right)
                }
            } else {
                flag = true
            }
            
        }
    }
    return true
}
/*
 func isCompleteTree(_ root: TreeNode?) -> Bool {
       var qs = [root]
       while !qs.isEmpty {
           let v = qs.count
           for i in 0 ..< v {
               guard let u = qs.remove(at: 0) else {
                   continue
               }
               var child = [u.left, u.right]
               for c in child {
                   guard let t = c else {
                       qs.append(c)
                       continue
                   }
                   if qs.count > 0, let t = qs.last, t == nil {
                       return false
                   }
                   qs.append(c)
               }

           }
       }
       return true
   }
 */
