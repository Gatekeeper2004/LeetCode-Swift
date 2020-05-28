//
//  decodeString.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/28.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func decodeString(_ s: String) -> String {
    var stack = [(Int, String)]()
    var result = ""
    let s = Array(s)
    var num = 0 // 计算中括号前的数字是多少，不一定是一位数。
    
    for char in s {
        if char.isNumber {
            num = num * 10 + Int(String(char))!
        } else if (char == "[") {
            stack.append((num, result))
            result = ""
            num = 0
        } else if (char == "]") {
            if let (currentNum, lastResult) = stack.popLast() {
                let temp = result
                for _ in 1..<currentNum {
                    result += temp
                }
                
                result = lastResult + result
            }
        } else {
            result += String(char)
        }
    }
    return result
}
