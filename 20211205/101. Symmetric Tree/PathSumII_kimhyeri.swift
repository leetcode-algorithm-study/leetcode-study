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
    var paths = [[Int]]()
    
    func pathSum(_ root: TreeNode?, _ sum: Int) -> [[Int]] {
        var path = [Int]()
        var res = [[Int]]()
        dfs(root, &path)
        for path in paths {
            var all = path.reduce(0, +)
            if all == sum {
                res.append(path)
            }
        }
        return res
    }
    
    func dfs(_ root: TreeNode?, _ path: inout [Int]) {
        guard let root = root else { return }
        
        path.append(root.val)
        if root.left == nil, root.right == nil {
            paths.append(path)
        }
        
        dfs(root.left, &path)
        dfs(root.right, &path)
        path.removeLast()
    }
}
