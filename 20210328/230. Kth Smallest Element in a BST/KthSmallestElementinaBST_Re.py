class Solution(object):
    def kthSmallest(self, root, k):

        if not root:
            return

        result = [root.val]

        def dfs(addr):
            if addr.left != None:
                result.append(addr.left.val)
                dfs(addr.left)
            if addr.right != None:
                result.append(addr.right.val)
                dfs(addr.right)

        dfs(root)
        result.sort()
        return result[k - 1]

# Runtime: 44 ms, faster than 63.57% of Python online submissions for Kth Smallest Element in a BST.
# Memory Usage: 21.2 MB, less than 37.90% of Python online submissions for Kth Smallest Element in a BST.