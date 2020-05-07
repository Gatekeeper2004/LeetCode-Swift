//
//  subarraySum.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/22.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
/*
 前缀和优化
 建立map表用于存储每个连续子数组sum求和出现的次数，初始化为（0,1），表示和为0的连续子数组出现1次。
 sum的值是在对nums数组的循环中不断累加当前元素的，result的值则需要查找map中是否已存在sum-k的元素，也就是在查找此前所有从0项开始累加的连续子项和中有没有sum-k。
 如果有的话，则说明从该项到当前项的连续子数组和必定为k，那么res则可以和这个sum的对应值，即这个sum出现的次数，相加得到新的result。
 对于当前sum如果已存在与map中则其对应值+1，不存在则添加新项，初始值为1。
 */
func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var count = 0
    var sum = 0
    var map = [Int: Int]() //前缀和 -> 该前缀和出现的次数
    map[0] = 1
    for i in 0..<nums.count {
        sum += nums[i]
        if map.keys.contains(sum - k) {
            count += map[sum - k] ?? 1
        }
        
        map[sum] = (map[sum] ?? 0) + 1
    }
    
    return count
}
