//
//  DailyTemperatures.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/1/12.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//单调栈 https://www.cnblogs.com/grandyang/p/8887985.html
/*
 单调递增栈可以找到左起第一个比当前数字小的元素。比如数组 [2 1 4 6 5]，刚开始2入栈，数字1入栈的时候，发现栈顶元素2比较大，将2移出栈，此时1入栈。那么2和1都没左起比自身小的数字。然后数字4入栈的时候，栈顶元素1小于4，于是1就是4左起第一个小的数字。此时栈里有1和4，然后数字6入栈的时候，栈顶元素4小于6，于是4就是6左起第一个小的数字。此时栈里有1，4，6，然后数字5入栈的时候，栈顶元素6大于5，将6移除，此时新的栈顶元素4小于5，那么4就是5左起的第一个小的数字，最终栈内数字为 1，4，5。

 单调递减栈可以找到左起第一个比当前数字大的元素
 */

func dailyTemperatures(_ T: [Int]) -> [Int] {
    var result = Array.init(repeating: 0, count: T.count)
    var stack = [Int]()
    for i in 0..<T.count {
        while (!stack.isEmpty && T[i] > (T[stack.last ?? 0])) {
            if let last = stack.last {
                result[last] = i - last
                stack.removeLast()
            }
        }
        stack.append(i)
    }
    return result
}
