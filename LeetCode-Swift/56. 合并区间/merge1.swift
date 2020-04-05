//
//  merge1.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/30.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

private func merge(_ intervals: [[Int]]) -> [[Int]] {
    let intervals = intervals.sorted{ return $0.first! <= $1.first! }
    var merged = Array<[Int]>()
    for interval in intervals {
        if merged.isEmpty || merged.last!.last! < interval.first! {
            merged.append(interval)
        } else {
            var last = merged.popLast()!
            last[1] = max(last.last!, interval.last!)
            merged.append(last)
        }
    }
    return merged
}
