//
//  ContainsDuplicate.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/1.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    let set = Set(nums.map { $0 })
    return !(set.count == nums.count)
}
