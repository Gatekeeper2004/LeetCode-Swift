//
//  findOrder2.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/17.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//DFS 时间复杂度：O(M+N)，其中M为课程总数，N为先行课程总数。
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var result = [Int]()
    var visited = [Int].init(repeating: 0, count: numCourses)
    var adjance = [[Int]].init(repeating: [Int](), count: numCourses)
    
    func dfs(_ index: Int) -> Bool {
        if visited[index] == 1 {
            return false
        }
        if visited[index] == 2 {
            return true
        }
        visited[index] = 1
        for j in adjance[index] {
            if !dfs(j) {
                return false
            }
        }
        visited[index] = 2
        result.append(index)
        return true
    }
    for req in prerequisites {
        let index = req[0]
        let value = req[1]
        var temp = adjance[index]
        temp.append(value)
        adjance[index] = temp
    }
    for i in 0..<numCourses {
        if !dfs(i) {
            return []
        }
    }
    return result
}
