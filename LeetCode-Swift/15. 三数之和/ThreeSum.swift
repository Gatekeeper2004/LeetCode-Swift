//
//  ThreeNumberSum.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/1.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation


func threeSum(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    var result = [[Int]]()
    if nums.count < 3 {
        return result
    }
    let length = nums.count - 1
    for k in 0...length {
        if nums[k] > 0 {
            break  //nums[k] > 0 直接退出
        }
        if (k > 0) && (nums[k] == nums[k - 1]) {
            continue //防止有重复
        }
        
        var i = k + 1
        var j = nums.count - 1
        while i < j { //双指针
            let sum = nums[k] + nums[i] + nums[j]
            if sum == 0 {
                if (i - 1 > k) && (nums[i] == nums[i - 1]) {
                    i = i + 1
                } else {
                    result.append([nums[k],nums[i], nums[j]])
                    i = i + 1
                }
                
            } else if sum > 0 {
                j-=1
            } else if sum < 0 {
                i+=1
            }
        }
    }
    return result
}


