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
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        var result = [[Int]]()
    
        func dfs(_ current: TreeNode?, _ level: Int) {
            guard let node = current else { return }
            if level < result.count {
                result[level].append(node.val)
            } else {
                result.insert([node.val], at: level)
            }
            dfs(current?.left, level + 1)
            dfs(current?.right, level + 1)
        }
        
        dfs(root, 0)
        return result
    }
}