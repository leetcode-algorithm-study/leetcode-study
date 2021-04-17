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
        var array1 = [TreeNode]()
        var array2 = [TreeNode]()
        
        if findPath(root, &array1, p!.val) && findPath(root, &array2, q!.val) {
            var i = 0
            
            while i < array1.count && i < array2.count {
                if array1[i].val != array2[i].val { 
                    break 
                }
                i = i + 1
            }
            return array1[i-1]
        }
        return nil
    }
    
    func findPath(_ root: TreeNode?, _ path: inout [TreeNode], _ target: Int) -> Bool {
        guard let root = root else { return false }
        path.append(root)
        if root.val == target { 
            return true
        }

        if (findPath(root.left, &path, target) || findPath(root.right, &path, target)) {
            return true
        }

        path.removeLast()
        return false
    }
}
