//
//  CombinationSum.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/9.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
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
            track.append(candidates[i])
            helper(candidates, target - candidates[i], i)
            track.removeLast()
        }
    }
    
    helper(candidates, target, 0)
    return result
}

/*
func combinationSum(_ candidates: [Int], _ target: Int) -> [[Int]] {
    let candidatesSorted = candidates.sorted()
    if candidates.count == 0 {
        return result
    }
    var path = [Int]()
    helper(candidates: candidatesSorted, target: target, start: 0, path: &path)
    
    return result
}

fileprivate func helper(candidates: [Int], target: Int, start: Int, path:inout [Int]) -> Void {
    if target < 0 {
        return
    } else if target == 0 {
        result.append(path)
        return
    }
    for i in stride(from: start, to: candidates.count, by: 1) {
        if target < 0 {
            break
        }
        path.append(candidates[i])
        helper(candidates: candidates, target: target - candidates[i], start: i, path: &path)
        path.remove(at: path.count - 1)
    }
}
*/

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
         for (let i = c; i <= target; i++) {
 //            console.log("i =",i, "c =", c, "i - c =", i-c)
             for (const item of dp[i - c]) {
                 console.log("i =",i, "c =", c, "i-c =", i-c)
                 //子项要转化成 String
                 dp[i].add(item + ',' + c)
                 console.log("dp[", i, "] " + "added item:", item + ',' + c)
             }
         }
     }
     //最后把Set 转成 Array
     
     return Array.from(dp[target]).map(item => item.slice(1).split(','))
 //    return Array.from(dp[target])
 };
 */
