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
        var answer = true
        var prev: Int?

        func traversal(root: TreeNode?) {
            guard let root = root else { return }
            
            traversal(root: root.left)

            if let prev = prev, root.val <= prev {
                answer = false
                return
            } 
            print(root.val)
            prev = root.val

            traversal(root: root.right)
        }

        traversal(root: root)
        return answer
    }
}