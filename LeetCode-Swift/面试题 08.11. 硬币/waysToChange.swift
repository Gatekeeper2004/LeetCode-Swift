//
//  waysToChange.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/23.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func waysToChange(_ n: Int) -> Int {
    let coins = [1, 5, 10, 25]
    var dp = Array<Int>.init(repeating: 0, count: n + 1)
    dp[0] = 1
    
    for coin in coins {
        if coin > n {
            break
        }
        for i in coin...n {
            dp[i] = (dp[i] + dp[i - coin]) % 1000000007
        }
    }
     
    return dp[n]
}
