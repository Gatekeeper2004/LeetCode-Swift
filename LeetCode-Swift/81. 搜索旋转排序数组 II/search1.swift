//
//  search.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/16.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

private func search(_ nums: [Int], _ target: Int) -> Bool {
    if nums.count == 0 {
        return false
    }
    
    var (left, right, mid) = (0, nums.count - 1, 0)
    
    while left <= right {
        mid = (left + right)/2
        
        if nums[mid] == target {
            return true
        }
        
        //去掉一个重复的干扰项
        if (nums[left] == nums[mid]) {
            left += 1;
            continue;
        }

        //前半部分有序,注意此处用小于等于
        if nums[left] <= nums[mid] {
            if target >= nums[left] && target < nums[mid] {
                right = mid - 1
            } else {
                left = mid + 1
            }
        } else {
            if target <= nums[right] && target > nums[mid] {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
    }
    return false
}
