//
//  searchRange.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/31.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    let t1 = Double(target) - 0.5
    let t2 = Double(target) + 0.5
    if nums.count == 0 || nums[nums.count - 1] < target || target < nums[0] {
        return [-1,-1]
    }
    var left = 0
    var right = nums.count - 1
    var mid = 0
    while left <= right {
        mid = (left + right)/2
        if (Double(nums[mid]) > t1) {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    var result = Array<Int>.init()
    if nums[left] == target {
        result.append(left)
    } else {
        return [-1,-1]
    }
    left = 0
    right = nums.count - 1
    mid = 0
    while left <= right {
        mid = (left + right)/2
        if (Double(nums[mid]) > t2) {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    if nums[left - 1] == target {
        result.append(left - 1)
    } else {
        return [-1,-1]
    }
    return result
}
