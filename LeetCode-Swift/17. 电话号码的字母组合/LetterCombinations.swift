//
//  LetterCombinations.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/8.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

func letterCombinations(_ digits: String) -> [String] {
    let letterMap = [
        [" "],    //0
        [""],     //1
        ["a","b","c"],  //2
        ["d","e","f"],  //3
        ["g","h","i"],  //4
        ["j","k","l"],  //5
        ["m","n","o"],  //6
        ["p","q","r","s"], //7
        ["t","u","v"],  //8
        ["w","x","y","z"]  //9
    ]
    var result: Array<String> = []
    if digits.count == 0 {
        return result
    }
    var track = Array<String>.init()
    let digits = Array(digits)
    func backtrack(_ digits: [Character], _ k: Int) {
        if k == digits.count {
            result.append(track.joined())
            return
        }
        let num = Int(String(digits[k]))
        let chars = letterMap[num!]
        for i in 0..<chars.count {
            let char = chars[i]
            track.append(String(char))
            backtrack(digits, k + 1)
            track.removeLast()
        }
    }
    
    backtrack(digits, 0)
    return result
    
}
/*
func letterCombinations(_ digits: String) -> [String] {
    let letterMap = [
        " ",    //0
        "",     //1
        "abc",  //2
        "def",  //3
        "ghi",  //4
        "jkl",  //5
        "mno",  //6
        "pqrs", //7
        "tuv",  //8
        "wxyz"  //9
    ]
    var result: Array<String> = []
    if digits.count == 0 {
        return result
    }
    result.append("")
    for digit in Array(digits) {
        let letter = letterMap[Int(String(digit)) ?? 0]
        for _ in stride(from: 0, to: result.count, by: 1) {
            let tmp = result[0]
            result.remove(at: 0)
            for k in stride(from: 0, to: letter.count, by: 1) {
                result.append(tmp + String(Array(letter)[k]))
            }
        }
    }
    
    return result
}
*/
