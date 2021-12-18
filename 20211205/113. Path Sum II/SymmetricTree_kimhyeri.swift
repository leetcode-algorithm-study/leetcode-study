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
    func isMirror(_ root: TreeNode?, rootMirror: TreeNode?)-> Bool{
        if root == nil && rootMirror == nil {
            return true
        } else if root == nil || rootMirror == nil {
            return false
        } else if (root!.val == rootMirror!.val) && isMirror(root?.left, rootMirror: rootMirror?.right) && isMirror(root?.right, rootMirror: rootMirror?.left) {
            return true
        } else {
            return false
        }
    }
   
    func isSymmetric(_ root: TreeNode?) -> Bool {
        return isMirror(root, rootMirror: root)
    }
}
