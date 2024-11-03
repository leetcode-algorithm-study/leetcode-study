/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class Solution {
    // DFS
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
    
        func traversal(_ current: TreeNode?, _ depth: Int) {
            guard let node = current else { return }
            if depth < result.count {
                result[depth].append(node.val)
            } else {
                result.insert([node.val], at: depth)
            }
            traversal(current?.left, depth + 1)
            traversal(current?.right, depth + 1)
        }
        
        traversal(root, 0)
        return result
    }
    
    // BFS
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else { return [] }
        
        var result: [[Int]] = []
        var queue: [TreeNode] = [root]
        
        while !queue.isEmpty {
            let levelSize = queue.count
            var currentLevel: [Int] = []
            
            for _ in 0..<levelSize {
                let node = queue.removeFirst()
                currentLevel.append(node.val)
                
                if let left = node.left {
                    queue.append(left)
                }
                if let right = node.right {
                    queue.append(right)
                }
            }
            
            result.append(currentLevel)
        }
        
        return result
    }
}