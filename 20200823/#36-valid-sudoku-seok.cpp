class Solution {
public:
	vector<vector<char>> boardG;
	bool checkRow(int r)
	{
		for (int i = 0; i < 9; i++)
		{
			if (boardG[r][i] == '.')	continue;
			for (int j = 0; j < 9; j++)
			{
				if (i == j) continue;
				if (boardG[r][i] == boardG[r][j])
					return false;
			}
		}
		return true;
	}
	bool checkCol(int c)
	{
		for (int i = 0; i < 9; i++)
		{
			if (boardG[i][c] == '.')	continue;
			for (int j = 0; j < 9; j++)
			{
				if (i == j)	continue;
				if (boardG[i][c] == boardG[j][c])
					return false;
			}
		}
		return true;
	}
	bool checkSub(int r, int c)
	{
		int R = 0;
		int C = 0;
		if (r != 0)
		{
			R = 3 * r;
		}
		if (c != 0)
		{
			C = 3 * c;
		}
		for (int i = R; i < R + 3; i++)
		{
			for (int j = C; j < C + 3; j++)
			{
				if (boardG[i][j] == '.')	continue;
				for (int x = R; x < R + 3; x++)
				{
					for (int y = C; y < C + 3; y++)
					{
						if (i == x && j == y)	continue;
						if (boardG[i][j] == boardG[x][y])	return false;
					}
				}
			}
		}
		return true;
	}
	bool isValidSudoku(vector<vector<char>>& board) {
		boardG = board;
		for (int i = 0; i < 9; i++)
		{
			if (!checkRow(i) || !checkCol(i))
			{
				return false;
			}
			if (i < 3)
			{
				for (int j = 0; j < 3; j++)
				{
					if (!checkSub(i, j))
					{
						return false;
					}
				}
			}
		}
		return true;

	}
};

/*
Runtime: 36 ms, faster than 80.43% of C++ online submissions for Valid Sudoku.
Memory Usage: 18.6 MB, less than 59.37% of C++ online submissions for Valid Sudoku.
*/
