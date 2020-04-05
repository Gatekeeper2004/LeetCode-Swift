//
//  canThreePartsEqualSum.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/11.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func canThreePartsEqualSum(_ A: [Int]) -> Bool {
    let sum = A.reduce(0, +)
    guard sum % 3 == 0  else {
        
        return false
    }
    
    var left = 0
    var right = A.count - 1
    var leftSum = A[left]
    var rightSum = A[right]
    
    while left + 1 < right {
        if leftSum == sum/3 && rightSum == sum/3 {
            return true
        }
        if leftSum != sum/3 {
            left += 1
            leftSum = leftSum + A[left]
        }
        
        if rightSum != sum/3 {
            right -= 1
            rightSum = rightSum + A[right]
        }
    }
    return false
}
