//
//  exist.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/24.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func exist(_ board: [[Character]], _ word: String) -> Bool {
    let wordArray = Array(word)
    var board = Array.init(board)
    func dfs(i: Int, j: Int, k: Int) -> Bool {
        if i >= board.count || i < 0 || j < 0 || j >= board[0].count || board[i][j] != wordArray[k] {
            return false
        }
        if k == wordArray.count - 1 {
            return true
        }
        let tmp = board[i][j]
        board[i][j] = "/"
        let res = dfs(i: i + 1, j: j, k: k + 1) || dfs(i: i - 1, j: j, k: k + 1) || dfs(i: i, j: j + 1, k: k + 1) || dfs(i: i, j: j - 1, k: k + 1)
        
        board[i][j] = tmp
        return res
    }
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if (dfs(i: i, j: j, k: 0)) {
                return true
            }
        }
    }
    return false
}
