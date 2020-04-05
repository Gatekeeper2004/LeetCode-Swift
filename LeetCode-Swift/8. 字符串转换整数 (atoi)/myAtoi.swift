//
//  myAtoi.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/30.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func myAtoi(_ str: String) -> Int {
      var str = str
      
      while str.hasPrefix(" ") {
          str.remove(at: str.startIndex)
      }
      
      if str.count == 0 {
          return 0
      }
      
      var sign = 1
      var result = 0
      let zero = Character("0").asciiValue!
      let nine = Character("9").asciiValue!
      
      if str.hasPrefix("-") {
          sign = -1
          str.remove(at: str.startIndex)
      } else if str.hasPrefix("+") {
          sign = 1
          str.remove(at: str.startIndex)
      }
      
      for char in str {
          
          guard let charAsciiValue = char.asciiValue else {
              continue
          }
          
          if charAsciiValue > nine || charAsciiValue < zero {
              break
          }
          
          if (result > Int32.max/10) || (result == Int32.max/10 && (charAsciiValue - zero ) > Int32.max % 10) {
              return Int(Int32.max)
          }
          
          if (result < Int32.min/10) || (result == Int32.min/10 && (charAsciiValue - zero) > -(Int32.min % 10)) {
              return Int(Int32.min)
          }
          
          result = result * 10 + Int((charAsciiValue - zero)) * sign
          
      }
      
      return result
}
