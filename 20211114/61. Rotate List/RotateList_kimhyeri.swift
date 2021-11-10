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
    func rotateRight(_ head: ListNode?, _ k: Int) -> ListNode? {
        guard head?.next != nil else { return head }
        guard k != 0 else { return head }
        
        var count = 0
        var temp = head
        var temptemp = head
        
        while temp != nil {
            count = count + 1
            temp = temp?.next
        }
        
        temp = head
        
        let rotate = k % count
        
        for _ in 0..<rotate {
            temp = temp?.next
        }
        
        while temp?.next != nil {
            temp = temp?.next
            temptemp = temptemp?.next
        }
        
        temp?.next = head
        let answer = temptemp?.next
        temptemp?.next = nil
        return answer
    }
}
