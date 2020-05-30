//
//  largestRectangleArea.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/30.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//单调栈
//739. 每日温度
//496. 下一个更大元素 I
//42. 接雨水
//同属于此类
//讲解 https://blog.csdn.net/Zolewit/article/details/88863970
func largestRectangleArea(_ heights: [Int]) -> Int {
    if heights.count == 0 {
        return 0
    }
    if heights.count == 1 {
        return heights.first!
    }
    
    var stack = [Int]()
    var heights = heights
    heights.append(0)   //设置末尾边界
    var maxArea = 0
    
    for i in 0..<heights.count {
        while !stack.isEmpty && heights[i] < heights[stack.last!] {
            let topIndex = stack.last!
            let right = i
            _ = stack.popLast()
            let left = stack.isEmpty ? -1 : stack.last!
            maxArea = max(maxArea, heights[topIndex] * (right - left - 1))
            
        }
        stack.append(i)
    }
    return maxArea
}
