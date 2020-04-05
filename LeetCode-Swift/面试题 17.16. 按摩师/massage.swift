//
//  massage.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/24.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func massage(_ nums: [Int]) -> Int {
    if nums.count == 0 {
        return 0
    }
    
    if nums.count == 1 {
        return nums[0]
    }
    
    var dp = Array<Int>.init(repeating: 0, count: nums.count)
    dp[0] = nums[0]
    dp[1] = max(nums[0], nums[1])
    for i in 2..<nums.count {
        dp[i] = max(dp[i - 1], dp[i - 2] + nums[i])
    }
    print(dp)
    return dp[nums.count - 1]
}
