# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def levelOrder(self, root: Optional[TreeNode]) -> List[List[int]]:
        self.result = []

        def helper(node, level):
            if node is None:
                return
            if len(self.result) == level:
                self.result.append([])
            self.result[level].append(node.val)
            helper(node.left, level + 1)
            helper(node.right, level + 1)
        
        # level(=index) 0부터 시작
        helper(root, 0)
        return self.result

            