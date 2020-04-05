//
//  MaxPorfit_121.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/16.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func maxProfit_121(_ prices: [Int]) -> Int {
    if prices.count <= 1 {
        return 0
    }
    
    var minValue = prices[0]
    var maxValue = 0
    for index in 1...(prices.count - 1) {
        maxValue = max(maxValue, prices[index] - minValue)
        minValue = min(minValue, prices[index])
    }
    return maxValue
}

//峰谷法
/*
 作者：LeetCode
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-ii/solution/mai-mai-gu-piao-de-zui-jia-shi-ji-ii-by-leetcode/

 作者：rancho628
 链接：https://leetcode-cn.com/problems/best-time-to-buy-and-sell-stock-with-transaction-fee/solution/ti-hao-122mei-you-shou-xu-fei-jia-yi-dian-dong-xi-/
 */

func maxProfit_121_2(_ prices: [Int]) -> Int {
    if prices.count < 2 {
           return 0
    }
    var valley = prices[0]
    var maxPorofit = 0
    for i in 1..<prices.count {
        if prices[i] < valley {
            valley = prices[i]
        } else if prices[i] > valley {
            maxPorofit += prices[i] - valley
            valley = prices[i]
        }
    }
    return maxPorofit
}
