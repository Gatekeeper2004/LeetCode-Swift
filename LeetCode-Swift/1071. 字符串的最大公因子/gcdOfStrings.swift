//
//  gcdOfStrings.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/12.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

fileprivate func gcd(_ a: Int, _ b: Int) -> Int {
    return (0 == b ? a : gcd(b, a % b))
}

func gcdOfStrings(_ str1: String, _ str2: String) -> String {
    // 假设str1是N个x，str2是M个x，那么str1+str2肯定是等于str2+str1的。
    if !((str1 + str2) == (str2 + str1)) {
        return "";
    }
    // 辗转相除法求gcd。
    let nsStr1 = str1 as NSString
    return nsStr1.substring(with: NSMakeRange(0, gcd(str1.count, str2.count)))
}
