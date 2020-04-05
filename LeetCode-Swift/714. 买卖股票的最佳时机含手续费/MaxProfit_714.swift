//
//  MaxProfit_714.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func maxProfit_714(_ prices: [Int], _ fee: Int) -> Int {
    if prices.count < 2 {
           return 0
    }
    var valley = prices[0]
    var maxPorofit = 0
    for i in 1..<prices.count {
        if prices[i] < valley {
            valley = prices[i]
        } else if prices[i] - fee > valley {
            maxPorofit += prices[i] - fee - valley
            valley = prices[i] - fee
        }
    }
    return maxPorofit
}

