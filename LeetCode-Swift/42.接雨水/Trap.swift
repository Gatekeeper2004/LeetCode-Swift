//
//  Trap.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/1/12.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//单调栈
/*
func trap(_ height: [Int]) -> Int {
    if height.count <= 2 {
        return 0
    }
    var stack:[Int] = Array.init(repeating: 0, count: height.count)
    var result = 0
    for i in stride(from: 0, to: height.count, by: 1) {
        while !stack.isEmpty && height[i] >= height[stack.last!] {
            let top = stack.popLast()
            if let last = stack.last {
                let distance = i - last - 1
                let bounded_height = min(height[i], height[last]) - height[top!]
                result = distance * bounded_height + result
            }
        }
        
        stack.append(i)
    }
    
    return result
}
*/
func trap(_ height: [Int]) -> Int {
    var maxarea = 0
    if height.count <= 1  {
        return maxarea
    }
    
    var left = 0
    var right = height.count - 1
    var lmax = height[left]
    var rmax = height[right]
    while left <= right {
        lmax = max(lmax, height[left])
        rmax = max(rmax, height[right])
        if lmax < rmax {
            maxarea = lmax - height[left] + maxarea
            left = left + 1
        } else {
            maxarea = rmax - height[right] + maxarea
            right = right - 1
        }
    }
    return maxarea
}
