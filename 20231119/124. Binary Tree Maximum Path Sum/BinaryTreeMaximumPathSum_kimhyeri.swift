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
    func maxPathSum(_ root: TreeNode?) -> Int {
        var result = Int.min

        func maxWithOneChild(root: TreeNode?) -> Int {
            guard let root = root else { return 0 }
            let maxLeft = max(0, maxWithOneChild(root: root.left))
            let maxRight = max(0, maxWithOneChild(root: root.right))
            result = max(result, maxLeft + root.val + maxRight)
            return max(maxLeft, maxRight) + root.val
        }

        maxWithOneChild(root: root)
        return result
    }
}