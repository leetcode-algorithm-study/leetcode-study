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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var elements = [Int]()

        func traversal(root: TreeNode?) {
            guard let root = root else { return }
            elements.append(root.val)
            traversal(root: root.left)
            traversal(root: root.right)
        }

        traversal(root: root)
        
        return elements.sorted()[k-1]
    }
}

// 33 ms
// 16.9 MB


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
    func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
        var elements = [Int]()

        func traversal(root: TreeNode?) {
            guard let root = root else { return }
            traversal(root: root.left)
            elements.append(root.val)
            traversal(root: root.right)
        }

        traversal(root: root)

        return elements[k-1]
    }
}

// 29 ms
// 16.4 MB
