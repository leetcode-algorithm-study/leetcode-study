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
    func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
        guard !inorder.isEmpty && !preorder.isEmpty else { return nil }
        
        let rootVal = preorder[0]
        var rootNode = TreeNode(rootVal)
        let mid = inorder.index(of: rootVal)!

        print("preorder:\(preorder) mid:\(mid) inorder\(inorder)")
        rootNode.left = buildTree(Array(preorder[1..<(mid + 1)]), Array(inorder[...mid]))
        rootNode.right = buildTree(Array(preorder[(mid + 1)...]), Array(inorder[(mid+1)...]))

        return rootNode
    }

}
