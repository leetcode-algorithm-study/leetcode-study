//
//  AddTwoNumbers.swift
//  LeetCode
//
//  Created by 김혜리 on 2020/07/24.
//  Copyright © 2020 hyerikim. All rights reserved.
//

import Foundation

/// #2 Add Two Numbers
/// You may assume the two numbers do not contain any leading zero, except the number 0 itself.

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

func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    var stack1 = [Int]()
    var stack2 = [Int]()

    var current1 = l1
    var current2 = l2
    
    while true {
        if let value = current1?.val {
            stack1.append(value)
        }
        if current1?.next == nil {
            break
        }
        current1 = current1?.next
    }
    
    while true {
        if let value = current2?.val {
            stack2.append(value)
        }
        if current2?.next == nil {
            break
        }
        current2 = current2?.next
    }
    
    var before = 0
    var next = 0
    var answerArr = [Int]()
    var sum = 0

    // 정수로 담을 수 없는 경우도 존재하기 때문에
    while true {
        if !stack1.isEmpty, !stack2.isEmpty {
            let a = stack1.removeFirst()
            let b = stack2.removeFirst()
            sum = a + b
            
            if before == 1 {
                sum = sum + 1
                if sum > 9 {
                    // 다음에 더할 1을 저장
                    next = 1
                    // 다음에 더해줄꺼기 때문에 10을 빼준다
                    answerArr.append(sum - 10)
                } else {
                    answerArr.append(sum)
                }
            } else {
                if sum > 9 {
                    // 다음에 더할 1을 저장
                    next = 1
                    // 다음에 더해줄꺼기 때문에 10을 빼준다
                    answerArr.append(sum - 10)
                } else {
                    answerArr.append(sum)
                }
            }
        } else if stack1.isEmpty, !stack2.isEmpty {
            //stack1이 비었을 때 stack2에 있는 숫자를 붙혀준다
            if before == 1 {
                let val = stack2.removeFirst() + 1
                if val > 9 {
                    answerArr.append(val - 10)
                    next = 1
                } else {
                    answerArr.append(val)
                }
            } else {
                answerArr.append(stack2.removeFirst())
            }
        } else if stack2.isEmpty, !stack1.isEmpty {
            //stack2가 비었을 때 stack1에 있는 숫자를 붙혀준다
            if before == 1 {
                let val = stack1.removeFirst() + 1
                if val > 9 {
                    answerArr.append(val - 10)
                    next = 1
                } else {
                    answerArr.append(val)
                }
            } else {
                answerArr.append(stack1.removeFirst())
            }
        } else {
            //stack1,2가 비었을 때
            if before == 1 {
                answerArr.append(1)
            }
            break
        }
        // next, before, sum 초기화
        sum = 0
        before = next
        next = 0
    }
    
    var answerNode:[ListNode] = [ListNode]()
    answerArr = answerArr.reversed()
    
    for i in 0..<answerArr.count {
        if i == 0 {
            answerNode.append(ListNode(answerArr[i]))
        } else {
            let pretend = answerNode.first
            answerNode.insert(ListNode(answerArr[i], pretend), at: 0)
        }
    }

    return answerNode.first
}

let nodeA1 = ListNode(2)

let nodeB3 = ListNode(9)
let nodeB2 = ListNode(9, nodeB3)
let nodeB1 = ListNode(8, nodeB2)

print(addTwoNumbers(nodeA1, nodeB1))

// Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
// Output: 7 -> 0 -> 8
// Explanation: 342 + 465 = 807.

// Result
// Runtime: 100 ms, faster than 5.17% of Swift online submissions for Add Two Numbers.
// Memory Usage: 20.7 MB, less than 91.82% of Swift online submissions for Add Two Numbers.
