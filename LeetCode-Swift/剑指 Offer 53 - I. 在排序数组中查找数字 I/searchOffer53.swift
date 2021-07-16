//
//  search.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2021/7/16.
//  Copyright © 2021 yidingw. All rights reserved.
//

import Foundation

func searchOffer53(_ nums: [Int], _ target: Int) -> Int {
    return nums.filter{ $0 == target}.count
}
