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
    func isEqualValue(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        // 두 트리의 값이 같고, 왼쪽과 오른쪽 서브트리도 동일한지 확인
        guard let root = root, let subRoot = subRoot else { return root == nil && subRoot == nil }
        return root.val == subRoot.val &&
               isEqualValue(root.left, subRoot.left) &&
               isEqualValue(root.right, subRoot.right)
    }

    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root, let subRoot = subRoot else { return false }
        
        // 현재 root가 subRoot와 일치하면 서브트리인 경우
        if isEqualValue(root, subRoot) {
            return true
        }
        
        // 아니면 left, right subtree에서 subRoot를 찾기
        return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
    }
}