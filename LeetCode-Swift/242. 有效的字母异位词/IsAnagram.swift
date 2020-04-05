//
//  IsAnagram.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/16.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func isAnagram(_ s: String, _ t: String) -> Bool {
    var result = false
    if s.lengthOfBytes(using: .utf8) != t.lengthOfBytes(using: .utf8) {
        return result
    }
    var tempDic: [String:Int] = [:]
    
    for sword in s  {
        let value = String(sword)
        tempDic[value] = (tempDic[value] ?? 0) + 1
    }
    for tword in t {
        let value = String(tword)
        tempDic[value] = (tempDic[value] ?? 0) - 1
    }
    
    result = true
    print(tempDic.values)
    for value in Array(tempDic.values) {
        if value != 0 {
            result = false
            return result
        }
    }
    
    return result
}
