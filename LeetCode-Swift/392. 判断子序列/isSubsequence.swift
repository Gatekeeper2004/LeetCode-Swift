//
//  isSubsequence.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/7/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func isSubsequence(_ s: String, _ t: String) -> Bool {
    var i = 0
    var j = 0
    let s = Array(s)
    let t = Array(t)
    while i < s.count && j < t.count {
        if s[i] == t[j] {
            i += 1
            j += 1
        } else {
            j += 1
        }
    }
    return i == s.count
}
