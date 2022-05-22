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
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        arrayToBST(nums: nums, left: 0, right: nums.count - 1)
    }

    private func arrayToBST(nums: [Int], left: Int, right: Int) -> TreeNode? {
        if left > right { return nil }
        if left == right { return TreeNode(nums[left]) }
        else {
            let mid = (left + right) / 2
            let node = TreeNode(nums[mid])
            node.left = arrayToBST(nums: nums, left: left, right: mid - 1)
            node.right = arrayToBST(nums: nums, left: mid + 1, right: right)
            return node
        }
    }
}
