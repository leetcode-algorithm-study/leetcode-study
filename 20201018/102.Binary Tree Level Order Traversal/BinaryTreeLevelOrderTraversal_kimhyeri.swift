//
//  BinaryTreeLevelOrderTraversal.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/10/17.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 102. Binary Tree Level Order Traversal

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

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let rootnode = root else { return [] }
    var result: [[Int]] = []
    
    // 순회하기 위한 배열
    var array: [TreeNode?] = [TreeNode]()
    array.append(rootnode)
    
    while(!array.isEmpty) {
        var count = array.count - 1
        var level = [Int]()
        
        // 차례로 왼쪽 오른쪽 가기 위해서
        while(count >= 0) {
            if let node = array.removeFirst() {
                level.append(node.val)
                
                if let left = node.left {
                    array.append(left)
                }
                if let right = node.right {
                    array.append(right)
                }
                count = count - 1
            }
        }
        result.append(level)
    }
    
    return result
}

let tree = TreeNode(3, TreeNode(9), TreeNode(20, TreeNode(15), TreeNode(7)))
print(levelOrder(tree))

//        3
//       / \
//      9  20
//        /  \
//       15   7
