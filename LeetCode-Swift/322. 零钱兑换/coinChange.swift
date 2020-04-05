//
//  coinChange.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/4.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    if amount == 0 {
        return -1
    }
    var dp = Array<Int>.init(repeating: amount + 1, count: amount + 1)
    dp[0] = 0
    
    for i in 1...amount {
        for j in 0..<coins.count {
            if coins[j] <= i {
                dp[i] = min(dp[i], dp[i - coins[j]] + 1)
            }
        }
    }
    
    return dp[amount] > amount ? -1 : dp[amount]
}
