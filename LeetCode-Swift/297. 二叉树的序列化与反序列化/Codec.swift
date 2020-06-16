/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init(_ val: Int) {
 *         self.val = val
 *         self.left = nil
 *         self.right = nil
 *     }
 * }
 */

class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var result = ""
        var queue = [TreeNode?]()
        queue.append(root)
        while !queue.isEmpty {
            if let node = queue.removeFirst() {
                result += "\(node.val)"
                queue.append(node.left)
                queue.append(node.right)
            } else {
                result += "n"
            }
            result += ","
        }
        return result
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let tree = Array(data.split(separator: ","))
        if let first = tree.first, first == "n" {
            return nil
        }
        var queue = [TreeNode?]()
        let root = TreeNode.init(Int(String(tree.first!))!)
        
        queue.append(root)
        var index = 1
        while !queue.isEmpty {
            if let current = queue.removeFirst() {
                if tree[index] != "n" {
                    current.left = TreeNode.init(Int(String(tree[index]))!)
                } else {
                    current.left = nil
                }
                if tree[index + 1] != "n" {
                    current.right = TreeNode.init(Int(String(tree[index + 1]))!)
                } else {
                    current.right = nil
                }
                
                queue.append(current.left)
                queue.append(current.right)
            } else {
                continue
            }
            index += 2
        }
        return root
    }
}

// Your Codec object will be instantiated and called as such:
// var codec = Codec()
// codec.deserialize(codec.serialize(root))
