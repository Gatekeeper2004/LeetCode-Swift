//
//  hammingDistance.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/8.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    let bin = x ^ y
    let binString = String(bin, radix: 2)
    let result = binString.filter{$0 == "1"}
    return result.count
}
