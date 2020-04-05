//
//  subsetsWithDup.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    var reslut = Array<[Int]>.init()
    func backtrack(_ nums: [Int], _ track: inout [Int], _ k: Int) {
        reslut.append(Array.init(track))
        for i in k..<nums.count {
            if i > k && nums[i] == nums[i - 1] {
                continue
            }
            track.append(nums[i])
            backtrack(nums, &track, i + 1)
            track.removeLast()
        }
    }
    var track = Array<Int>.init()
    backtrack(nums, &track, 0)
    return reslut
}
