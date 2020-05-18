//
//  maxProduct.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/18.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
/*
 1. 遍历数组时计算当前最大值，不断更新
 2. 令imax为当前最大值，则当前最大值为 imax = max(imax * nums[i], nums[i])
 3. 由于存在负数，那么会导致最大的变最小的，最小的变最大的。因此还需要维护当前最小值imin，imin = min(imin * nums[i], nums[i])
 4. 当负数出现时则imax与imin进行交换再进行下一步计算
 */
func maxProduct(_ nums: [Int]) -> Int {
    var maxResult = Int.min
    var iMax = 1
    var iMin = 1
    for num in nums {
        if num < 0 {
            let temp = iMax
            iMax = iMin
            iMin = temp
        }
        iMax = max(iMax * num, num)
        iMin = min(iMin * num, num)
        
        maxResult = max(maxResult, iMax)
    }
    return maxResult
}
