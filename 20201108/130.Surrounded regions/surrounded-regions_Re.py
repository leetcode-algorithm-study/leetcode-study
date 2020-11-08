class Solution:
    def solve(self, board: List[List[str]]) -> None:
        """
        Do not return anything, modify board in-place instead.
        """
        if board==[]:
            return 1
        row = len(board)
        col=len(board[0])
        directions = [(-1, 0), (0, 1), (1, 0), (0, -1)]
        maps = [['O'] * (col + 2) for _ in range(row + 2)]
        visit = [[0] * (col + 2) for _ in range(row + 2)]

        for i in range(1, row + 1):
            for j in range(1, col + 1):
                maps[i][j] = board[i - 1][j - 1]
        start = [0, 0]

        def dfs(now):
            for direc in directions:
                if 0 <= now[0] + direc[0] < row + 2 and 0 <= now[1] + direc[1] < col + 2:
                    next = [now[0] + direc[0], now[1] + direc[1]]
                    if visit[next[0]][next[1]] == 0 and maps[next[0]][next[1]] == 'O':
                        visit[next[0]][next[1]] = 1
                        dfs(next)

        dfs(start)

        for i in range(1, row + 2):
            for j in range(1, col + 2):
                if visit[i][j] == 0:
                    board[i - 1][j - 1] = 'X'
                    
# Runtime: 144 ms, faster than 48.89% of Python3 online submissions for Surrounded Regions.
# Memory Usage: 17 MB, less than 5.14% of Python3 online submissions for Surrounded Regions.
