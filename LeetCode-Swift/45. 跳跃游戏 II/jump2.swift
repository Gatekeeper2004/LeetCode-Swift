//
//  jump2.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/4.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func jump(_ nums: [Int]) -> Int {
    var end = 0
    var steps = 0
    var maxPosition = 0
    
    for i in 0..<nums.count - 1 {
        //找能跳的最远的
        maxPosition = max(maxPosition, nums[i] + i)
        if (i == end) { //遇到边界，就更新边界，并且步数加一
            end = maxPosition
            steps += 1
        }
    }
    return steps
}
