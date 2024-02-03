# Definition for a binary tree node.
# class TreeNode(object):
#     def __init__(self, x):
#         self.val = x
#         self.left = None
#         self.right = None

class Codec:
    def serialize(self, root):
        """Encodes a tree to a single string.
        
        :type root: TreeNode
        :rtype: str
        """

        def dfs(node):
            if node is None:
                return ["#"]
            return [str(node.val)] + dfs(node.left) + dfs(node.right)
        return " ".join(dfs(root))
        

    def deserialize(self, data):
        """Decodes your encoded data to tree.
        
        :type data: str
        :rtype: TreeNode
        """
        def dfs(nodes):
            val = next(nodes) #remove element
            if val == "#":
                return None
            node = TreeNode(val)
            node.left = dfs(nodes)
            node.right = dfs(nodes)
            return node

        return dfs(iter(data.split(" ")))
        

# Your Codec object will be instantiated and called as such:
# ser = Codec()
# deser = Codec()
# ans = deser.deserialize(ser.serialize(root))