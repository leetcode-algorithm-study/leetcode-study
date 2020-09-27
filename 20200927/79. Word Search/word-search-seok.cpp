class Solution {
public:
	vector<vector<char>> boardGlobal;
	bool isTrue = false;
	int dir[4][4] = { {-1,0},{0,-1},{0,1},{1,0} };
	void dfs(int r, int c, string str, int currIdx)
	{
		if (currIdx >= str.size() || isTrue == true)
		{
			isTrue = true;
			return;
		}

		for (int i = 0; i < 4; i++)
		{
			int nextR = r + dir[i][0];
			int nextC = c + dir[i][1];
			if (nextR >= 0 && nextC >= 0 && nextR < boardGlobal.size() && nextC < boardGlobal[0].size())
			{
				if (boardGlobal[nextR][nextC] == str[currIdx])
				{
					char prev = boardGlobal[nextR][nextC];
					boardGlobal[nextR][nextC] = '-';
					dfs(nextR, nextC, str, currIdx + 1);
					boardGlobal[nextR][nextC] = prev;
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
					char prev = boardGlobal[i][j];
					boardGlobal[i][j] = '-';
					dfs(i, j, word, 1);
					boardGlobal[i][j] = prev;
				}
				if (isTrue)	return true;
			}
		}
		return isTrue;
	}
};

/*
Runtime: 88 ms, faster than 61.06% of C++ online submissions for Word Search.
Memory Usage: 23.8 MB, less than 49.19% of C++ online submissions for Word Search.
*/
