//
//  main.swift
//  Leetcode
//
//  Created by ELLIE on 2021/06/27.
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

class BSTIterator {
    var traversal = [Int]()
    
    init(_ root: TreeNode?) {
        inorderTraversal(root)
    }
    
    func next() -> Int {
        return traversal.removeFirst()
    }
    
    func hasNext() -> Bool {
        return !traversal.isEmpty
    }
    
    func inorderTraversal(_ root: TreeNode?) {
        guard let node = root else { return }

        if node.left == nil, node.right == nil {
            traversal.append(node.val)
            return
        }

        if let leftNode = node.left {
            inorderTraversal(leftNode)
        }
        
        traversal.append(node.val)

        if let rightNode = node.right {
            inorderTraversal(rightNode)
        }
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
