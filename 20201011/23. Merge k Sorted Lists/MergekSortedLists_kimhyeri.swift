//
//  MergekSortedLists.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/10/07.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 23. Merge k Sorted Lists

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */

public class ListNode {
    public var val: Int
    public var next: ListNode?
    
    public init() {
        self.val = 0
        self.next = nil
    }
    
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
    }
}

func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
    var answer: ListNode?
    var temp: ListNode?
    
    var arr = [Int]()
    
    for i in lists {
        guard let node = i else { continue }
        temp = node
        arr.append(node.val)
        while true {
            guard let next = temp?.next else { break }
            arr.append(next.val)
            temp = next
        }
    }
    
    arr.sort()
    
    var before: ListNode?
    var current: ListNode?
    
    for i in 0..<arr.count {
        current = ListNode(arr[i])
        
        if before == nil {
            before = current
            answer = before
        } else {
            before?.next = current
            before = before?.next
        }
    }
    
    return answer
}

let lists = [ListNode(1, ListNode(4, ListNode(5))),
             ListNode(1, ListNode(3, ListNode(4))),
             ListNode(2, ListNode(6))]

print(mergeKLists(lists))

// Runtime: 68 ms, faster than 98.44% of Swift online submissions for Merge k Sorted Lists.
// Memory Usage: 16.3 MB, less than 91.15% of Swift online submissions for Merge k Sorted Lists.
