//
//  permuteUnique.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func permuteUnique(_ nums: [Int]) -> [[Int]] {
    let nums = nums.sorted()
    var reslut = Array<[Int]>.init()
    var track = Array<Int>.init()
    var used = Array<Bool>.init(repeating: false, count: nums.count)
    func backtrack() {
        if track.count == nums.count {
            reslut.append(track)
            return
        }
        
        for i in 0..<nums.count {
            if used[i] == true {
                continue
            }
            if i > 0 && nums[i] == nums[i - 1] && used[i - 1] == false {
                continue
            }
            track.append(nums[i])
            used[i] = true
            backtrack()
            used[i] = false
            track.removeLast()
        }
    }
    
    backtrack()
    return reslut
}
