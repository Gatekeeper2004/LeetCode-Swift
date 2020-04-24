//
//  reversePairs.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/24.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//并轨排序
/*
//超时
func reversePairs(_ nums: [Int]) -> Int {
    var result = 0
    
    func merge(left:[Int], right:[Int]) -> [Int] {
        
        var mergedList = [Int]()
        var left = left
        var right = right
        
        while left.count > 0 && right.count > 0 {
            if left.first! > right.first! {
                result += right.count //此处是比归并排序多的一行，即统计跨界的逆序对
                mergedList.append(left.removeFirst())
                
            } else {
                mergedList.append(right.removeFirst())
                
            }
        }
        return mergedList + left + right
    }
     
    func mergeSort(_ list:[Int]) -> [Int] {
        guard list.count > 1 else {
            return list
        }
        
        let leftList = Array(list[0..<list.count/2])
        let rightList = Array(list[list.count/2..<list.count])
        
        return merge(left: mergeSort(leftList), right: mergeSort(rightList))
    }
    
    _ = mergeSort(nums)
    return result
}
*/
func reversePairs(_ nums: [Int]) -> Int {
    
    var count = 0
    func mergeSort(_ nums: [Int]) -> [Int] {
        if nums.count <= 1 {
            return nums
        }
        let mid: Int = Int(nums.count/2)
        
        let left = mergeSort(Array(nums[0..<mid]))
        let right = mergeSort(Array(nums[mid..<nums.count]))
        return merge(left, right)
    }

    func merge(_ left: [Int], _ right: [Int]) -> [Int] {
        var temp = Array<Int>()
        var i = 0
        var j = 0
        while i < left.count || j < right.count {
            if j == right.count || i < left.count && left[i] > right[j] {
                count += right.count - j  //此处是比归并排序多的一行，即统计跨界的逆序对, 如果 左 > 右, 由于右边已经排序过,那么左比右所有的数字都大.所以是right.count - j
                temp.append(left[i])
                i = i + 1
            } else {
                temp.append(right[j])
                j = j + 1
            }
        }
        return temp
    }
    
    _ = mergeSort(nums)
    
    return count
}
