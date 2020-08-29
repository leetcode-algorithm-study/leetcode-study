class Solution {
public:
	void rotate(vector<vector<int>>& matrix) {
		for (int i = 0; i < matrix.size(); i++)
		{
			for (int j = i + 1; j < matrix.size(); j++)
			{
				swap(matrix[i][j], matrix[j][i]);
			}
		}
		for (int i = 0; i < matrix.size(); i++)
		{
			reverse(begin(matrix[i]), end(matrix[i]));
		}
	}
};
/*
Runtime: 4 ms
Memory Usage: 7.1 MB
*/
