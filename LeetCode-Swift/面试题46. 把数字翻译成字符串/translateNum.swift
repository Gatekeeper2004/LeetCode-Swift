//
//  translateNum.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/27.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//回溯
func translateNum(_ num: Int) -> Int {
    let strNum = String(num) as NSString
    func backtrack(_ start: Int) -> Int {
        if start >= strNum.length {
            return 1
        }
        if start == strNum.length - 1 ||
            strNum.substring(with: NSMakeRange(start, 1)) == "0" ||
            (Int(strNum.substring(with: NSMakeRange(start, 2)))! > 25)
        {
            return backtrack(start + 1)
        }
        return backtrack(start + 1) + backtrack(start + 2)
    }
    
    return backtrack(0)
}
/*
这道题其实就是一个递归：递归出口是num是只有一位数，以xyzcba为例，先取最后两位（个位和十位）即ba，如果ba>=26，必然不能分解成f(xyzcb)+f(xyzc)，此时只能分解成f(xyzcb);但还有一种情况，就是ba<=9,也就是该数十位上为0，此时也不能分解。

作者：xiang-shang-de-gua-niu
链接：https://leetcode-cn.com/problems/ba-shu-zi-fan-yi-cheng-zi-fu-chuan-lcof/solution/di-gui-qiu-jie-shuang-bai-by-xiang-shang-de-gua-ni/
来源：力扣（LeetCode）
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
 */
