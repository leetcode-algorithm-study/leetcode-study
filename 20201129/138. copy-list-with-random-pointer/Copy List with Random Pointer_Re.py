"""
# Definition for a Node.
class Node:
    def __init__(self, x: int, next: 'Node' = None, random: 'Node' = None):
        self.val = int(x)
        self.next = next
        self.random = random
"""


class Solution:
    def copyRandomList(self, head: 'Node') -> 'Node':
        if not head:
            return None

        newHead = head
        while newHead:
            node = Node(newHead.val, newHead.next, newHead.random)
            newHead.next = node
            newHead = node.next

        newHead = head
        while newHead:
            copy = newHead.next
            copy.random = newHead.random.next if newHead.random else None
            newHead = copy.next

        newHead = head
        copyHead = head.next
        while newHead:
            copy = newHead.next
            newHead.next = copy.next
            copy.next = copy.next.next if copy.next else None
            newHead = newHead.next
        return copyHead
