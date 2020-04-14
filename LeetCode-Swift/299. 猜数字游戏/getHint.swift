//
//  getHint.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/14.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func getHint(_ secret: String, _ guess: String) -> String {
    func count(_ string: String) -> Dictionary<Character, Int> {
        var result = [Character : Int]()
        for char in string {
            if let _ = result[char] {
                result[char]! += 1
            } else {
                result[char] = 1
            }
        }
        return result
    }
    
    var secretCounter = count(secret)
    var guessCounter = count(guess)
    
    var result = (0, 0)
    
    for (x, y) in zip(secret, guess) {
        if x == y {
            secretCounter[x]! -= 1
            guessCounter[y]! -= 1
            result.0 += 1
        }
    }
    let secretCountSet = Set<Character>.init(secretCounter.keys)
    let guessCountSet = Set<Character>.init(guessCounter.keys)
    
    for k in secretCountSet.union(guessCountSet) {
        if let _ = secretCounter[k], let _ = guessCounter[k] {
            result.1 += min(secretCounter[k]!, guessCounter[k]!)
        }
    }
        
    return "\(result.0)A\(result.1)B"
}
