//
//  isRectangleOverlap.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/18.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//我们就得到区间不重叠的条件：e1 <= s2 || e2 <= s1。将条件取反即为区间重叠的条件。
//https://leetcode-cn.com/problems/rectangle-overlap/solution/tu-jie-jiang-ju-xing-zhong-die-wen-ti-zhuan-hua-we/

func isRectangleOverlap(_ rec1: [Int], _ rec2: [Int]) -> Bool {
    let x_orverlap = !(rec1[2] <= rec2[0] || rec2[2] <= rec1[0])
    let y_overlap = !(rec1[3] <= rec2[1] || rec2[3] <= rec1[1])
    return x_orverlap && y_overlap
}
