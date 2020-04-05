//
//  CountSmaller.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/2.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//并归排序

func countSmaller(_ nums: [Int]) -> [Int] {
    var tempArray = Array<(Int, Int)>()
    var result = Array<Int>.init(repeating: 0, count: nums.count)
    for (index, value) in nums.enumerated() {
        tempArray.append((index, value))
    }
    
    func mergeSort(_ nums: [(Int,Int)]) -> [(Int,Int)] {
        if nums.count <= 1 {
            return nums
        }
        let mid: Int = Int(nums.count/2)
        
        let left = mergeSort(Array(nums[0..<mid]))
        let right = mergeSort(Array(nums[mid..<nums.count]))
        return merge(left, right)
    }

    func merge(_ left: [(Int, Int)], _ right: [(Int, Int)]) -> [(Int, Int)] {
        var temp = Array<(Int, Int)>()
        var i = 0
        var j = 0
        while i < left.count || j < right.count {
            if j == right.count || i < left.count && left[i].1 <= right[j].1 {
                temp.append(left[i])
                result[left[i].0] = result[left[i].0] + j
                i = i + 1
            } else {
                temp.append(right[j])
                j = j + 1
            }
        }
        return temp
    }
    
    _ = mergeSort(tempArray)
    
    return result
}

//二叉搜索树
//线段树


