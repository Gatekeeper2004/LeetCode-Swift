//
//  IsPalindrome.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/7.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func isPalindrome(_ x: Int) -> Bool {
    // 特殊情况：
            // 如上所述，当 x < 0 时，x 不是回文数。
            // 同样地，如果数字的最后一位是 0，为了使该数字为回文，
            // 则其第一位数字也应该是 0
            // 只有 0 满足这一属性
    
    var temp = x
    if x < 0 || (x % 10 == 0 && x != 0) {
        return false
    }
    
    var reverse = 0
    while temp > reverse {
        reverse = reverse * 10 + temp % 10
        temp = Int(temp/10)
    }
    
    // 当数字长度为奇数时，我们可以通过 revertedNumber/10 去除处于中位的数字。
    // 例如，当输入为 12321 时，在 while 循环的末尾我们可以得到 x = 12，revertedNumber = 123，
    // 由于处于中位的数字不影响回文（它总是与自己相等），所以我们可以简单地将其去除。

    return temp == reverse || temp == reverse/10
}
