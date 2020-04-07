//
//  rotate.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/7.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//先水平旋转，再对角线旋转
func rotate(_ matrix: inout [[Int]]) {
    let length = matrix.count
    //水平翻转
    for i in 0..<length/2 {
        for j in 0..<length {
            (matrix[i][j], matrix[length - i - 1][j]) = (matrix[length - i - 1][j], matrix[i][j])
        }
    }
    //主对角线翻转
    for i in 0..<length {
        for j in 0..<i {
            (matrix[i][j], matrix[j][i]) = (matrix[j][i], matrix[i][j])
        }
    }
}
