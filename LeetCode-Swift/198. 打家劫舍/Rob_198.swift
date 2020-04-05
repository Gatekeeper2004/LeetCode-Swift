//
//  Rob_198.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/23.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func rob_198(_ nums: [Int]) -> Int {
    if (nums.count == 0) {
        return 0
    }
    if (nums.count == 1) {
        return nums.first!
    }
    
    var dp:[Int] = []
    dp.append(nums[0])
    dp.append(max(nums[1], nums[0]))
    for i in 2 ..< nums.count {
        dp.append(max(dp[i - 1], dp[i - 2] + nums[i]))
        
    }
    return dp[nums.count - 1]
}
