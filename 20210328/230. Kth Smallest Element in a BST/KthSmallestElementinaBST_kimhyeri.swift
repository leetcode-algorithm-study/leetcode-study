//
//  KthSmallestElementinaBST.swift
//  LeetCode
//
//  Created by 김혜리 on 2021/03/22.
//  Copyright © 2021 hyerikim. All rights reserved.
//

import Foundation

/// 230. Kth Smallest Element in a BST

func kthSmallest(_ root: TreeNode?, _ k: Int) -> Int {
    guard let node = root else {
        return 0
    }
    
    var answer = [Int]()
    
    func traversal(_ root: TreeNode?) {
        guard let node = root else {
            return
        }
        
        traversal(node.left)
        answer.append(node.val)
        traversal(node.right)
    }
    
    traversal(node)
    
    return answer[k-1]
}
