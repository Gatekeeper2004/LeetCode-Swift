//
//  singleNumber.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/28.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var result = 0
    for i in nums {
        result = result ^ i
    }
    return result
}
