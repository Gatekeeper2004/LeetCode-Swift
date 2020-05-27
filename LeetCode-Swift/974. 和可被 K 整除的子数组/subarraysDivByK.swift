//
//  subarraysDivByK.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//前缀和

func subarraysDivByK(_ A: [Int], _ K: Int) -> Int {
    var sum = 0
    var result = 0
    var map = [Int:Int]()
    map[0] = 1
    for n in A {
        sum = (n + sum) % K
        if (sum < 0) {
            sum += K  //处理sum为负数的情况，需要加 K
        }
        let preCount = map[sum] ?? 0
        result += preCount
        map[sum] = preCount + 1
    }
    return result
}
