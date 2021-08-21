//
//  Subtree of Another Tree_kimhyeri.swift
//  Leetcode
//
//  Created by ELLIE on 2021/08/22.
//

import Foundation

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
            if answer {
                return
            }
            if node.val == subRoot.val {
                answer = compare(node: node, sub: subRoot)
            }
            if let leftNode = node.left {
                traversal(node: leftNode)
            }
            if let rightNode = node.right {
                traversal(node: rightNode)
            }
        }
            
        func compare(node: TreeNode?, sub: TreeNode?) -> Bool {
            if node?.val != sub?.val {
                return false
            }
            if node == nil, sub == nil {
                return true
            }
            if node == nil || sub == nil {
                return false
            }
                        
            return compare(node: node?.left, sub: sub?.left) && compare(node: node?.right, sub: sub?.right)
        }
        
        traversal(node: root)
        return answer
    }
}

print(isSubtree(TreeNode(1, TreeNode(1, nil, nil), nil), TreeNode(1)))

let a = TreeNode(3, TreeNode(4, TreeNode(1, nil, nil), TreeNode(2, nil, nil)), TreeNode(5, nil, nil))
let b = TreeNode(4, TreeNode(1, nil, nil), TreeNode(2, nil, nil))
print(isSubtree(a, b))

//Input: root = [3,4,5,1,2], subRoot = [4,1,2]
//Output: true

//Input
//[1,1]
//[1]
