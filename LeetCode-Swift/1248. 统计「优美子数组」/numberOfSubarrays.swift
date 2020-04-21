//
//  numberOfSubarrays.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/21.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
// https://leetcode-cn.com/problems/count-number-of-nice-subarrays/solution/zhe-si-lu-shi-wo-kan-guo-zui-hao-li-jie-de-liao-by/
func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
    var odds = Array<Int>()
    for (index,n) in nums.enumerated() {
        if n % 2 == 1 {
            odds.append(index)
        }
    }
    if odds.count < k {
        return 0
    }
    var total = 0
    for i in 0...(odds.count - k) {
        var left = 0
        var right = 0
        var leftIndex = odds[i]
        var rightIndex = odds[i + k - 1]
        while leftIndex > 0 && nums[leftIndex - 1] % 2 == 0 {
            leftIndex -= 1
            left += 1
        }
        while rightIndex < nums.count - 1 && nums[rightIndex + 1] % 2 == 0 {
            right += 1
            rightIndex += 1
        }
        
        total += (left + 1) * (right + 1)
    }
    
    return total
}
