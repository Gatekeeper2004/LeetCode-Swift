//
//  FindKthLargest.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/1/15.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//排序
func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    func quickSort(_ array:[Int]) -> [Int] {
        guard array.count > 1 else { return array }
        let pivot = (0 + array.count) / 2
        let less = array.filter {$0 < array[pivot]}
        let equal = array.filter{$0 == array[pivot]}
        let great = array.filter {$0 > array[pivot]}
        return quickSort(less) + equal + quickSort(great)
    }
    let result = quickSort(nums)
    return result[nums.count - k]
}
/*
 最小堆-优先队列
 */
