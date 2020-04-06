//
//  palindromePairs.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/6.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func palindromePairs(_ words: [String]) -> [[Int]] {
    var dic = [String: Int]()
    for (i, v) in words.enumerated() {
        dic[v] = i
    }
    
    var result = [[Int]]()
    for i in 0..<words.count {
        let word = words[i]
        //整个字符串查找回文
        if let index = dic[String(word.reversed())], index != i {
            result.append([index, i])
        }
        //子字符串查找，从前向后截取
        let chars = Array(word)
        let nsWord = word as NSString
        for j in 0..<chars.count {
            if (check(chars, 0, j)) { //前(0...j)是回文,所以找后面的字符串,reversed以后从dic里看看有没有
                let sub = String(nsWord.substring(from: j + 1).reversed())
                if let index = dic[sub], index != i {
                    result.append([index, i])
                }
            }
        }
        //子字符串查找，从后向前截取
        for j in stride(from: chars.count - 1, through: 0, by: -1) {
            if (check(chars, j, chars.count - 1)) { //同理，找的是前面的
                
                let sub = String(nsWord.substring(to: j).reversed())
                if let index = dic[sub], index != i {
                    result.append([i, index])
                }
            }
        }
    }
    
    return result
}
//检查是否是回文
fileprivate func check(_ chars: [Character], _ left: Int, _ right: Int) -> Bool {
    var left = left
    var right = right
    while left < right {
        if chars[left] != chars[right] {
          return false
        }
        left += 1
        right -= 1
    }
    return true
}

