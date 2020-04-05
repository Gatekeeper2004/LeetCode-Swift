//
//  fib.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/12.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func fib(_ n: Int) -> Int {
    var (a, b) = (0, 1)
    for _ in 0..<n {
        (a, b) = (b % 1000000007, (a + b) % 1000000007)
    }
    return a
}
