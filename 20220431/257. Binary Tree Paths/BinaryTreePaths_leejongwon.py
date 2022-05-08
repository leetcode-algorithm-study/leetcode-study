# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def binaryTreePaths(self, root: Optional[TreeNode]) -> List[str]:
        
        result = []
        
        def helper(node, path):
            if not node:
                return
            
            if not node.left and not node.right:
                result.append(path[::] + [str(node.val)])
            else:
                helper(node.left, path + [str(node.val)])
                helper(node.right, path + [str(node.val)])
            
            
        helper(node=root, path=[])
        return [ *map('->'.join, result) ]
        