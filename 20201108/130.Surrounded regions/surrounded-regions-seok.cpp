
class Solution {
public:
	void dfs(vector<vector<char>>& board,int r,int c)
	{
		if (r >= 0 && c >= 0 && r < board.size() && c < board[0].size())
		{
			if (board[r][c] == 'O')
			{
				board[r][c] = 'A';
				dfs(board, r - 1, c);
				dfs(board, r + 1, c);
				dfs(board, r, c + 1);
				dfs(board, r, c - 1);
			}
		}
	}
	void solve(vector<vector<char>>& board) {
		for (int i = 0; i < board.size(); i++)
		{
			for (int j = 0; j < board[0].size(); j++)
			{
				if (i == 0 || j == 0 || i == board.size() - 1 || j == board[0].size() - 1)
				{
					dfs(board,i,j);
				}
			}
		}

		for (int i = 0; i < board.size(); i++)
		{
			for (int j = 0; j < board[0].size(); j++)
			{
				if (board[i][j] == 'O')
				{
					board[i][j] = 'X';
				}
				else if (board[i][j] == 'A')
				{
					board[i][j] = 'O';
				}
			}
		}
	}
};

/*
Runtime: 24 ms, faster than 59.64% of C++ online submissions for Surrounded Regions.
Memory Usage: 10.4 MB, less than 5.18% of C++ online submissions for Surrounded Regions.
*/