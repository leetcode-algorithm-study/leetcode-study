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
    func maxDepth(_ root: TreeNode?) -> Int {
        var answer = 0

        func traversalDepth(_ root: TreeNode?, index: Int) {
            guard let root = root else { return }
            answer = max(answer, index)
            traversalDepth(root.left, index: index + 1)
            traversalDepth(root.right, index: index + 1)
        }

        traversalDepth(root, index: 1)
        return answer
    }
}