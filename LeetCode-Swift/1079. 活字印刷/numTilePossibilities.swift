//
//  numTilePossibilities.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/28.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

//func numTilePossibilities(_ tiles: String) -> Int {
//    let tiles = Array(tiles)
//    var reslut = Array<[Character]>.init()
//    var track = Array<Character>.init()
//    var used = Array<Bool>.init(repeating: false, count: tiles.count)
//    func backtrack(_ start: Int) {
//        if track.count > 0 {
//            reslut.append(track)
//        }
//        for i in start..<tiles.count {
//            if used[i] == true {
//                continue
//            }
//            
//            track.append(tiles[i])
//            used[i] = true
//            backtrack(start + 1)
//            track.removeLast()
//            used[i] = false
//        }
//    }
//    
//    backtrack(0)
//    print(reslut)
//    return reslut.count
//}
