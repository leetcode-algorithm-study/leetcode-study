# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
from collections import deque
class Solution:
    def zigzagLevelOrder(self, root: TreeNode) -> List[List[int]]:
        if not root:
            return []
        queue = deque([(root, 0)])
        dueue = defaultdict(list)
        while queue:
            node, depth = queue.popleft()
            dueue[depth] += [node.val] 
            if node.left:
                queue.append((node.left, depth+1))
            if node.right:
                queue.append((node.right, depth+1))
        return [v[::-1] if k & 1 else v for k, v in dueue.items()]

# Runtime: 28 ms, faster than 90.64% of Python3 online submissions for Binary Tree Zigzag Level Order Traversal.
# Memory Usage: 14.2 MB, less than 100.00% of Python3 online submissions for Binary Tree Zigzag Level Order Traversal.
