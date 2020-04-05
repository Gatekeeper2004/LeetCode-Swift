//
//  numWays.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/11.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation


func numWays(_ n: Int) -> Int {
    if n <= 1 {
        return 1
    }
    
    var dp = Array<UInt64>.init(repeating: 0, count: n + 1)
    dp[1] = 1
    dp[0] = 1
    for i in 2...n {
        dp[i] = (dp[i - 1] + dp[i - 2]) % 1000000007
    }
    
    return Int(dp[n])
}
     
