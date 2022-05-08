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
    func recoverTree(_ root: TreeNode?) {
        var leftN: TreeNode?
        var rightN: TreeNode?
        var prev: TreeNode?
        
        func bfs(_ root: TreeNode?) {
            if let node = node {
                bfs(node.left)
                if leftN == nil, let prev = prev, prev.val > node.val {
                    leftN = prev
                }
                if leftN != nil, rightN == nil || node.val < rightN!.val {
                    rightN = node
                }
                prev = node
                bfs(node.right)
            } else {
                return
            }
        }
        
        bfs(root)
        
        if let leftN = leftN, let rightN = rightN {
            let tmp = leftN.val
            leftN.val = rightN.val
            rightN.val = tmp
        }
    }
}
