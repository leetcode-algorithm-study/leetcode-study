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
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard let head = head else { return nil }

        var prev: ListNode? = nil
        var curr: ListNode? = head
        var next: ListNode? = curr?.next

        while curr != nil {
            next = curr?.next
            curr?.next = prev
            prev = curr
            curr = next
        }

        return prev
    }

}

