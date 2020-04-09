//
//  cuttingRope.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/10.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//备忘录法
func cuttingRope(_ n: Int) -> Int {
    var track = [Int].init(repeating: 0, count: n + 1)
    
    func memoize(_ n: Int) -> Int {
        if n == 2 {
            return 1
        }
        
        if track[n] != 0 { //如果f[n]已经计算过，直接返回避免重复计算
            return track[n]
        }
        
        var res = -1
        for i in 1..<n {
            res = max(res, max(i * (n - i), i * memoize(n - i)))  //F(n) = max(i * (n - i), i * F(n - i)) i = 1,2,3 ...
        }
        track[n] = res
        return res
    }
    return memoize(n)
}
