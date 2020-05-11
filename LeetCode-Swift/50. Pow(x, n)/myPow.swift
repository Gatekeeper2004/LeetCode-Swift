//
//  myPow.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/11.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
/* 思路：
 如果 n 是偶数，我们将 n 折半，底数变为 x^2
 如果 n 是奇数， 我们将 n 减去 1 ，底数不变，得到的结果再乘上底数 x
 */

func myPow(_ x: Double, _ n: Int) -> Double {
    if n == 0 {
        return 1
    } else if n > 0 && n % 2 == 0 {
        return myPow(x * x , n / 2)
    } else if (n > 0) {
        return myPow(x, n - 1) * x
    } else {
        return 1 / myPow(x, -n)
    }
}
