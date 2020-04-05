//
//  Trie.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/1/17.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

class Trie {
    var root = TrieNode("")
    
    /** Initialize your data structure here. */
    init() {
        
    }
    
    /** Inserts a word into the trie. */
    func insert(_ word: String) {
        var root = self.root
        
        for character in word {
            if let value = character.asciiValue {
                let ascii = Int(value - 97)
                
                if root.children[ascii] == nil {
                    root.children[ascii] = TrieNode(String(character))
                }
                root = root.children[ascii]!
            }
        }
        root.isEnd = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var root = self.root
        
        for character in word {
            if let value = character.asciiValue {
                let ascii = Int(value - 97)
                
                guard let node = root.children[ascii] else {
                    return false
                }
                root = node
            }
        }
        
        return root.isEnd
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var root = self.root
        
        for character in prefix {
            if let value = character.asciiValue {
                let ascii = Int(value - 97)
                
                guard let node = root.children[ascii] else {
                    return false
                }
                root = node
            }
        }
        return true
    }
    
    
    
}

class TrieNode {
    init(_ value: String) {
        self.value = value
    }
    
    var value : String
    
    var isEnd = false
    
    var children : [TrieNode?] = Array(repeating: nil, count: 26)
    
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */
