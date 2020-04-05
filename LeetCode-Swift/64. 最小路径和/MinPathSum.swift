//
//  MinPathSum.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/28.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func minPathSum(_ grid: [[Int]]) -> Int {
    guard let first = grid.first else {
        return 0
    }
    
    var result:Array<[Int]> = Array.init(repeating: Array.init(repeating: 0, count: first.count), count: grid.count)
    if grid.count == 0 {
        return 0
    }
    for i in 0..<grid.count {
        for j in 0..<first.count {
            if i == 0 && j == 0 {
                result[i][j] = grid[i][j]
            } else if (i == 0) {
                result[i][j] = result[i][j - 1] + grid[i][j]
            } else if (j == 0) {
                result[i][j] = result[i - 1][j] + grid[i][j]
            } else {
                result[i][j] = min(result[i - 1][j], result[i][j - 1]) + grid[i][j]
            }
        }
    }
    
    return result[grid.count - 1][first.count - 1]
}
