//
//  permute.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/23.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    var reslut = Array<[Int]>.init()
    func backtrack(_ nums: [Int], _ track: inout [Int]) {
        if track.count == nums.count {
            
            reslut.append(Array.init(track))
            return
        }
        
        for i in 0..<nums.count {
            if track.contains(nums[i]) {
                continue
            }
            
            track.append(nums[i])
            backtrack(nums, &track)
            track.removeLast()
        }
        
    }
    
    var track = Array<Int>.init()
    backtrack(nums, &track)
    return reslut
}


