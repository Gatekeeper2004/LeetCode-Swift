//
//  mySqrt.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/9.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
/*
 一个数的平方根肯定不会超过它自己，一个数的平方根最多不会超过它的一半
 */
func mySqrt(_ x: Int) -> Int {
    var left:CLongLong = 0
    var right:CLongLong = CLongLong(x/2 + 1)
    while left < right {
        let mid = left + ( right - left + 1)/2
        let square = mid * mid
        if (square > x) {
            right = mid - 1
        } else {
            left = mid
        }
    }
    return Int(left)
}
