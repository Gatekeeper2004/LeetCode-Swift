//
//  removeDuplicateLetters.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/31.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func removeDuplicateLetters(_ s: String) -> String {
    if (s.count < 2) {
        return s
    }
    var lastAppear = Dictionary<Character,Int>.init()
    for (index, char) in s.enumerated() {
        lastAppear[char] = index
    }
    var seen = Set<Character>.init()
    var stack = Array<String>.init()
    for (index,char) in s.enumerated() {
        let string = String(char)
        if !seen.contains(char) {
            while !stack.isEmpty && (char < Character(stack.last!) && lastAppear[Character(stack.last!)]! > index) {
                seen.remove(Character(stack.last!))
                stack.removeLast()
            }
            seen.insert(char)
            stack.append(string)
        }
    }
    
    return stack.joined()
}
