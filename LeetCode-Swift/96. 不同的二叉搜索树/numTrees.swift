//
//  numTrees.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/25.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//动态规划
/*
 假设n个节点存在二叉排序树的个数是G(n)，1为根节点，2为根节点，...，n为根节点，当1为根节点时，其左子树节点个数为0，右子树节点个数为n-1，同理当2为根节点时，其左子树节点个数为1，右子树节点为n-2，所以可得G(n) = G(0)*G(n-1)+G(1)*(n-2)+...+G(n-1)*G(0)
 */
func numTrees(_ n: Int) -> Int {
    var dp = [Int].init(repeating: 0, count: n + 1)
    dp[0] = 1
    if n <= 1 {
        return 1
    }
    dp[1] = 1
    //令G(n)表示n个节点二叉排序树的个数，f(i)表示以i作为根节点的二叉排序树的个数
    ///因此有：G(n) = f(1)+f(2)+f(3)+...+f(n)
    //以i为根节点的左子树有i-1个节点，因此右子树有G(i-1)种二叉排序树
    //右子树有n-i个节点，因此右子树有G(n-i)种二叉排序树
    //从而得到：f(i) = G(i-1)*G(n-i)
    //最后得到G(n) = G(0)*G(n-1)+G(1)G(n-2)+G(2)G(n-3)+...+G(n-1)G(0)
    for i in 2...n {
        for j in 1...i {
            dp[i] += dp[j - 1] * dp[i - j]
        }
    }
    return dp[n]
}
