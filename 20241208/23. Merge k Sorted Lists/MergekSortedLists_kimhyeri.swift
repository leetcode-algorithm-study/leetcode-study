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
    func mergeKLists(_ lists: [ListNode?]) -> [Int] {
        // Min-heap to store the nodes based on their values
        var heap = [ListNode]()

        // Add the head of each list to the heap
        for node in lists {
            if let node = node {
                heap.append(node)
            }
        }

        // Build the heap based on node values
        heap.sort { $0.val < $1.val }

        var result = [Int]()

        while !heap.isEmpty {
            // Remove the smallest element from the heap
            let smallest = heap.removeFirst()
            result.append(smallest.val)

            // If there is a next node, add it to the heap
            if let nextNode = smallest.next {
                heap.append(nextNode)
                heap.sort { $0.val < $1.val }
            }
        }

        return result
    }
}