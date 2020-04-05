//
//  MaxProfit.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/16.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation
//贪心算法

func maxProfit(_ prices: [Int]) -> Int {
    var result = 0
    if prices.count <= 0 {
        return result
    }
    
    for index in 1...(prices.count - 1) {
        let tmp = prices[index] - prices[index - 1]
        if tmp > 0 {
            result = result + tmp
        }
    }
    return result
}
