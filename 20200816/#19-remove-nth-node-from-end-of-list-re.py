# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class Solution:
    def removeNthFromEnd(self, head: ListNode, n: int) -> ListNode:
        first = second = dummy = ListNode(0)
        dummy.next = head
        for _ in range(n):
            first = first.next
        print(first.val, second.val)
        while first and first.next:
            first = first.next
            second = second.next
            print(first.val, second.val)
        second.next = second.next.next
        return dummy.next
