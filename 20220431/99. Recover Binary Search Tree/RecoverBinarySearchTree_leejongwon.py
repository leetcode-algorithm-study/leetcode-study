# Definition for a binary tree node.
# class TreeNode:
#     def __init__(self, val=0, left=None, right=None):
#         self.val = val
#         self.left = left
#         self.right = right
class Solution:
    def recoverTree(self, root): # 1,3,2
        inorder_stack = []
        self.dfs(root, inorder_stack)
        # print(inorder_stack) # 3 2 1(wrong) => 1 2 3(correct)

        first, second = None, None

        for i in range(len(inorder_stack) - 1):
            if inorder_stack[i].val > inorder_stack[i+1].val and not first:
                first = inorder_stack[i] # 3
            if inorder_stack[i].val > inorder_stack[i+1].val and first:
                second = inorder_stack[i+1] # 2 1

        first.val, second.val = second.val, first.val

    def dfs(self, node, inorder_stack):
        if node:
            self.dfs(node.left, inorder_stack)
            inorder_stack.append(node)
            self.dfs(node.right, inorder_stack)
