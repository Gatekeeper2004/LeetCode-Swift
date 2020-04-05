//
//  Divide.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/9.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func divide(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == 0 {
        return 0
    }
    if (dividend == Int32.min && divisor == -1) {
        return Int(Int32.max)  //返回32位最大值
    }
    return divideBitwise(dividend, divisor)
}

//加
public func addBitwise(_ a: Int, _ b: Int) -> Int {
    if b == 0 {
        return a
    }
    
    let sum = a ^ b
    let carry = (a & b) << 1
    return addBitwise(sum,carry)
}

fileprivate func negative(_ a: Int) -> Int { //取补码
    return addBitwise(~a,1)
}
//减法
public func subBitwise(_ a: Int, _ b: Int) -> Int {
    return addBitwise(a, negative(b))
}

fileprivate func getSign(_ n: Int) -> Int {
    if (n >> 31) == 0 {
        return 1 //正
    } else {
        return 0 //负
    }
}

fileprivate func postitive(_ n: Int) -> Int {
    if (n >> 31) == 0 {
        return n
    } else {
        return negative(n)
    }
}

public func multiBitwise(_ a: Int, _ b: Int) -> Int {
    let beNegative = (getSign(a) ^ getSign(b)) == 0 ? false : true
    var x = postitive(a)
    var y = postitive(b)
    
    var result = 0
    while (y != 0) {
        if (y & 1) == 1 { //最后一位是否为1
            result = addBitwise(result, x)
        }
        x = x << 1
        y = y >> 1
    }
    
    return beNegative ? negative(result) : result
}

public func divideBitwise(_ dividend: Int, _ divisor: Int) -> Int {
    if dividend == 0 {
        return 0
    }
    if (dividend == Int32.min && divisor == -1) {
        return Int(Int32.max)
    }
    let beNegative = (getSign(dividend) ^ getSign(divisor)) == 0 ? false : true
    var x = postitive(dividend)
    let y = postitive(divisor)
    
    var result = 0
    var i = 31
    while i >= 0 {
        if ((x >> i) >= y) {
            result = addBitwise(result, 1 << i)
            x = subBitwise(x, y << i)
        }
        
        i = subBitwise(i, 1)
    }
    if result < 0 && !beNegative {
        return Int.max
    }
    return beNegative ? negative(result) : result
}
