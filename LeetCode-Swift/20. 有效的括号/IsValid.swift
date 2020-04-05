//
//  Solution.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/11/28.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

//20. 有效的括号
func isValid(s:String) -> Bool {
    var symbolsStack = Array<String>()
    let leftParentheses = "("
    let rightParentheses = ")"
    let leftBrackets = "["
    let rightBrackets = "]"
    let leftBrace = "{"
    let rightBrace = "}"
    let result = false
    let array = s.map { String($0) }
    for symbol in array {
        if (symbol == leftParentheses || symbol == leftBrackets || symbol == leftBrace) {
            symbolsStack.append(symbol)
        } else {
            if (symbolsStack.isEmpty) {
                return result
            }
            let lastSymbol = symbolsStack.popLast()
            if ((symbol == rightBrackets) && (lastSymbol != leftBrackets)) {
                return result
            } else if ((symbol == rightParentheses) && (lastSymbol != leftParentheses)) {
                return result
            } else if ((symbol == rightBrace) && (lastSymbol != leftBrace)) {
                return result
            }
        }
    }
    
    if (symbolsStack.count == 0) {
        return true
    } else {
        return result
    }
}
