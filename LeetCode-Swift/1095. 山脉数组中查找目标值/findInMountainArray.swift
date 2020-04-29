//
//  findInMountainArray.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/29.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//二分搜索
struct MountainArray {
     public func get(_ index: Int) -> Int {
        return 0
    }
     public func length() -> Int {
        return 0
    }
}

func findInMountainArray(_ target: Int, _ mountainArr: MountainArray) -> Int {
    
    func findPeak(_ left: Int, _ right: Int) -> Int {
        var left = left
        var right = right
        while left < right {
            let mid = left + (right - left)/2
            if mountainArr.get(mid) < mountainArr.get(mid + 1) {  // 当前 mid 比右边小，mid 一定不是 peak
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }
    
    func binarySearchLeft(_ left: Int, _ right: Int) -> Int {
        var left = left
        var right = right
        
        while left <= right {
            let mid = left + (right - left)/2
            if mountainArr.get(mid) == target {
                return mid
            } else if target < mountainArr.get(mid) {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }
        
        return -1
    }
    
    func binarySearchRight(_ left: Int, _ right: Int) -> Int {
        var left = left
        var right = right
        
        while left <= right {
            let mid = left + (right - left)/2
            if mountainArr.get(mid) == target {
                return mid
            } else if target < mountainArr.get(mid) {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }
        
        return -1
    }
    
    let length = mountainArr.length()
    let peak = findPeak(0, length - 1)
    let leftResult = binarySearchLeft(0, peak)
    if leftResult != -1 {
        return leftResult
    }
    let rightResult = binarySearchRight(peak + 1, length - 1)
    return rightResult
}
