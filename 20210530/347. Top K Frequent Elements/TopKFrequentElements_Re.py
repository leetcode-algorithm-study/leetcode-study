import heapq


class Solution(object):
    def kthSmallest(self, matrix, k):

        heap = []
        n = len(matrix)
        for i in range(n):
            for j in range(n):
                heapq.heappush(heap, matrix[i][j])

        res = 0
        for i in range(k):
            res = heapq.heappop(heap)
        return res

# Runtime: 300 ms, faster than 13.55% of Python online submissions for Kth Smallest Element in a Sorted Matrix.
# Memory Usage: 19.3 MB, less than 34.05% of Python online submissions for Kth Smallest Element in a Sorted Matrix.