//
//  merge.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2021/4/5.
//  Copyright © 2021 yidingw. All rights reserved.
//

import Foundation

func merge88(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var k = m + n - 1
    var m = m
    var n = n
    while n > 0, m > 0 {
        if nums1[m - 1] > nums2[n - 1] {
            nums1[k] = nums1[m - 1]
            m -= 1
        } else {
            nums1[k] = nums2[n - 1]
            n -= 1
        }
        k -= 1
    }
    
    for i in 0..<n {
        nums1[i] = nums2[i]
    }
}
