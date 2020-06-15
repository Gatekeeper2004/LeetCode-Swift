//
//  runningSum.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/6/15.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func runningSum(_ nums: [Int]) -> [Int] {
    var result = [Int].init(repeating: nums[0], count: nums.count)
    for i in 1..<nums.count {
        result[i] = nums[i] + result[i - 1]
    }
    return result
}
