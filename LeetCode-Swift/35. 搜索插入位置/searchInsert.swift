//
//  searchInsert.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/7/17.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    var (left, right) = (0, nums.count)
    while left < right {
        let mid = left + (right - left) / 2
        if nums[mid] > target {
            right = mid
        } else if nums[mid] < target {
            left = mid + 1
        } else {
            return mid
        }
    }
    return left
}
