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

// class Solution {
//     func maxDepth(_ root: TreeNode?) -> Int {
//         guard let root = root else { return 0 }
//         return 1 + max(maxDepth(root.left), maxDepth(root.right))
//     }
// }

class Solution {
    var answer = 0
    
    func maxDepth(_ root: TreeNode?) -> Int {
        traversal(node: root, count: 0)
        return answer     
    }
    
    func traversal(node: TreeNode?, count: Int) {
        if let node = node {
            traversal(node: node.left, count: count + 1)
            traversal(node: node.right, count: count + 1)
        } else {
            answer = max(answer, count)
        }
    }
}
