//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Game of Life.
//Memory Usage: 7 MB, less than 50.57% of C++ online submissions for Game of Life.

class Solution {
private:
	vector<pair<int, int>> dir = vector<pair<int, int>>{ { -1, -1 }, { -1, 0 }, { -1, 1 }, { 0, -1 }, { 0, 1 }, { 1, -1 }, { 1, 0 }, { 1, 1 } };
	void print_matrix(vector<vector<int>>& board)
	{
		for (int i = 0; i < board.size(); i++)
		{
			for (int j = 0; j < board[0].size(); j++)
			{
				cout << board[i][j] << ' ';
			}
			cout << '\n';
		}
		cout << "===================\n";
	}
	int getCountOfLive(vector<vector<int>>& board, vector<vector<int>>& origin, int r, int c)
	{
		int liveCnt = 0;
		for (int i = 0; i < dir.size(); i++)
		{
			int nextR = r + dir[i].first;
			int nextC = c + dir[i].second;
			if (nextR >= 0 && nextR < board.size() && nextC >= 0 && nextC < board[0].size())
			{
				if (origin[nextR][nextC] == 1)
				{
					++liveCnt;
				}
			}
		}
		return liveCnt;
	}
public:
	void gameOfLife(vector<vector<int>>& board) {
		vector<vector<int>>origin = board;
		for (int i = 0; i < board.size(); i++)
		{
			for (int j = 0; j < board[0].size(); j++)
			{
				int cnt = getCountOfLive(board, origin, i, j);
				if (board[i][j])
				{
					if (cnt < 2 || cnt>3)
					{
						board[i][j] = 0;
					}
				}
				else if (cnt == 3)
				{
					board[i][j] = 1;
				}
				print_matrix(board);
			}

		}
	}
};
