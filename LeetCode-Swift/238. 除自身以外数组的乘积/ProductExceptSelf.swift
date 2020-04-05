//
//  ProductExceptSelf.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/3.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//乘积 = 当前数左边的乘积 * 当前数右边的乘积
func productExceptSelf(_ nums: [Int]) -> [Int] {
    var (left, right) = (1, 1)
    var result:[Int] = Array.init(repeating: 1, count: nums.count)
    for i in 0..<nums.count {
        result[i] = left * result[i]
        left = nums[i] * left
        
        result[nums.count - 1 - i] = right * result[nums.count - 1 - i]
        right = nums[nums.count - 1 - i] * right
        
    }
    
    return result
}
