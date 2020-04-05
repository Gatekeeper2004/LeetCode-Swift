//
//  subsets.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/23.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//回溯
func subsets(_ nums: [Int]) -> [[Int]] {
    var reslut = Array<[Int]>.init()
    func backtrack(_ nums: [Int], _ track: inout [Int], _ k: Int) {
        reslut.append(Array.init(track))
        for i in k..<nums.count {
            track.append(nums[i])
            backtrack(nums, &track, i + 1)
            track.removeLast()
        }
    }
    var track = Array<Int>.init()
    backtrack(nums, &track, 0)
    return reslut
}

/*
 解题思路

 思路简单，用二进制序列来表示最终结果，取1时保存当前位。二进制序列位数不够时，前面加0。
 000 []
 001 [3]
 010 [2]
 011 [2, 3]
 100 [1]
 101 [1, 3]
 110 [1, 2]
 111 [1, 2, 3]

 */
