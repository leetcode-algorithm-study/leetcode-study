class Solution:
    def numIslands(self, grid: List[List[str]]) -> int:

        def dfs(row, col, visited):
            visited[row][col] = 1
            for d in dir:
                newRow = row + d[0]
                newCol = col + d[1]
                if (0 <= newRow < len(grid) and 0 <= newCol < len(grid[0]) and visited[newRow][newCol] == 0 and
                        grid[newRow][newCol] == "1"):
                    dfs(newRow, newCol, visited)

        result = 0
        dir = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        visit = [[0 for _ in range(len(grid[0]))] for _ in range(len(grid))]

        for i in range(len(grid)):
            for j in range(len(grid[0])):
                if visit[i][j] == 0 and grid[i][j] == "1":
                    result += 1
                    dfs(i, j, visit)
        return result