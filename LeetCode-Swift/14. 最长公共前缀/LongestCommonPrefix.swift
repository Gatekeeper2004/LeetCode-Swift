//
//  LongestCommonPrefix.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/16.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func longestCommonPrefix(_ strs: [String]) -> String {
    if strs.count == 0 {
        return ""
    }
    var str = strs.first ?? ""
    for string in strs {
        while !string.hasPrefix(str) {
            let nsstr = str as NSString
            str = nsstr.substring(to: nsstr.length - 1)
        }
    }
    return str
}
