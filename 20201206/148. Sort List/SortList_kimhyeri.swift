//
//  SortList.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/12/04.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 148. Sort List
/// Follow up: Can you sort the linked list in O(n logn) time and O(1) memory (i.e. constant space)?

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

func sortList(_ head: ListNode?) -> ListNode? {
    var temp: ListNode?
    var min: ListNode?
    
    guard let head = head else { return temp }

    temp = head.next
    min = head
    
    while min?.next != nil {
        // 최솟값 찾으러 가는 곳
        while temp != nil {
            if min!.val > temp!.val {
                let value = temp?.val
                temp?.val = min!.val
                min?.val = value!
            }
            temp = temp?.next
        }
        
        min = min?.next
        temp = min?.next
    }
    
    return head
}

let head1 = ListNode(4, ListNode(2, ListNode(1, ListNode(3))))
sortList(head1)
//Input: head = [4,2,1,3]
//Output: [1,2,3,4]


let head2 = ListNode(-1, ListNode(5, ListNode(3, ListNode(4, ListNode(0)))))
sortList(head2)
//Input: head = [-1,5,3,4,0]
//Output: [-1,0,3,4,5]

let head3 = ListNode()
sortList(head3)
//Input: head = []
//Output: []
