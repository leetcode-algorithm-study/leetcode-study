//
//  BinaryTreeInorderTraversal.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/09/28.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 94. Binary Tree Inorder Traversal

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

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var answer = [Int]()
    
    guard let rootNode = root else {
        return []
    }
    
    func traversal(node: TreeNode) {
        if node.left == nil, node.right == nil {
            answer.append(node.val)
            return
        }
        // 왼쪽 노드가 있는 경우
        if let leftNode = node.left {
            traversal(node: leftNode)
        }
        
        // 루트 노드 붙히기
        answer.append(node.val)
        
        // 오른쪽 노드가 있는 경우
        if let rightNode = node.right {
            traversal(node: rightNode)
        }
    }
    
    traversal(node: rootNode)
    return answer
}

let root = TreeNode(1, nil, TreeNode(2, TreeNode(3), nil))
print(inorderTraversal(root))
//Input: root = [1,null,2,3]
//Output: [1,3,2]

//Input: root = []
//Output: []

//Input: root = [1]
//Output: [1]

//Input: root = [1,2]
//Output: [2,1]

//Input: root = [1,null,2]
//Output: [1,2]

