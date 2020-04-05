//
//  MaxArea.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/8.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func maxArea(_ height: [Int]) -> Int {
    var maxarea = 0
    if height.count == 1  {
        return maxarea
    }
    
    var left = 0
    var right = height.count - 1
    while left < right {
        maxarea = max(maxarea, min(height[left], height[right]) * abs(left - right))
        if height[left] < height[right] {
            left = left + 1
        } else {
            right = right - 1
        }
    }
    return maxarea
}
