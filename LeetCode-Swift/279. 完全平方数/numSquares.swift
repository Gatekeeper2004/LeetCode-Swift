//
//  numSquares.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//类似层次遍历 求第一个满足条件的节点的层次
func numSquares(_ n: Int) -> Int {
    if n == 0 {
        return 0
    }
    var queue = Set<Int>()
    //var visited = [Int]()
    queue.insert(n)
    //visited.append(n)
    var count = 0
    while !queue.isEmpty {
        count += 1
        var next_queue = Set<Int>()
        
        for current in queue {
            //let current = queue.removeFirst()
            for i in stride(from: Int(sqrt(Double(current))), through: 1, by: -1) {
                let tmp = current - i * i
                if tmp < 0 {
                    break
                }
                if tmp == 0 {
                    return count
                }
//                if !visited.contains(tmp) {
//                    queue.append(tmp)
//                }
                //visited.append(tmp)
                next_queue.insert(tmp)
            }
        }
        queue = next_queue
    }
    return count
}
