//
//  isPalindromeStr.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/6/19.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func isPalindrome(_ s: String) -> Bool {
    var left = 0
    var right = s.count - 1
    let s = Array(s)
    while left < right {
        while (left < right) && !(s[left].isHexDigit || s[left].isLetter)  {
            left += 1
        }
        while (left < right) && !(s[right].isHexDigit || s[right].isLetter)  {
            right -= 1
        }
        
        if (left < right) {
            if s[left].lowercased() != s[right].lowercased() {
                return false
            }
            
            left += 1
            right -= 1
        }
    }
    return true
}
