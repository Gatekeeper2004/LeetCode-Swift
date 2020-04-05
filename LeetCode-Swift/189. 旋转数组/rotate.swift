//
//  rotate.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/3.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
/*
 三次反转
 对于[1,2,3,4,5,6,7]，
 根据
 k = k%n
 k=k%n，将数组分为两段：
 https://leetcode-cn.com/problems/rotate-array/solution/san-ci-fan-zhuan-fu-yi-xie-pythonicde-jie-fa-pytho/
 */

func rotate(_ nums: inout [Int], _ k: Int) {
    let K = k % nums.count
    
    func swap(L: Int, R: Int) {
        var left = L, right = R
        while left < right {
            (nums[left], nums[right]) = (nums[right], nums[left])
            left = left + 1
            right = right - 1
        }
    }
    swap(L: 0, R: nums.count - K - 1)
    swap(L: nums.count - K, R: nums.count - 1)
    nums.reverse()
    
}

