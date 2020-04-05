//
//  removeDuplicates.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/6.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var i = 2
    while i < nums.count {
        if nums[i] == nums[i - 2] {
            nums.remove(at: i)
        } else {
            i = i + 1
        }
    }
    return nums.count
}

//双指针解法

