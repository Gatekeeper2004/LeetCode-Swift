//
//  superEggDrop.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/11.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
/*
 dp[k][m] 的含义是k个鸡蛋 移动m次最多能够确定多少楼层
 这个角度思考
 dp[k][m] 最多能够确定的楼层数为L
 那么我选定第一个扔的楼层之后，我要么碎，要么不碎
 这就是把L分成3段
 左边是碎的那段 长度是dp[k][m - 1]
 右边是没碎的那段 长度是dp[k-1][m - 1] 因为已经碎了一个了
 中间是我选定扔的楼层 是1
 所以递推公式是
 dp[k][m] = dp[k - 1][m - 1] + dp[k][m - 1] + 1
 */
func superEggDrop(_ K: Int, _ N: Int) -> Int {
    var dp = [[Int]].init(repeating: [Int].init(repeating: 0, count: N + 1), count: K + 1)
    for m in 1...N {
        dp[0][m] = 0 //zero egg
        for k in 1...K {
            dp[k][m] = dp[k][m - 1] + dp[k - 1][m - 1] + 1
            if dp[k][m] >= N {
                return m
            }
        }
    }
    return N
}
//根据递推公式 如果采用k倒着从大到小计算 就可以只存一行的dp[k] 直接原地更新dp[k] 不影响后续计算 只需要O(K)空间复杂度 O(KlogN) 鸡蛋完全够用的时候 就是走LogN步 最差情况是1个鸡蛋走N步 O(KN)
/*
 def superEggDrop(K: int, N: int) -> int:
 dp = [0] * (K + 1)
 m = 0
 while dp[K] < N:
     m += 1
     for k in range(K, 0, -1):
         # print(m, k)
         dp[k] = dp[k - 1] + dp[k] + 1
 return m
 */
