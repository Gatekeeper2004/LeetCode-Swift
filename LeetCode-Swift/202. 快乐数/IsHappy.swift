//
//  IsHappy.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/21.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func isHappy(_ n: Int) -> Bool {
    var slow = n; var fast = n
    repeat {
        slow = bitSquareSum(slow)
        fast = bitSquareSum(fast)
        fast = bitSquareSum(fast)
    } while(slow != fast)
    
    return slow == 1
}

fileprivate func bitSquareSum(_ n: Int) -> Int {
    var sum = 0
    var number = n
    while number > 0 {
        let bit = number % 10
        sum = sum + bit * bit
        number = number / 10
    }
    return sum
}
