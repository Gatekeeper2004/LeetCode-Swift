//
//  LengthOfLongestSubstring.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/28.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func lengthOfLongestSubstring(_ s: String) -> Int {
    if (s.count == 0) || (s.count == 1) {
        return s.count
    }
    var set:[Character: Int] = [:]
    var result = 0
    var start = 0
    var index = 0
    for char in s {
        if set[char] != nil {
            if let i = set[char] {
                start = max(i + 1, start)
            }
        }
        result = max(result, index - start + 1)
        set[char] = index
        index = index + 1
    }
    return result
}
