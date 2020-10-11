# Definition for singly-linked list.
# class ListNode:
#     def __init__(self, val=0, next=None):
#         self.val = val
#         self.next = next
class LinkedList:
    def __init__(self):
        dummy = ListNode("dummy")
        self.head = dummy
        self.tail = dummy


        
    # append 메소드 (insert - 맨 뒤에 노드 추가, tail과 node의 next, 데이터 개수 변경)
    def append(self, data):
        new_node = ListNode(data)
        self.tail.next = new_node
        self.tail = new_node

        
        
        
class Solution:
    def mergeKLists(self, lists: List[ListNode]) -> ListNode:
        dic=dict()
        leeRe=LinkedList()
        if lists==[]:
            return leeRe.head.next
        
        for list in lists:
            if list==[] or list==None:
                continue
            while 1:
                if list.val not in dic.keys():
                    dic[list.val]=1
                else:
                    dic[list.val]+=1
                if list.next!=None:
                    list=list.next
                else:
                    break
        if len(dic)==0:
            return leeRe.head.next
        
        t=sorted(dic.items())
        leeRe=LinkedList()
        for node in t:
            for _ in range(node[1]):
                leeRe.append(node[0])
        return leeRe.head.next
    
# Runtime: 92 ms, faster than 96.96% of Python3 online submissions for Merge k Sorted Lists.
# Memory Usage: 18.4 MB, less than 11.97% of Python3 online submissions for Merge k Sorted Lists.
