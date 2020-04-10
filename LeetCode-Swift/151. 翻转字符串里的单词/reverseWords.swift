//
//  reverseWords.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/10.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//不用库函数和高阶函数，只用双指针
func reverseWords(_ s: String) -> String {
    let s = s.trimmingCharacters(in: .whitespacesAndNewlines) as NSString
    var j = s.length - 1
    var i = j
    var result = ""
    while i >= 0 {
        while i >= 0 && s.substring(with: NSMakeRange(i, 1)) != " " {
            i -= 1
        }
        result.append(s.substring(with: NSMakeRange(i + 1, (j + 1) - (i + 1))) + " ")
        while i >= 0 && s.substring(with: NSMakeRange(i, 1)) == " " {
            i -= 1
        }
        j = i
    }
    
    return result.trimmingCharacters(in: .whitespaces) as String
}
