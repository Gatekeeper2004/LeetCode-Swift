//
//  numRookCaptures.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/26.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func numRookCaptures(_ board: [[Character]]) -> Int {
    let rook = Character("R")
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            //先找到车的位置
            if board[i][j] == rook {
                //上下左右开找 d = direct
                return cap(board, i, j, -1, 0) + cap(board, i, j, 1, 0) + cap(board, i, j, 0, -1) + cap(board, i, j, 0, 1)
            }
        }
    }
    
    return 0
}

private func cap(_ board:[[Character]], _ x:Int, _ y: Int, _ dx: Int, _ dy: Int) -> Int {
    let bishop = Character("B")
    let pawn = Character("p")
    
    var x = x
    var y = y
    
    while x >= 0 && x < board.count && y >= 0 && y < board[x].count && board[x][y] != bishop {
        if board[x][y] == pawn {
            return 1;
        }
        x += dx
        y += dy
    }
    return 0
}

