//
//  climbStairs.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/6/13.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func climbStairs(_ n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    var dp = Array<Int>.init(repeating: 0, count: n + 1)
    dp[0] = 1
    dp[1] = 1
    for number in 2...n {
        dp[number] = dp[number - 1] + dp[number - 2]
    }
    return dp[n]
}
