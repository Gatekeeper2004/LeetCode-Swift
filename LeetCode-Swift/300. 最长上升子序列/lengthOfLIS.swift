//
//  lengthOfLIS.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/9.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//动态规划 + 二分查找
func lengthOfLIS(_ nums: [Int]) -> Int {
    let size = nums.count
    if size < 2 {
        return size
    }
    
    var cell = [Int].init()
    for num in nums {
        if num > cell.last ?? Int.min {
            cell.append(num)
            continue
        }
        
        var (left, right) = (0, cell.count - 1)
        while left < right {
            let mid = (left + right)/2
            if cell[mid] < num {
                left = mid + 1
            } else {
                right = mid
            }
        }
        cell[left] = num
    }
    
    return cell.count
}
