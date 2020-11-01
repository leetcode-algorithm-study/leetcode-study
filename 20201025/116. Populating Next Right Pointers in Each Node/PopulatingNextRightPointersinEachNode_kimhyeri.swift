//
//  PopulatingNextRightPointersinEachNode.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/10/31.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 116. Populating Next Right Pointers in Each Node

class Node {
    var val: Int
    var left: Node?
    var right: Node?

    var next: Node?
    
    init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
        self.next = nil
    }
}

func connect(_ root: Node?) -> Node? {
    guard let node = root else { return nil }
    
    var queue: [Node] = [node]
    var count = 0
    var level = 1
    
    while !queue.isEmpty {
        count += 1
        if count == level {
            for i in 0..<queue.count-1 {
                queue[i].next = queue[i+1]
            }
            // 아래로 내려갈수록 자식은 2배수
            level = level * 2
        }
        
        let node = queue.removeFirst()
        
        // 왼쪽 노드가 존재하면 
        if let left = node.left {
            queue.append(left)
        }
        
        // 오른쪽 노드가 존재하면
        if let right = node.right {
            queue.append(right)
        }
    }
    return node
}

//Runtime: 84 ms, faster than 67.92% of Swift online submissions for Populating Next Right Pointers in Each Node.
//Memory Usage: 15.2 MB, less than 45.28% of Swift online submissions for Populating Next Right Pointers in Each Node.
