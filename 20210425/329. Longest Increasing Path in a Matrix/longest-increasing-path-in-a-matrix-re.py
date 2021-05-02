dir = [[1, 0], [-1, 0], [0, 1], [0, -1]]


class Solution(object):
    def longestIncreasingPath(self, matrix):
        def dfs(row, col, n, rr, cc):
            now = n
            for d in dir:
                newR = row + d[0]
                newC = col + d[1]
                if 0 <= newR < rr and 0 <= newC < cc:
                    if matrix[newR][newC] > matrix[row][col]:
                        n = max(dfs(newR, newC, now + 1, rr, cc), n)
            return n

        maxi = -1
        r = len(matrix)
        c = len(matrix[0])
        for i in range(r):
            for j in range(c):
                value = dfs(i, j, 1, r, c)
                if maxi < value:
                    maxi = value
        return maxi

# time limit 135/138