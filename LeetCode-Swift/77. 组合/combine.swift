//
//  combine.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func combine(_ n: Int, _ k: Int) -> [[Int]] {
    var reslut = Array<[Int]>.init()
    var track = Array<Int>.init()
    
    func backtrack(_ start: Int) {
        if track.count == k {
            reslut.append(track)
            return
        }
        if start > n {
            return
        }
        for i in start...(n - (k - track.count) + 1)  {
            track.append(i)
            backtrack(i + 1)
            track.removeLast()
        }
    }
    
    backtrack(1)
    return reslut
}
