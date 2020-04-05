//
//  longestPalindrome.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/19.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func longestPalindrome(_ s: String) -> Int {
    var charMap = Dictionary<Character, Int>.init()
    for char in s {
        if let count = charMap[char] {
            charMap[char] = count + 1
        } else {
            charMap[char] = 1
        }
    }
    var odd = 0
    for v in charMap.values {
        if v % 2 == 1 {
            odd += 1
        }
    }
    
    return s.count - max(odd - 1, 0)
}

//from collections import Counter
//
//class Solution:
//    def longestPalindrome(self, s: str) -> int:
//        counter, odd = Counter(s), 0
//        for v in counter.values():
//            if v % 2 == 1:
//                odd += 1
//        return len(s) - max(odd - 1, 0)
