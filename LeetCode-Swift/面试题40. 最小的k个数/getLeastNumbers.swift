//
//  getLeastNumbers.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/20.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
    func quickSort(_ array:[Int]) -> [Int] {
        guard array.count > 1 else { return array }
        let pivot = (0 + array.count) / 2
        let less = array.filter {$0 < array[pivot]}
        let equal = array.filter{$0 == array[pivot]}
        let great = array.filter {$0 > array[pivot]}
        return quickSort(less) + equal + quickSort(great)
    }
    let result = quickSort(arr)
    return Array(result[0..<k])
}
