"""
# Definition for a Node.
class Node:
    def __init__(self, val = 0, neighbors = None):
        self.val = val
        self.neighbors = neighbors if neighbors is not None else []
"""

class Solution:
    def cloneGraph(self, node: 'Node') -> 'Node':
        cache = {}
        
        #dfs
        def clone(node):
            if node in cache:
                return cache[node]
            
            copied = Node(node.val)
            cache[node] = copied
            
            # 2->1(cached)->3->2(cached)->4->1(cached)->3(cached)->4(cached)
            for neighbor in node.neighbors:
                # print(f"node {node.val}'s neighbor: {neighbor.val}")
                copied.neighbors.append(clone(neighbor))
            return copied
        
        return clone(node) if node else None