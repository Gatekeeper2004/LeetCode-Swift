//
//  minWindow.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/5/23.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//滑动窗口
func minWindow(_ s: String, _ t: String) -> String {
    if (s.count == 0 || t.count == 0 || s.count < t.count) {
        return "";
    }
    var origin = [Character : Int]() //记录t各个字母的数量
    var count = [Character : Int]() //记录当前范围内已获得的t中字母的数量
    let s = Array(s)
    let t = Array(t)

    func check() -> Bool {
        for (key, value) in origin {
            if let v = count[key] {
                if v < value {
                    return false
                }
            } else {
                return false
            }
        }
        return true
    }
    
    for char in t {
        let count = origin[char] ?? 0
        origin[char] = count + 1
    }
    var left = 0
    var right = 0
    var start = -1
    var end = -1
    var length = Int.max

    while right < s.count {
        
        let charRight = s[right] // 右边界的那个字符
        if right < s.count && origin.contains(where: { (arg0) -> Bool in
            let (key, _) = arg0
            return charRight == key
        }) {
            let v = count[charRight] ?? 0
            count[charRight] = v + 1
        }
        while check() && left <= right {
            if right - left + 1 < length {
                length = right - left + 1
                start = left
                end = left + length
            }
            if origin.keys.contains(s[left]) {
                if let v = count[s[left]] {
                    count[s[left]] = v - 1
                } else {
                    count[s[left]] = -1
                }
            }
            left += 1
        }
        
        right += 1
    }
    
    
    if start == -1 {
        return ""
    } else {
        let result:Array<Character> = Array(s[start..<end])
        
        return String(result)
    }
 }
