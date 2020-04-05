//
//  generateTheString.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/25.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func generateTheString(_ n: Int) -> String {
    var result = ""
    var m = n
    if n % 2 == 0 {
        result.append("a")
        m = m - 1
    }
    while m != 0 {
        result.append("b")
        m -= 1
    }
    return result
}
