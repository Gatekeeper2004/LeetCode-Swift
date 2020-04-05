//
//  reverse.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/30.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
func reverse(_ x: Int) -> Int {
    var x = x
    var result = 0
    while x != 0 {
        let pop = x % 10
        x = x / 10
        if (result > Int32.max/10) || (result == Int.max/10 && pop > Int.max % 10) {
            return 0
        }
        if (result < Int.min/10) || (result == Int.min/10 && pop < Int.min % 10) {
            return 0
        }
        
        result = result * 10 + pop
    }
    return result
}
