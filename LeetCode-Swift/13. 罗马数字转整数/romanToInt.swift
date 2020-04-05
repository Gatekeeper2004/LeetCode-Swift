//
//  romanToInt.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/29.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func romanToInt(_ s: String) -> Int {
    if s.count == 0 {
        return 0
    }
    let charArray = Array(s)
    var prenum = getValue(charArray.first!)
    var num = 0
    var sum = 0
    for i in 1..<s.count {
        num = getValue(charArray[i])
        if num > prenum {
            sum -= prenum
        } else {
            sum += prenum
        }
        prenum = num
    }
    sum += prenum
    return sum
}

fileprivate func getValue(_ char: Character) -> Int {
    switch(char) {
    case "I":
        return 1;
    case "V":
        return 5;
    case "X":
        return 10;
    case "L":
        return 50;
    case "C":
        return 100;
    case "D":
        return 500;
    case "M":
        return 1000;
    default: return 0;
    }
}
