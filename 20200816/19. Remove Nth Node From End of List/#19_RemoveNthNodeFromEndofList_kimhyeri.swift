//
//  RemoveNthNodeFromEndofList.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/08/09.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 19. Remove Nth Node From End of List

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

func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
    var temp: ListNode? = head
    var remove: ListNode? = nil
    var answer: ListNode?
    var count = 1

    answer = temp
    
    if temp?.next == nil {
        return remove
    }
    
    while true {
        if temp?.next == nil {
            if remove == nil {
                answer = head?.next
            }
            remove?.next = remove?.next?.next
            break
        } else {
            temp = temp?.next
        }
        if count == n {
            remove = head
        } else if count > n {
            remove = remove?.next
        }
        count = count + 1
    }
    return answer
}

let node5 = ListNode(5)
let node4 = ListNode(4, node5)
let node3 = ListNode(3, node4)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

print(removeNthFromEnd(node1, 2))

// Given linked list: 1->2->3->4->5, and n = 2.
// After removing the second node from the end, the linked list becomes 1->2->3->5.

// Result
// Runtime: 8 ms, faster than 92.74% of Swift online submissions for Remove Nth Node From End of List.
// Memory Usage: 20.6 MB, less than 71.29% of Swift online submissions for Remove Nth Node From End of List.


//func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
//    var temp = head
//    var count = 0
//    var answer: ListNode?
//
//    while true {
//        temp = temp?.next
//        count = count + 1
//        if temp == nil {
//            break
//        }
//    }
//
//    if n == 1, count == 1 {
//        return nil
//    }
//
//    temp = head
//    answer = temp
//
//    while true {
//        print(temp?.val)
//        print(count)
//        if count == n + 1 {
//            temp?.next = temp?.next?.next
//            break
//        } else {
//            temp = temp?.next
//        }
//        count = count - 1
//    }
//
//    return answer
//}

// 시간 초과
