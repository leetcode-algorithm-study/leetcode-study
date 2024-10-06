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
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        func swapLeftRight(root: TreeNode?, left: TreeNode?, right: TreeNode?) {
            guard let root = root else { return }
            root.right = left
            root.left = right
            swapLeftRight(root: root.left, left: root.left?.left, right: root.left?.right)
            swapLeftRight(root: root.right, left: root.right?.left, right: root.right?.right)
        }

        swapLeftRight(root: root, left: root.left, right: root.right)
        return root
    }
}