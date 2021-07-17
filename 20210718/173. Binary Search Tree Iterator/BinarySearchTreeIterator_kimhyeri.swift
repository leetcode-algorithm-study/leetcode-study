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
        traversal = inorderTraversal(root)
    }
    
    func next() -> Int {
        return traversal.removeFirst()
    }
    
    func hasNext() -> Bool {
        return traversal.count > 0
    }
    
    private func inorderTraversal(_ root: TreeNode?) -> [Int] {
        guard let node = root else { return [] }
        
        var result = [Int]()
        
        result = result + inorderTraversal(node.left)
        result.append(node.val)
        result = result + inorderTraversal(node.right)
        
        return result
    }
}

/**
 * Your BSTIterator object will be instantiated and called as such:
 * let obj = BSTIterator(root)
 * let ret_1: Int = obj.next()
 * let ret_2: Bool = obj.hasNext()
 */
