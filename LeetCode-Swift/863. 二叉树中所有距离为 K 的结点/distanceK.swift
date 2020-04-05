//
//  distanceK.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/3.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//把二叉树转化成图,然后用BFS,找到从目标点出发,经过K步,到达的点
func distanceK(_ root: TreeNode?, _ target: TreeNode?, _ K: Int) -> [Int] {
    var K = K
    var graph = [Int : [Int]]()
    
    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }
        if let left = root.left {
            if let _ = graph[root.val] {
                graph[root.val]?.append(left.val)
            } else {
                var temp = [Int]()
                temp.append(left.val)
                graph[root.val] = temp
            }
            
            if let _ = graph[left.val] {
                graph[left.val]?.append(root.val)
            } else {
                var temp = [Int]()
                temp.append(root.val)
                graph[left.val] = temp
            }
            dfs(left)
        }
        if let right = root.right {
            if let _ = graph[root.val] {
                graph[root.val]?.append(right.val)
            } else {
                var temp = [Int]()
                temp.append(right.val)
                graph[root.val] = temp
            }
            
            if let _ = graph[right.val] {
                graph[right.val]?.append(root.val)
            } else {
                var temp = [Int]()
                temp.append(root.val)
                graph[right.val] = temp
            }
            
            dfs(right)
        }
    }
    dfs(root)//建图
    
    var result = [Int]()
    result.append(target!.val)
    var seen = Set<Int>()
    seen.insert(target!.val)
    //BFS寻找结果
    while K > 0 {
        var NextTime = [Int]()
        while !result.isEmpty {
            if let tmp = result.popLast() {
                if let graphArray = graph[tmp] {
                    for value in graphArray {
                        if !seen.contains(value) {
                            seen.insert(value)
                            NextTime.append(value)
                        }
                    }
                }
            }
        }
        
        K -= 1
        result = NextTime
    }
    return result
}
