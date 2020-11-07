//
//  ReverseNodesink-Group.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/11/08.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// 25. Reverse Nodes in k-Group

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

func reverseKGroup(_ head: ListNode?, _ k: Int) -> ListNode? {
    var head = head
    var current = head
    var count = 0
    
    // k까지 count 증가 k번째로 가기 위함
    while current != nil, count != k {
        current = current?.next
        count += 1
    }
    
    // k위치로 도달했을 때
    if count == k {
        // 나머지 반 가능한지
        current = reverseKGroup(current, k)
        // 역순으로 돌리는 과정
        while count > 0 {
            let temp = head?.next
            head?.next = current
            current = head
            head = temp
            count -= 1
        }
        head = current
    }
    
    return head
}
