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
    func mergeKLists(_ lists: [ListNode?]) -> ListNode? {
        var array = [Int]()
        for i in lists {
            array.append(contentsOf: convertToArray(i))
        }
        
        var root: ListNode?
        var temp: ListNode?
        
        for i in array.sorted() {
            if temp == nil {
                temp = ListNode(i)
                root = temp
            } else {
                temp?.next = ListNode(i)
                temp = temp?.next
            }
        }

        return root
    }

    func convertToArray(_ head: ListNode?) -> [Int] {
        var result: [Int] = []
        var current: ListNode? = head
        
        while let node = current {
            result.append(node.val)
            current = node.next
        }
        
        return result
    }
}