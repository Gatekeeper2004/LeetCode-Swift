//
//  findMin.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/16.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

private func findMin(_ nums: [Int]) -> Int {
    var (left, right, mid) = (0, nums.count - 1, 0)
    
    while left <= right {
        if nums[left] <= nums[right] {
            return nums[left]
        }
        
        mid = (left + right) / 2
        
        if nums[left] <= nums[mid] {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return -1
}
