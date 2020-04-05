//
//  generateParenthesis.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

private func generateParenthesis(_ n: Int) -> [String] {
    var track = Array<String>.init()
    var reslut = Array<String>.init()
    
    func backtrack(_ left: Int, _ right: Int) {
        if left == n && right == n {
            reslut.append(track.joined())
            return
        }
        
        if (left < n) {
            track.append("(")
            backtrack(left + 1, right)
            track.removeLast()
        }
        if (left>right && right<n) {
            track.append(")")
            backtrack(left, right + 1)
            track.removeLast()
        }
        
    }
    backtrack(0, 0)
    return reslut
}
