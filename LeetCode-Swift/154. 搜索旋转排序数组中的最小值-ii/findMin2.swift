//
//  findMin2.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/16.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

private func findMin(_ nums: [Int]) -> Int {
    var (left, right, mid) = (0, nums.count - 1, 0)
    
    while left <= right {
        mid = (left + right) / 2
        
        if nums[mid] > nums[right] {
            left = mid + 1
        } else if nums[mid] < nums[right] {
            right = mid
        } else {
            right = right - 1
        }
    }
    
    return nums[left]
}
