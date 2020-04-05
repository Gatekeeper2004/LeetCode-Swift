//
//  LongestValidParentheses.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/18.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func longestValidParentheses(_ s: String) -> Int {
    let reversedS = String(s.reversed())
    var result = 0
    var left = 0
    var right = 0
    
    for charS in s {
        if charS == "(" {
            left = left + 1
        } else if charS == ")" {
            right = right + 1
        }
        if left == right {
            result = max(result, 2 * left)
        } else if left < right {
            left = 0
            right = 0
        }
    }
    left = 0
    right = 0
    for charRS in reversedS {
        if charRS == "(" {
            left = left + 1
        } else if charRS == ")" {
            right = right + 1
        }
        
        if left == right {
            result = max(result, 2 * left)
        } else if left > right {
            left = 0
            right = 0
        }
    }
 
    return result
}
