//
//  divingBoard.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/7/8.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func divingBoard(_ shorter: Int, _ longer: Int, _ k: Int) -> [Int] {
    if k == 0 {
        return []
    } else if shorter == longer {
        return [shorter * k]
    } else {
        let lengthMin = shorter * k
        let lengthMax = longer * k
        let distance = longer - shorter
        var result = [Int]()
        for num in stride(from: lengthMin, through: lengthMax, by: distance) {
            result.append(num)
        }
        return result
    }
}
