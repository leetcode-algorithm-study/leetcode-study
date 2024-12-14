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

class Solution {
    func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
        // root, p, q가 nil이면, 종료
        guard let root = root, let p = p, let q = q else {
            return nil 
        }
        
        // p와 q 값이 모두 root보다 작다면, 왼쪽 서브트리에서 LCA 찾기
        if p.val < root.val && q.val < root.val {
            return lowestCommonAncestor(root.left, p, q)
        }
        
        // p와 q 값이 모두 root보다 크다면, 오른쪽 서브트리에서 LCA 찾기
        if p.val > root.val && q.val > root.val {
            return lowestCommonAncestor(root.right, p, q)
        }
        
        // p와 q 값이 각각 root보다 크거나 작다면, root가 LCA
        return root
    }
}