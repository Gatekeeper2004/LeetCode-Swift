//
//  LongestPalindrome.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/25.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

private func longestPalindrome(_ s: String) -> String {
    if s.count < 2 {
        return s
    }
    let arrayString = Array(s)
    var maxLength = 0
    var result = arrayString[0..<2].map{String($0)}.joined()
    
    for i in 0 ..< s.count {
        let oddString = centerSpread(s: arrayString, start: i, end: i)
        let evenString = centerSpread(s: arrayString, start: i, end: i + 1)
        let maxLengthString = oddString.count > evenString.count ? oddString : evenString
        
        if maxLength < maxLengthString.count {
            maxLength = maxLengthString.count
            result = maxLengthString
        }
    }
    return result
}

fileprivate func centerSpread(s: Array<Character>, start: Int, end: Int) -> String {
    let length = s.count
    var i = start
    var j = end
    let arrayString = s
    while (i >= 0) && (j < length) {
        if arrayString[i] == arrayString[j] {
            i = i - 1
            j = j + 1
        } else {
            break
        }
    }
    return arrayString[i+1 ..< j].map{String($0)}.joined()
}


