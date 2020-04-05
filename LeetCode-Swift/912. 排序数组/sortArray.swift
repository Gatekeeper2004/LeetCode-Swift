//
//  sortArray.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/31.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func sortArray(_ nums: [Int]) -> [Int] {
    if nums.count <= 1 {
        return nums
    }
    let povit = (nums.first! + nums.last!)/2
    let less = nums.filter{$0 < povit}
    let equal = nums.filter{$0 == povit}
    let greater = nums.filter{$0 > povit}
    
    return sortArray(less) + equal + sortArray(greater)
}
