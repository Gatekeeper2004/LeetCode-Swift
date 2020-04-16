//
//  change2.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/16.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func change2(_ amount: Int, _ coins: [Int]) -> Int {
    var dp = [Int].init(repeating: 0, count: amount + 1)
    dp[0] = 1
    if amount == 0 {
        return dp[amount]
    }
    
    for coin in coins {
        for i in 1...amount {
            if i < coin {
                continue
            } else {
                dp[i] = dp[i] + dp[i - coin]
            }
        }
    }
    return dp[amount]
}
