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
    func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
        guard let root = root, let subRoot = subRoot else { return false }
        var answer = false
        
        func traversal(node: TreeNode) {
            guard !answer else { return }

            if node.val == subRoot.val { 
                answer = compare(root: node, sub: subRoot)
            } 
            if let leftNode = node.left { 
                traversal(node: leftNode) 
            }
            if let rightNode = node.right { 
                traversal(node: rightNode)
            }   
        }
            
        func compare(root: TreeNode?, sub: TreeNode?) -> Bool {
            if root?.val != sub?.val {
                return false
            } else if root == nil, sub == nil {
                return true
            } else if root == nil || sub == nil {
                return false
            }
                        
            return compare(root: root?.left, sub: sub?.left) && compare(root: root?.right, sub: sub?.right)
        }
        
        traversal(node: root)
        return answer
    }
}