//
//  ValidateBinarySearchTree.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/10/01.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 98. Validate Binary Search Tree

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

/// Assume a BST is defined as follows:
/// The left subtree of a node contains only nodes with keys less than the node's key.
/// The right subtree of a node contains only nodes with keys greater than the node's key.
/// Both the left and right subtrees must also be binary search trees.

public class TreeNode {
    public var val: Int
    
    public var left: TreeNode?
    public var right: TreeNode?
    
    public init() {
        self.val = 0
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
    
    public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func isValidBST(_ root: TreeNode?) -> Bool {
    return BST(node: root, min: Int.min, max: Int.max)
}

func BST(node: TreeNode?, min: Int, max: Int) -> Bool {
    if node == nil {
        return true
    }
    
    if node!.val <= min {
        return false
    }

    if node!.val >= max {
        return false
    }
    
    return BST(node: node?.left, min: min, max: node!.val) &&
        BST(node: node?.right, min: node!.val, max: max)
}


print(isValidBST(TreeNode(0, TreeNode(-1), nil)))
// true

print(isValidBST(TreeNode(0)))
// true

print(isValidBST(TreeNode(10, TreeNode(5, nil, TreeNode(6)), TreeNode(15, nil, TreeNode(20)))))
// true

print(isValidBST(TreeNode(2, TreeNode(1), TreeNode(3))))
//   2
//  / \
// 1   3

// Input: [2,1,3]
// Output: true

print(isValidBST(TreeNode(5, TreeNode(1), TreeNode(4, TreeNode(3), TreeNode(6)))))
//   5
//  / \
// 1   4
//    / \
//   3   6

// Input: [5,1,4,null,null,3,6]
// Output: false
// Explanation: The root node's value is 5 but its right child's value is 4.
