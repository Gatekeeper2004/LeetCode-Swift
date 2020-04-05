//
//  multiply.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/2.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//超时
func multiply(_ num1: String, _ num2: String) -> String {
    if num1 == "0" || num2 == "0" {
        return "0"
    }
    var result = Array<Int>.init()
    let num2 = num2 as NSString
    for i in stride(from: num2.length - 1, to:-1 , by: -1) {
        let n2 = i >= 0 ? num2.substring(with: NSMakeRange(i, 1)) : "0"
        
        let temp = Int(num1)! * Int(n2)!
        print(temp)
        if i != num2.length - 1 {
            var a = 1
            for _ in 1..<num2.length - i {
                a = a * 10
            }
            result.append(temp * a)
        } else {
            result.append(temp)
        }
        print(result)
    }

    return String(result.reduce(0, +))
}
