# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
res=[]
first=0
rootTwo=0
from copy import deepcopy
class Solution:
    def isValidBST(self, root: TreeNode) -> bool:
        global res
        global first
        global rootTwo
        if first==0:
            first=1
            rootTwo=deepcopy(root)
        if root==None:
            return 1
        if root.left!=None:
            if root.val>root.left.val:
                self.isValidBST(root.left)
            else:
                res.append(1)
                return 0
        if root.right!=None:
            if root.val<root.right.val:
                self.isValidBST(root.right)
            else:
                res.append(1)
                return 0
        if rootTwo.val==root.val:
            if len(res)==0:
                first=0
                res=[]
                return 1
            else:
                first=0
                res=[]
                return 0
            
