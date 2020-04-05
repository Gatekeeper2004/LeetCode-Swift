//
//  spiralOrder.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/30.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//pop最上面一层,然后逆时针旋转, python的zip更好用
func spiralOrder(_ matrix: [[Int]]) -> [Int] {
    var result = Array<Int>.init()
    var matrix = matrix
    while matrix.count != 0 {
        result.append(contentsOf: matrix.first!)
        matrix.removeFirst()
        if matrix.count == 0 {
            break
        }
        var temp = Array<[Int]>.init(repeating: [], count: matrix.first?.count ?? 0)
        for i in 0..<matrix.first!.count {
            for j in 0..<matrix.count {
                temp[i].append(matrix[j][i])
            }
        }
        matrix = temp.reversed()
    }
    return result
}
