//
//  binaryTreePaths.swift
//  LeetCode-Swift
//
//  Created by 王一丁 on 2020/4/15.
//  Copyright © 2020 yidingw. All rights reserved.
//

import Foundation
//回溯
func binaryTreePaths(_ root: TreeNode?) -> [String] {
  var result = [String]()
  var paths = [String]()

  func backtrack(_ node: TreeNode?) {
    guard let _ = node else {
      return
    }

    paths.append(String(node!.val))
    if node?.left == nil && node?.right == nil {
      result.append(paths.joined(separator: "->"))
      return
    }

    if let _ = node?.left {
      backtrack(node?.left)
      paths.removeLast()
    }

    if let _ = node?.right {
      backtrack(node?.right)
      paths.removeLast()
    }

  }
  backtrack(root)

  return result
}
