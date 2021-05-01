class Solution {
private:
	int rSize;
	int cSize;
	void printMatrix(vector<vector<int>>& dp)
	{
		for (int i = 0; i < dp.size(); i++)
		{
			for (int j = 0; j < dp[0].size(); j++)
			{
				cout << dp[i][j] << ' ';
			}
			cout << '\n';
		}
		cout << "=============\n";
	}
	vector<pair<int, int>> dir = { {-1,0},{1,0},{0,-1},{0,1} };
	void dfs(vector<vector<int>>& matrix, int r, int c, vector<vector<int>>& dp, int step)
	{
		if (dp[r][c] > step)
		{
			return;
		}
		else
		{
			dp[r][c] = step;
		}
		//printMatrix(dp);
		for (int i = 0; i < dir.size(); i++)
		{
			int nextR = r + dir[i].first;
			int nextC = c + dir[i].second;
			if (nextR >= 0 && nextR < matrix.size() && nextC >= 0 && nextC < matrix[0].size())
			{
				if (matrix[nextR][nextC] > matrix[r][c])
				{
					dfs(matrix, nextR, nextC, dp, step + 1);
				}
			}
		}
	}

public:
	int longestIncreasingPath(vector<vector<int>>& matrix) {
		rSize = matrix.size();
		cSize = matrix[0].size();
		vector<vector<int>> dp(rSize, vector<int>(cSize, 0));

		for (int i = 0; i < matrix.size(); i++)
		{
			for (int j = 0; j < matrix[0].size(); j++)
			{
				dfs(matrix, i, j, dp, 1);
			}
		}

		int maxStep = 0;
		for (int i = 0; i < dp.size(); i++)
		{
			for (int j = 0; j < dp[0].size(); j++)
			{
				maxStep = max(maxStep, dp[i][j]);
			}
		}

		return maxStep;
	}
};