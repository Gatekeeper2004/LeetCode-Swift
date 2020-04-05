//
//  convert.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/30.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func convert(_ s: String, _ numRows: Int) -> String {
    var result = Array<[Character]>.init(repeating: [], count: numRows == 1 ? s.count : numRows)
    
    var flag = -1
    var index = 0
    for char in s {
        result[index].append(char)
        if (index == 0) || index == numRows - 1 {
            flag = -flag
        }
        index = index + flag
    }

    return String(result.compactMap{$0}.joined())
}
