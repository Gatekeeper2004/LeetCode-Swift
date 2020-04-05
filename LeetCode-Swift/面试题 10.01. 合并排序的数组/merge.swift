//
//  merge.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/3.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func merge(_ A: inout [Int], _ m: Int, _ B: [Int], _ n: Int) {
    var result:[Int] = []
    var pa = 0, pb = 0
    while pa < m || pb < n {
         if pa == m {
            result.append(B[pb])
            pb = pb + 1
        } else if pb == n {
            result.append(A[pa])
            pa = pa + 1
        } else if A[pa] < B[pb] {
            result.append(A[pa])
            pa = pa + 1
        } else {
            result.append(B[pb])
            pb = pb + 1
        }
    }
    A = result
}
