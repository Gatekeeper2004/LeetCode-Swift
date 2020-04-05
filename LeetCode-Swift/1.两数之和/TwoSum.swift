//
//  TwoSum.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/11/29.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var dict = [Int: Int]()
    var complement = 0
    for (index, value) in nums.enumerated() {
        complement = target - value
        if (dict[complement] != nil) {
            return [dict[complement]!, index]
        } else {
            dict[value] = index
        }
    }
    print("No valid result found")
    return []
}
