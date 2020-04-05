//
//  FindRedundantConnection.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/2/22.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    
    let uf = UF.init(edges.count + 1)
    for edge in edges {
        if !uf.connected(edge[0], edge[1]) {
            uf.union(edge[0], edge[1])
        } else {
            return edge
        }
    }
    return []
}

private class UF {
    private(set) var count: Int
    private var parent: Array<Int>
    private var size: Array<Int>
    
    public init(_ n: Int) {
        self.count = n
        self.parent = Array.init(repeating: 0, count: n)
        self.size = Array.init(repeating: 0, count: n)
        
        for index in 0..<n {
            parent[index] = index
            size[index] = 1
        }
    }
    
    public func union(_ p: Int, _ q: Int) -> Void {
        let rootP = find(p)
        let rootQ = find(q)
        if rootP == rootQ {
            return;
        }
        // 小树接到大树下面，较平衡
        if size[rootP] > size[rootQ] {
            parent[rootQ] = rootP
            size[rootP] += size[rootQ]
        } else {
            parent[rootP] = rootQ
            size[rootQ] += size[rootP]
        }
        self.count = self.count - 1;
    }
    
    public func connected(_ p: Int, _ q: Int) -> Bool {
        let rootP = find(p);
        let rootQ = find(q);
        return rootP == rootQ;
    }
    
    private func find(_ x: Int) -> Int {
        var result = x
        while (self.parent[result] != result) {
                // 进行路径压缩
            self.parent[result] = parent[parent[result]];
            result = parent[result];
        }
        return result;
    }

}
