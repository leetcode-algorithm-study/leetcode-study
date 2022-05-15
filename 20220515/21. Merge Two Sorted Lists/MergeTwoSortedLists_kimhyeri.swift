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

class Solution {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var new: ListNode?
        var answer: ListNode?
        
        var left = list1
        var right = list2
        
        func checkIsFirst() -> Bool {
            if answer == nil {
                return true
            } else {
                return false
            }
        }
        
        while true {
            // 모두 비었을 때
            if left == nil, right == nil {
                break
            }
            // 왼쪽만 비었을 때
            else if left == nil, right != nil {
                if checkIsFirst() {
                    new = right
                    answer = new
                } else {
                    new?.next = right
                }
                break
            }
            // 오른쪽만 비었을 때
            else if left != nil, right == nil {
                if checkIsFirst() {
                    new = left
                    answer = new
                } else {
                    new?.next = left
                }
                break
            }
            // 두쪽 다 값이 있을 때
            else {
                if let leftVal = left?.val, let rightVal = right?.val {
                    if leftVal < rightVal {
                        if checkIsFirst() {
                            new = ListNode(leftVal)
                            answer = new
                        } else {
                            new?.next = ListNode(leftVal)
                            new = new?.next
                        }
                        left = left?.next
                    } else if leftVal == rightVal {
                        if checkIsFirst() {
                            new = ListNode(leftVal)
                            answer = new
                        } else {
                            new?.next = ListNode(leftVal)
                            new = new?.next
                        }
                        left = left?.next
                        new?.next = ListNode(rightVal)
                        new = new?.next
                        right = right?.next
                    } else {
                        if checkIsFirst() {
                            new = ListNode(rightVal)
                            answer = new
                        } else {
                            new?.next = ListNode(rightVal)
                            new = new?.next
                        }
                        right = right?.next
                    }
                }
            }
        }
        
        return answer
    }
}
