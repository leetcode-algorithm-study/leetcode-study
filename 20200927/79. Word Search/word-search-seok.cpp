class Solution {
public:
	vector<vector<char>> boardGlobal;
	bool isTrue = false;
	int dir[4][4] = { {-1,0},{0,-1},{0,1},{1,0} };
	void dfs(int r, int c, string str, vector<vector<bool>> visit)
	{
		if (str == ""||isTrue==true)
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
				if (boardGlobal[nextR][nextC] == str[0])
				{
					string nextStr;
					for (auto j = str.begin() + 1; j != str.end(); j++)
					{
						auto iter = *j;
						nextStr += iter;
					}
					dfs(nextR, nextC, nextStr,visit);
				}
			}
		}
	}
	bool exist(vector<vector<char>>& board, string word) {
		isTrue = false;
		boardGlobal = board;
		if (word == "")	return true;
		for (auto i = 0; i < board.size(); i++)
		{
			for (auto j = 0; j < board[0].size(); j++)
			{
				if (boardGlobal[i][j] == word[0])
				{
					vector<vector<bool>> visit(200, vector<bool>(200, 0));
					string nextStr;
					for (auto j = word.begin() + 1; j != word.end(); j++)
					{
						auto iter = *j;
						nextStr += iter;
					}
					dfs(i, j, nextStr,visit);
				}
				if (isTrue)	return true;
			}
		}
		return isTrue;
	}
};
