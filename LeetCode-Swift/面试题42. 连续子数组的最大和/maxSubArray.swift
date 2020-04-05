//
//  maxSubArray.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/18.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var result = Array<Int>.init(repeating: 0, count: nums.count)
    result[0] = nums[0]
    for i in stride(from: 1, to: nums.count, by: 1) {
        result[i] = nums[i] + max(result[i - 1], 0)
    }
    
    return result.max() ?? 0
}
