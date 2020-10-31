//
//  ConstructBinaryTreefromPreorderandInorderTraversal.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/10/31.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 105. Construct Binary Tree from Preorder and Inorder Traversal

class TreeNode {
     var val: Int
     var left: TreeNode?
     var right: TreeNode?
    
     init() {
        self.val = 0
        self.left = nil
        self.right = nil
     }
    
     init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
     }
    
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    guard !preorder.isEmpty else { return nil }
    var map = [Int:Int]()
    var preorder = preorder

    for (index, item) in inorder.enumerated() {
        map[item] = index
    }
        
    func getNode(_ start: Int, _ end: Int) -> TreeNode? {
        if start > end { return nil }
        let node = TreeNode(preorder.removeFirst())
        // treats the preorder list as a stack and removes items for processing
        let index = map[node.val]!
        
        node.left = getNode(start, index - 1)
        node.right = getNode(index + 1, end)
        
        return node
    }
    return getNode(0, preorder.count - 1)
}

//Runtime: 24 ms, faster than 94.12% of Swift online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
//Memory Usage: 15.7 MB, less than 5.23% of Swift online submissions for Construct Binary Tree from Preorder and Inorder Traversal.
