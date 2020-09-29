# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def inorderTraversal(self, root: TreeNode) -> List[int]:
        if root:
            return self.inorderTraversal(root.left) + [root.val] + self.inorderTraversal(root.right)
        else:
            return []

# Runtime: 28 ms, faster than 78.42% of Python3 online submissions for Binary Tree Inorder Traversal.
# Memory Usage: 14.1 MB, less than 5.14% of Python3 online submissions for Binary Tree Inorder Traversal.
