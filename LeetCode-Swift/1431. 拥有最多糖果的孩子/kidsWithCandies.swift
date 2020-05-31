//
//  kidsWithCandies.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/6/1.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
    var result = [Bool]()
    if let max = candies.max() {
        for candy in candies {
            if candy + extraCandies >= max {
                result.append(true)
            } else {
                result.append(false)
            }
        }
        return result
    }
    return result
}
