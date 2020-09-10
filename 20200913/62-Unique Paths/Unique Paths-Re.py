class Solution:
    def uniquePaths(self, m: int, n: int) -> int:
        maps=[[1 for i in range(m)] for i in range(n)]
        for i in range(1, n):
            for j in range(1, m):
                maps[i][j]=maps[i-1][j]+maps[i][j-1]
        return maps[n-1][m-1]
# Runtime: 24 ms, faster than 96.02% of Python3 online submissions for Unique Paths.
# Memory Usage: 13.8 MB, less than 57.75% of Python3 online submissions for Unique Paths.
