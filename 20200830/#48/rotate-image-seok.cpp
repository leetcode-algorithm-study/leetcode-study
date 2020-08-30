class Solution {
public:
	void rotate(vector<vector<int>>& matrix) {
		//Step 1.
		for (int i = 0; i < matrix.size(); i++)
		{
			for (int j = i + 1; j < matrix.size(); j++)
			{
				swap(matrix[i][j], matrix[j][i]);
			}
		}
		//Step 2.
		for (int i = 0; i < matrix.size(); i++)
		{
			reverse(begin(matrix[i]), end(matrix[i]));
		}
	}
};

/*
1  2  3   Step1  1  4  7  Step2  7  4  1
4  5  6    →     2  5  8   →     8  5  2
7  8  9          3  6  9         9  6  3
*/

/*
Runtime: 4 ms, faster than 67.52% of C++ online submissions for Rotate Image.
Memory Usage: 7.4 MB, less than 33.22% of C++ online submissions for Rotate Image.
*/
