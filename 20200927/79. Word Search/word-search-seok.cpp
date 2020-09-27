class Solution {
public:
	vector<vector<char>> boardGlobal;
	bool isTrue = false;
	int dir[4][4] = { {-1,0},{0,-1},{0,1},{1,0} };
	void dfs(int r, int c, string str, int currIdx, vector<vector<bool>> visit)
	{
		if (currIdx>=str.size()||isTrue==true)
		{
			isTrue = true;
			return;
		}

		visit[r][c] = true;

		for (int i = 0; i < 4; i++)
		{
			int nextR = r + dir[i][0];
			int nextC = c + dir[i][1];
			if (nextR >= 0 && nextC >= 0 && nextR < boardGlobal.size() && nextC < boardGlobal[0].size())
			{
				if (visit[nextR][nextC])	continue;
				if (boardGlobal[nextR][nextC] == str[currIdx])
				{
					dfs(nextR, nextC, str,currIdx+1,visit);
				}
			}
		}
	}

	bool exist(vector<vector<char>>& board, string word) {
		isTrue = false;
		boardGlobal = board;
		vector<vector<bool>> visit(200, vector<bool>(200, 0));
		if (word == "")	return true;
		for (auto i = 0; i < board.size(); i++)
		{
			for (auto j = 0; j < board[0].size(); j++)
			{
				if (boardGlobal[i][j] == word[0])
				{
					dfs(i, j, word,1,visit);
				}
				if (isTrue)	return true;
			}
		}
		return isTrue;
	}
};
