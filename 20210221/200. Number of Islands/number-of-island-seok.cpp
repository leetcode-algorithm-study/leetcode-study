class Solution {
private:
	int dirR[4] = { 0, 0, 1, -1 };
	int dirC[4] = { 1, -1, 0, 0 };
	void giveNumber(vector<vector<char>> grid, vector<vector<int>>& numgrid, int r, int c, int mark)
	{
		if (numgrid[r][c] != 0)
		{
			return;
		}

		numgrid[r][c] = mark;


		for (int i = 0; i < 4; i++)
		{
			int nextR = r + dirR[i];
			int nextC = c + dirC[i];
			if (nextR >= 0 && nextR < grid.size() && nextC >= 0 && nextC < grid[0].size())
			{
				if (grid[nextR][nextC] == '1' && numgrid[nextR][nextC] == 0)
				{
					giveNumber(grid, numgrid, nextR, nextC, mark);
				}
			}
		}
	}
public:
	int numIslands(vector<vector<char>>& grid) {
		int rSize = grid.size();
		int cSize = grid[0].size();
		vector<vector<int>>numgrid(rSize, vector<int>(cSize, 0));
		int mark = 0;
		for (int i = 0; i < grid.size(); i++)
		{
			for (int j = 0; j < grid[0].size(); j++)
			{
				if (grid[i][j] == '1' && numgrid[i][j] == 0)
				{
					giveNumber(grid, numgrid, i, j, ++mark);
				}

			}
		}

		return mark;
	}
};

//48 / 48 test cases passed, but took too long.