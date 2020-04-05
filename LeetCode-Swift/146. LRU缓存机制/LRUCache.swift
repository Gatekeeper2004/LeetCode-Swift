//
//  LRUCache.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2019/12/19.
//  Copyright © 2019 yidingw. All rights reserved.
//

import Foundation

//* Definition for double-linked list.
public class DListNode {
    public var key: Int
    public var val: Int
    public var next: DListNode?
    public var prev: DListNode?
    
    public init(_ key: Int, _ val: Int) {
        self.key = key
        self.val = val
        self.next = nil
        self.prev = nil
    }
}


class LRUCache {
    var cache: [Int : DListNode] = [:]
    var capacity: Int
    var size:Int = 0
    var dummyHead = DListNode(-1, -1)
    var dummyTail = DListNode(-1, -1)
    
    init(_ capacity: Int) {
        self.capacity = capacity
        self.dummyHead.next = self.dummyTail
        self.dummyTail.prev = self.dummyHead
    }
    
    func get(_ key: Int) -> Int {
        let node = self.cache[key]
        if let cacheNode = node {
            self.moveToHead(node: cacheNode)
            return cacheNode.val
            
        }
        return -1
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = self.cache[key] {
            node.val = value
            self.moveToHead(node: node)
        } else {
            let newNode = DListNode(key, value)
            self.cache[key] = newNode
            self.addNode(node: newNode)
            self.size = self.size + 1
            if self.size > self.capacity {
                let tailKey = self.popTail()
                self.cache.removeValue(forKey: tailKey)
                self.size = self.size - 1
            }
        }
    }
    
    fileprivate func moveToHead(node: DListNode) {
        self.removeNode(node: node)
        self.addNode(node: node)
    }
    
    fileprivate func removeNode(node: DListNode) {
        let prevNode = node.prev
        let nextNode = node.next
        prevNode?.next = nextNode
        nextNode?.prev = prevNode
    }
    
    fileprivate func addNode(node: DListNode) {
        self.dummyHead.next?.prev = node
        node.prev = self.dummyHead
        node.next = self.dummyHead.next
        self.dummyHead.next = node
    }
    
    fileprivate func popTail() -> Int { //return key
        if let last = self.dummyTail.prev {
            self.removeNode(node: last)
            return last.key
        }
        return -1
    }
}
