//
//  cloneGraph.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/28.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation


// Definition for a Node.
fileprivate class Node {
     public var val: Int
     public var neighbors: [Node?]
     public init(_ val: Int) {
         self.val = val
         self.neighbors = []
     }
}
//DFS
fileprivate func cloneGraph(_ node: Node?) -> Node? {
    var seen = Array<Node>()
    
    func dfs(_ node: Node?) -> Node? {
        guard let _ = node else {
            return nil
        }
        let nodes = seen.filter{ $0.val == node?.val}
        if nodes.count != 0 {
            return nodes.first
        }
        
        let clone = Node.init(node!.val)
        seen.append(clone)
        for n in node!.neighbors {
            clone.neighbors.append(dfs(n))
        }
        return clone
    }
    
    return dfs(node)
    
}

/*
 var queue = Array<Node>()
 queue.append(node!)
 while !queue.isEmpty {
     let temp = queue.first
     let clone = Node.init(temp!.val)
     seen.append(clone)
     for neighbor in temp!.neighbors {
         let nNodes = seen.filter{ $0.val == neighbor?.val}
         if nNodes.count > 0 {
             clone.neighbors.append(nNodes.first)
         } else {
             let nn = Node.init(neighbor!.val)
             seen.append(nn)
             queue.append(neighbor!)
         }
         
     }
 }
 
 
 return seen.first
 */
