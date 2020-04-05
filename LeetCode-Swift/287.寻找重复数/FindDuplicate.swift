//
//  FindDuplicate.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/1/13.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//二分法
func findDuplicate(_ nums: [Int]) -> Int {
    var left = 1
    var right = nums.count - 1
    while left < right {
        var result = 0
        let mid:Int = (left + right)/2
        for num in nums {
            if num <= mid {
                result = result + 1
            }
        }
        
        if result > mid {
            right = mid
        } else {
            left = mid + 1
        }
    }
    
    return left
}
//快慢指针 python
/*
 from typing import List
 def findDuplicate( nums: List[int]) -> int:
         slow = nums[0]
         fast = nums[nums[0]]
         while slow != fast:
             # print(slow, fast)
             slow = nums[slow]
             fast = nums[nums[fast]]
         slow = 0
         while slow != fast:
             slow = nums[slow]
             fast = nums[fast]
         return slow


 */
