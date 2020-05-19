//
//  validPalindrome.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/19.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//双指针 删除左或右指针字符，判断剩下的子串是否回文串
func validPalindrome(_ s: String) -> Bool {
    var left = 0
    var right = s.count - 1
    let s = Array(s)
    while left < right {
        if s[left] != s[right] {
            return isPali(s, left + 1, right) || isPali(s, left, right - 1)
        }
        left += 1
        right -= 1
    }
    
    return true
}

fileprivate func isPali(_ str: Array<Character>, _ left: Int, _ right: Int) -> Bool {
    var left = left
    var right = right
    while left < right {
        if str[left] != str[right] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}
