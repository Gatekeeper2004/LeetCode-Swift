//
//  canJump.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/17.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func canJump(_ nums: [Int]) -> Bool {
    var result = false
    var right = 0
    for i in 0..<nums.count {
        if i <= right {
            right = max(right, i + nums[i])
            if right >= nums.count - 1 {
                result = true
                return result
            }
        }
    }
    
    
    return result
}
//从尾部出发进行跳跃效率会更高??
//并查集？？
