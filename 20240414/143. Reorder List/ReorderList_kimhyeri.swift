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

// Time Limit Exceeded 
// 10 / 12 testcases passed
class Solution {
    func reorderList(_ head: ListNode?) {
        var leftNode = head
        var rightNode = head
        
        // 몇번 실행되어야 하는지 체크
        var index = 0
        var node = head
        while node != nil {
            index = index + 1
            node = node?.next
        }
        
        // 마지막 노드찾는 함수
        // 마지막 노드 이전 노드는 nil 처리
        func findLastNode(_ head: ListNode?) -> ListNode? {
            var temp = head
            var prev = temp
            while temp?.next != nil {
                prev = temp
                temp = temp?.next
            }
            prev?.next = nil
            return temp
        }
        
        var cycle = index % 2 == 0 ? (index / 2) - 1 : index / 2
        
        while cycle > 0 {
            cycle = cycle - 1
            let nextNode = leftNode?.next
            let lastNode = findLastNode(rightNode)
            leftNode?.next = lastNode
            lastNode?.next = nextNode
            leftNode = leftNode?.next?.next
        }
    }
}

// SWAP 
class Solution {
    func reorderList(_ head: ListNode?) {
        guard head != nil else { return }

        var nodes = [ListNode]()
        var node = head
        while node != nil { 
            if let node = node {
                nodes.append(node)
            }
            node = node?.next
        }

        while nodes.count > 2 {
            let next = nodes[0].next
            nodes[0].next = nodes[nodes.count-1]
            nodes[nodes.count-2].next = nil
            nodes[nodes.count-1].next = next
            nodes.removeFirst()
            nodes.removeLast()
        }
    }
}