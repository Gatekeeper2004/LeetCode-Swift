//
//  MyHashSet.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/1.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//未完 

class HashSetNode {
    var key: Int
    var next: HashSetNode?
    init(_ key:Int) {
        self.key = key
        self.next = nil
    }
}

class MyHashSet {
    let keyRange = 997 //质数
    var buckets: Array<HashSetNode>
    /** Initialize your data structure here. */
    init() {
        self.buckets = Array<HashSetNode>.init(repeating: HashSetNode.init(-1), count: keyRange)
        
    }
    
    func add(_ key: Int) {
        
        var p:HashSetNode? = nil
        p = self.buckets[key%self.keyRange]
        
        while p != nil {
            if p?.next == nil {
                let node = HashSetNode.init(key)
                p?.next = node
                return
            }
            if p?.key == key {
                return
            }
            p = p?.next
        }
    }
    
    func remove(_ key: Int) {
        var p:HashSetNode? = nil
        p = self.buckets[key%self.keyRange]
        while p != nil {
            if p?.next?.key == key {
                p?.next = p?.next?.next
                return
            }
            
            p = p?.next
        }
    }
    
    /** Returns true if this set contains the specified element */
    func contains(_ key: Int) -> Bool {
        var p:HashSetNode? = nil
        p = self.buckets[key%self.keyRange]
        while p != nil {
            if p?.key == key {
                return true
            }
            
            p = p?.next
        }
        return false
    }
}

/**
 * Your MyHashSet object will be instantiated and called as such:
 * let obj = MyHashSet()
 * obj.add(key)
 * obj.remove(key)
 * let ret_3: Bool = obj.contains(key)
 */
