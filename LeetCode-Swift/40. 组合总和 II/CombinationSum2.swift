//
//  CombinationSum2.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/10.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation
//回溯算法
fileprivate var result = [[Int]]()

func combinationSum2(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let candidates = candidates.sorted()
    var result:[[Int]] = []
     var track:[Int] = []
     func helper(_ candidates: [Int], _ target: Int, _ start: Int) {
         if target < 0 {
             return
         }
         if 0 == target {
              result.append(track)
            
         }
         
         for i in start..<candidates.count {
            if target < 0 {
                break
            }
            
            if i > start && candidates[i] == candidates[i - 1] {
                continue
            }
             track.append(candidates[i])
             helper(candidates, target - candidates[i], i + 1)
             track.removeLast()
         }
     }
     
     helper(candidates, target, 0)
     return result
}


//动态规划
/*
 var combinationSum2 = function (candidates, target) {
     var dp = []
     //先排序解决顺序问题 例 （1，2）（2，1）
     candidates.sort((a, b) => a - b)
     for (let i = 0; i <= target; i++) {
         dp[i] = new Set()
     }
     dp[0].add('')
     for (let c of candidates) {
         for (let i = target; i >= c; i--) {
             console.log(i, c)
             for (item of dp[i - c]) {
                 console.log("i =",i, "c =", c, "i-c =", i-c)
                 //使用Set去重, 子项要转化成 String
                 dp[i].add(item + ',' + c)
                 console.log("dp[", i, "] " + "added item:", item + ',' + c)
             }
         }
     }
     //最后把Set 转成 Array
     console.log(dp)
     return Array.from(dp[target]).map(item => item.slice(1).split(','))
 };
 */

