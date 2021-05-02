class Solution(object):
    def gameOfLife(self, board):
        """
        :type board: List[List[int]]
        :rtype: None Do not return anything, modify board in-place instead.
        """

        dir = [[1, 0], [1, 1], [1, -1], [0, 1], [0, -1], [-1, 0], [-1, -1], [-1, 1]]

        row = len(board)
        col = len(board[0])

        check = [[0 for _ in range(col)] for _ in range(row)]

        for i in range(row):
            for j in range(col):
                for d in dir:
                    newR = i + d[0]
                    newC = j + d[1]

                    if 0 <= newR < row and 0 <= newC < col:
                        if board[newR][newC] == 1:
                            check[i][j] += 1

        for i in range(row):
            for j in range(col):
                if check[i][j] < 2 and board[i][j] == 1:
                    board[i][j] = 0
                elif 2 <= check[i][j] <= 3 and board[i][j] == 1:
                    board[i][j] = 1
                elif 3 < check[i][j] and board[i][j] == 1:
                    board[i][j] = 0
                elif check[i][j] == 3 and board[i][j] == 0:
                    board[i][j] = 1

# Runtime: 20 ms, faster than 67.92% of Python online submissions for Game of Life.
# Memory Usage: 13.5 MB, less than 42.64% of Python online submissions for Game of Life.