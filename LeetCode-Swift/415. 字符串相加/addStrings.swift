//
//  addStrings.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/2.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func addStrings(_ num1: String, _ num2: String) -> String {
    var carry = 0
    var (i, j) = (num1.count - 1 , num2.count - 1)
    let num1 = num1 as NSString
    let num2 = num2 as NSString
    var result = ""
    while i >= 0 || j >= 0 {
        
        let n1 = i >= 0 ? num1.substring(with: NSMakeRange(i, 1)) : "0"
        let n2 = j >= 0 ? num2.substring(with: NSMakeRange(j, 1)) : "0"
        let temp = Int(n1)! + Int(n2)! + carry
        
        carry = temp/10
        result = String(temp % 10) + result
        i -= 1
        j -= 1
        
    }
    result = (carry == 1) ? "1" + result : result
    return result
}
