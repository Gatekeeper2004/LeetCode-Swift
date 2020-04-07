//
//  largestNumber.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/7.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func largestNumber(_ nums: [Int]) -> String {
    if nums.reduce(0, +) == 0 {
        return "0"
    }
    let sorted = nums.map{String($0)}.sorted{$0+$1 > $1+$0}
    return sorted.joined()
}
