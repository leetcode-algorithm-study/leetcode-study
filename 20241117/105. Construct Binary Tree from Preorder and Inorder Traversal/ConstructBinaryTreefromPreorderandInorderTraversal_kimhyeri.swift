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
        
        // preorder의 첫 번째는 항상 루트
        let rootVal = preorder[0] 
        var rootNode = TreeNode(rootVal)
        // inorder에서 rootVal의 인덱스를 찾아 mid에 저장
        let mid = inorder.index(of: rootVal)! 

        rootNode.left = buildTree(Array(preorder[1..<(mid+1)]), Array(inorder[..<mid]))
        rootNode.right = buildTree(Array(preorder[(mid+1)...]), Array(inorder[(mid+1)...]))

        return rootNode
    }
}

// Preorder Traversal - [Root, Left, Right]
// Inorder Traversal - [Left, Root, Right]

// preorder = [3,9,20,15,7], inorder = [9,3,15,20,7]
// 3이 루트
// mid값은 1 (index)
// left = [9], [9]
// right = [20,15,7], [15,20,7]
