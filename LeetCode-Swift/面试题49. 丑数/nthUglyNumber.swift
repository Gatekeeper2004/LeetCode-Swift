//
//  nthUglyNumber.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/9.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func nthUglyNumber(_ n: Int) -> Int {
    var dp = [Int].init(repeating: Int.min, count: n)
    var p2 = 0
    var p3 = 0
    var p5 = 0
    dp[0] = 1
    
    for i in 1..<n {
        dp[i] = min(min(dp[p2] * 2, dp[p3] * 3), dp[p5] * 5)
        
        if dp[i] == dp[p2] * 2 {
            p2 += 1
        }
        
        if dp[i] == dp[p3] * 3 {
            p3 += 1
        }
        if dp[i] == dp[p5] * 5 {
            p5 += 1
        }
    }
    
    return dp.last ?? 0
}
