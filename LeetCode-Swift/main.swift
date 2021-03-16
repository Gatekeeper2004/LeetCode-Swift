//
//  main.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/11/28.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation


func main() -> Void {
//    print(divingBoard(2, 4, 4))
    
}

func bubbleSort(array: [Int]) -> [Int] {
    var array = array
    var n = array.count
    while (n > 0) {
            var lastModifiedIndex = 0
            for currentIndex in 1..<n {
                // if the item at the previous index is greater than the item at the `currentIndex`, swap them
                if array[currentIndex - 1] > array[currentIndex] {
                    // swap
                    let temp = array[currentIndex - 1]
                    array[currentIndex - 1] = array[currentIndex]
                    array[currentIndex] = temp
                    // save the index that was modified
                    lastModifiedIndex = currentIndex
                }
            }
            // save the last modified index so we know not to iterate past it since all proceeding values are sorted
            n = lastModifiedIndex
        }
    return array
}

main()

