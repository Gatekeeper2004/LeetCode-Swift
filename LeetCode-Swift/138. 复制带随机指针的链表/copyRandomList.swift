//
//  copyRandomList.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/3/29.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

// Definition for a Node.
fileprivate class Node {
     public var val: Int
     public var next: Node?
     public var random: Node?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
         self.random = nil
     }
}

//DFS没调通, swift class默认不能hash, 需要implement hashable protocol
fileprivate func copyRandomList(_ head: Node?) -> Node? {
    guard let _ = head else {
        return nil
    }
    //第一遍遍历，把每个新生成的结点放在对应的旧结点后面
    var p = head
    while p != nil {
        let newNode = Node.init(p!.val)
        newNode.next = p?.next
        p?.next = newNode
        p = newNode.next

    }
    // 置随机指针
    p = head
    while p != nil {
        if p?.random != nil {
            p?.next?.random = p?.random?.next
        }
        p = p?.next?.next
    }
    //拆分
    p = head
    
    let resultNode = head?.next
    var ptrOld = resultNode  // A->B->C
    while ptrOld != nil {
        p?.next = p?.next?.next
        p = p?.next
        if ptrOld?.next != nil {
            ptrOld?.next = ptrOld?.next?.next
        } else {
            ptrOld?.next = nil
        }
        ptrOld = ptrOld?.next
    }
    p?.next = nil
    return resultNode
}


