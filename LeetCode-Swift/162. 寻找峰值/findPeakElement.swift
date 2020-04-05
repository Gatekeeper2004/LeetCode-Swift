//
//  findPeakElement.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/28.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func findPeakElement(_ nums: [Int]) -> Int {
    if nums.count <= 1 {
        return 0
    }
    if nums.count == 2 {
        return nums[0] > nums[1] ? 0 : 1
    }
    
    
    
    
    var left = 0
    var right = nums.count - 1
    
    while left <= right {
        if left == right {
            return right
        }
        if right - left == 1 {
            return nums[left] > nums[right] ? left : right
        }
        
        let mid = (left + right)/2
        if nums[mid - 1] < nums[mid] && nums[mid + 1] < nums[mid] {
            return mid
        }
        if nums[mid - 1] > nums[mid] {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return -1
}
