//
//  singleNumbers.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/28.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

// https://leetcode-cn.com/problems/shu-zu-zhong-shu-zi-chu-xian-de-ci-shu-lcof/solution/zhi-chu-xian-yi-ci-de-shu-xi-lie-wei-yun-suan-by-a/

func singleNumbers(_ nums: [Int]) -> [Int] {
    var result = 0 // 所有数字异或的结果
    for i in nums {
        result = result ^ i
    }
    var h = 1 //找到第一位不是0的
    while h & result == 0 {
        h = h << 1
    }
    
    var a = 0
    var b = 0
    for i in nums {
        //根据该位是否为0将其分为两组
        if h & i == 0 {
            a = a ^ i
        } else {
            b = b ^ i
        }
    }
    
    return [a, b]
}
