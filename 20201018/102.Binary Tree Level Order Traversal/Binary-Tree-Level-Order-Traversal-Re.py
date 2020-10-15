# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def levelOrder(self, root: TreeNode) -> List[List[int]]:
        queue=deque()
        if root!=None:
            queue.append(root)
        result=[]
        while queue:
            leng=len(queue)
            temps=[]
            for i in range(leng):
                data=queue.popleft()
                temps.append(data.val)
                if data.left!=None:
                    queue.append(data.left)
                if data.right!=None:
                    queue.append(data.right)
            result.append(temps)
        return result
    
# Runtime: 36 ms, faster than 63.13% of Python3 online submissions for Binary Tree Level Order Traversal.
# Memory Usage: 14.3 MB, less than 15.35% of Python3 online submissions for Binary Tree Level Order Traversal.
