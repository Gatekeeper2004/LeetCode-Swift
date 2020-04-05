//
//  surfaceArea.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/25.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
/*
 假设一共有n 个立方体，每个立方体都有六个面，那么总的表面积应该是6n。但是这些正方体堆叠在了一起，需要减掉一些因为堆叠而露不出来的表面积。每一对相邻的立方体接触在一起，都会让表面积减少 2.假设一共有e对相接触的立方体，即有e个接触面，表面积就会减少2e。那么，最终的表面积就应该是6n−2e
那么如何计算立方体的接触面呢？很简单，我们还是把每个单元格上堆叠的 v 个立方体看成一个柱子。立方体的接触面可以分为柱子内部和柱子之间的接触面：
v 个立方体的柱子内部，有 v - 1 个接触面
高度分别为 v、w 的两个立方体之间的接触面为 min(v, w)

链接：https://leetcode-cn.com/problems/surface-area-of-3d-shapes/solution/liang-chong-si-lu-zuo-jia-fa-yu-zuo-jian-fa-by-net/
*/
func surfaceArea(_ grid: [[Int]]) -> Int {
    let N = grid.count
    var cubes = 0
    var faces = 0
    for i in 0..<N {
        for j in 0..<N {
            cubes += grid[i][j]
            
            if grid[i][j] > 0 {
                // 叠起来的 v 个立方体有 v-1 个接触面
                faces += grid[i][j] - 1
            }
            if i > 0 {
                // 当前柱子与上边柱子的接触面数量
                faces += min(grid[i - 1][j], grid[i][j])
            }
            if j > 0 {
                 // 当前柱子与左边柱子的接触面数量
                faces += min(grid[i][j - 1], grid[i][j])
            }
        }
    }
    return 6 * cubes - 2 * faces
}
