//
//  minIncrementForUnique.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/22.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func minIncrementForUnique(_ A: [Int]) -> Int {
    if A.count <= 1 {
        return 0
    }
    func quickSort(_ array:[Int]) -> [Int] {
        guard array.count > 1 else { return array }
        let pivot = (0 + array.count) / 2
        let less = array.filter {$0 < array[pivot]}
        let equal = array.filter{$0 == array[pivot]}
        let great = array.filter {$0 > array[pivot]}
        return quickSort(less) + equal + quickSort(great)
    }
    var sortedA = Array.init(quickSort(A))
    var result = 0
    for i in 1..<sortedA.count {
        if sortedA[i] <= sortedA[i - 1] {
            let pre = sortedA[i]
            sortedA[i] = sortedA[i - 1] + 1
            result += sortedA[i] - pre
        }
    }
    
    return result
}
