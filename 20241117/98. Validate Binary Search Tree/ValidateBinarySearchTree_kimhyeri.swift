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
    func isValidBST(_ root: TreeNode?) -> Bool {
        func isValidBSTHelper(_ root: TreeNode?, min: Int? = nil, max: Int? = nil) -> Bool {
            guard let root = root else { return true }
            if let min = min, root.val <= min {
                return false
            }
            if let max = max, root.val >= max {
                return false
            }

            return isValidBSTHelper(root.left, min: min, max: root.val) && isValidBSTHelper(root.right, min: root.val, max: max)
        }

        return isValidBSTHelper(root)
    }
}