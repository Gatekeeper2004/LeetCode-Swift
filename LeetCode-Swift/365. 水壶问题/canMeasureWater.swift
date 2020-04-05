//
//  canMeasureWater.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/21.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
/*
 数学方法 ： https://baike.baidu.com/item/裴蜀定理/5186593?fromtitle=贝祖定理&fromid=5185441
 贝祖定理告诉我们，ax + by = z ax+by=z 有解当且仅当 z 是x,y的最大公约数的倍数。因此我们只需要找到x,y 的最大公约数并判断z 是否是它的倍数即可。
 */

func canMeasureWater(_ x: Int, _ y: Int, _ z: Int) -> Bool {
    if x + y < z {
        return false
    }
    if x == 0 || y == 0 {
        return z == 0 ? true : x + y == z
    }
    return z % gcd(x, y) == 0
}

private func gcd(_ a: Int, _ b: Int) -> Int {
  let r = a % b
  if r != 0 {
    return gcd(b, r)
  } else {
    return b
  }
}

//深度优先搜索
/*
 class Solution:
 def canMeasureWater(self, x: int, y: int, z: int) -> bool:
     stack = [(0, 0)]
     self.seen = set()
     while stack:
         remain_x, remain_y = stack.pop()
         if remain_x == z or remain_y == z or remain_x + remain_y == z:
             return True
         if (remain_x, remain_y) in self.seen:
             continue
         self.seen.add((remain_x, remain_y))
         # 把 X 壶灌满。
         stack.append((x, remain_y))
         # 把 Y 壶灌满。
         stack.append((remain_x, y))
         # 把 X 壶倒空。
         stack.append((0, remain_y))
         # 把 Y 壶倒空。
         stack.append((remain_x, 0))
         # 把 X 壶的水灌进 Y 壶，直至灌满或倒空。
         stack.append((remain_x - min(remain_x, y - remain_y), remain_y + min(remain_x, y - remain_y)))
         # 把 Y 壶的水灌进 X 壶，直至灌满或倒空。
         stack.append((remain_x + min(remain_y, x - remain_x), remain_y - min(remain_y, x - remain_x)))
     return False
 */
