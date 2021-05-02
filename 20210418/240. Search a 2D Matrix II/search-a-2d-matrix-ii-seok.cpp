//Runtime: 212 ms, faster than 20.25% of C++ online submissions for Search a 2D Matrix II.
//Memory Usage: 14.9 MB, less than 58.27% of C++ online submissions for Search a 2D Matrix II.

class Solution {
private:
	bool search(vector<vector<int>>& matrix, int target, int idx) {		
		if (matrix[idx].front() > target)
		{
			return false;
		}
		else if (matrix[idx].back() < target)
		{
			return false;
		}
        
        

		vector<int>::iterator it = lower_bound(matrix[idx].begin(), matrix[idx].end(), target);

		if (it == matrix[idx].end())
		{
			return false;
		}
		else if (*it != target)
		{
			return false;
		}
		else
		{
			return true;
		}
	}
public:
	bool searchMatrix(vector<vector<int>>& matrix, int target) {
		for (int i = 0; i < matrix.size(); i++)
		{
			if (matrix[i].front() > target)
			{
				return false;
			}
			else if (search(matrix, target, i))
			{
				return true;
			}
		}
		return false;
	}
};