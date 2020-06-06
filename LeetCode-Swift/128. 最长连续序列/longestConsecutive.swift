//
//  longestConsecutive.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/6/6.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

/*
 1.用哈希表存储每个端点值对应连续区间的长度
 2.若数已在哈希表中：跳过不做处理
 3.若是新数加入：
    取出其左右相邻数已有的连续区间长度 left 和 right
    计算当前数的区间长度为：cur_length = left + right + 1
    根据 cur_length 更新最大长度 max_length 的值
    更新区间两端点的长度值
 */

func longestConsecutive(_ nums: [Int]) -> Int {
    var hashMap = [Int: Int]()
    var maxLength = 0;
    for num in nums {
        if !hashMap.contains(where: { (arg0) -> Bool in
            let (key, _) = arg0
            return (key == num)
        }) {
            let left = hashMap[num - 1] ?? 0
            let right = hashMap[num + 1] ?? 0
            
            let currentLength = 1 + left + right
            if currentLength > maxLength {
                maxLength = currentLength
            }
            hashMap[num] = currentLength
            hashMap[num - left] = currentLength
            hashMap[num + right] = currentLength
        }
    }
    return maxLength
}
