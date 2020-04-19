//
//  numIslands.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/19.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func numIslands(_ grid: [[Character]]) -> Int {
    if grid.count == 0 {
        return 0
    }
    let nr = grid.count
    let nc = grid[0].count
    var numIsland = 0
    
    var grid = grid
    
    func dfs(_ r: Int, _ c: Int) {
        if (r < 0 || c < 0 || r >= nr || c >= nc || grid[r][c] == "0") {
            return;
        }
        
        grid[r][c] = "0"
        dfs(r - 1, c)
        dfs(r + 1, c)
        dfs(r, c + 1)
        dfs(r, c - 1)
    }
    
    for r in 0..<nr {
        for c in 0..<nc {
            if grid[r][c] == "1" {
                numIsland += 1
                dfs(r, c)
            }
        }
    }
    
    return numIsland
}
