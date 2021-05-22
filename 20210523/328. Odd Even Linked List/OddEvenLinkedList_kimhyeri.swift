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
    func oddEvenList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        prev?.next = head
        var temp = head
        
        var index = 1
        var endNode: ListNode?
        var nodeList = [Int]()
        
        while(temp != nil) {
            // 짝수는
            if index % 2 == 0 {
                nodeList.append(temp?.val ?? 0)
                prev?.next = temp?.next
            }
            // 홀수, 홀수로 끝날 때
            if (temp?.next != nil || index % 2 != 0) {
                prev = temp
            }
            temp = temp?.next
            index = index + 1
        }
        
        for value in nodeList {
            temp = ListNode(value)
            prev?.next = temp
            prev = temp
        }
        return head
    }
}
