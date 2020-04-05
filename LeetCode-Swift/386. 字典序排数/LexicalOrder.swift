//
//  LexicalOrder.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/9.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func lexicalOrder(_ n: Int) -> [Int] {
    var result = Array<Int>()
    
    func dfs(tmp: Int) {
        if tmp > n {
            return
        }
        result.append(tmp)
        for i in 0...9 {
            dfs(tmp: tmp * 10 + i)
        }
    }
    for i in 1...9 {
        dfs(tmp: i)
    }
    return result
}
/*
 先序遍历10叉树
 */

