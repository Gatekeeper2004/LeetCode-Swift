//
//  mincostTickets.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/7.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//一维数组，动态规划
func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
    if days.count == 0 {
        return 0
    }
    var daysIndex = 0 //设定一个days指标，标记应该处理 days 数组中哪一个元素
    var dp = [Int].init(repeating: 0, count: days.last! + 1) //dp数组，每个元素代表到当前天数最少钱数，为下标方便对应，多加一个 0 位置
    for i in 1..<dp.count {
        if i != days[daysIndex] {
            dp[i] = dp[i-1]
        } else {
            //若 i 走到了待处理天数，则从三种方式中选一个最小的
            
            dp[i] = [dp[max(0, i - 1)] + costs[0],
                     dp[max(0, i - 7)] + costs[1],
                     dp[max(0, i - 30)] + costs[2]].min()!
            daysIndex += 1
        }
    }
    
    return dp.last!
}
