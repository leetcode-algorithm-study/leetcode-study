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
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var answer = head
        var left = head
        var right = head?.next
        var duplicate = false
        
        while right != nil {
            // distinct하지 않음
            
            // 처음부터 일치하는 경우
            if left?.val == right?.val {
                while left?.val == right?.val {
                    right = right?.next
                }
                left = right
                answer = left
                right = right?.next
            }
            
            // 중간에 일치하는 경우
            else if right?.val == right?.next?.val {
                while right?.val == right?.next?.val {
                    right = right?.next
                }
                right = right?.next
                duplicate = true
            }
            
            // 일치하지 않음
            else {
                if duplicate {
                    duplicate = false
                    left?.next = right
                }
                left = right
                right = right?.next
            }
        }
        
        if duplicate {
            left?.next = nil
        }
        
        return answer
    }
}
