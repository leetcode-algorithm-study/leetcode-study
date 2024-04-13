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
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        
        var temp = head
        var count = 0

        while temp != nil {
            temp = temp?.next
            count = count + 1
        }

        temp = head
        var target = count - n
    
        // 첫번째 노드가 사라져아하는 경우
        if target == 0 {
            temp = temp?.next
            return temp
        } else {
            while temp != nil {
                target = target - 1
                if target < 1 {
                    temp?.next = temp?.next?.next
                    break
                } else {
                    temp = temp?.next
                }
            }
        }

        return head
    }
}