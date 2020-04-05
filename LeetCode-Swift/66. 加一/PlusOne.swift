//
//  PlusOne.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/8.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func plusOne(_ digits: [Int]) -> [Int] {
    var result = [Int]()
    if digits.count == 0 {
        return result
    }
    var carry = 0
    for (index, digit) in digits.reversed().enumerated() {
        if index == 0 {
            if (digit >= 9) {
                carry = 1
                result.append(0)
            } else {
                result.append(digit + 1)
            }
        } else {
            if (digit >= 9) && (carry == 1) {
                carry = 1
                result.append(0)
            } else {
                result.append(digit + carry)
                carry = 0
            }
        }
    }
    if carry == 1 {
        result.append(1)
    }
    return result.reversed()
}
