//
//  findBestValue.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/6/14.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func findBestValue(_ arr: [Int], _ target: Int) -> Int {
    let arr = arr.sorted()
    var result = -1
    var sum = 0
    var rest = arr.count + 1
    for i in 0..<arr.count {
        rest -= 1
        let r = (target - sum)/rest // 剩余后面的都变成多少比较接近
        if (r <= arr[i]) {  // 比当前元素小（保证 r > arr[i - 1]，否则上一轮已 break）
            result = r // 当前及以后都改为 r
            break; // 找到就跳出
        }
        sum += arr[i]
    }
    // 都找不到，说明希望 value 比 arr[n - 1] 还要大，则返回最大即可
    if result == -1 {
        return arr[arr.count - 1]
    }
    // 当前得出的 res 只保证了总和小于 target 的最近
    // 试一试 res + 1 会不会更近
    let dis = target - sum - result * rest
    if abs(target - sum - (result + 1) * rest) < dis {
        return result + 1
    }
    return result
}
