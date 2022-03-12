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
*
class Solution {
    func mergeNodes(_ head: ListNode?) -> ListNode? {
        var temp = head?.next
        var answer = temp
        
        while temp != nil {
            var sum = 0
            var temptemp = temp
            
            while temptemp?.val != 0 {
                sum = sum + (temptemp?.val ?? 0)
                temptemp = temptemp?.next
            }
            temp?.val = sum
            temp?.next = temptemp?.next
            temp = temp?.next
        }
        
        return answer
    }
}
