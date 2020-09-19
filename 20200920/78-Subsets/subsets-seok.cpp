/*
How to approach?
using DFS
*/

class Solution {
public:
	vector<int> numsGlobal;
	vector<vector<int>> ans;
	void dfs(int idx, vector<int>& inputV)
	{
		ans.push_back(inputV);


		for (int i = idx; i < numsGlobal.size(); i++)
		{
			inputV.push_back(numsGlobal[i]);
			dfs(i + 1, inputV);
			inputV.pop_back();
		}
	}
	vector<vector<int>> subsets(vector<int>& nums) {
		numsGlobal = nums;
		vector<int> tmp;
		dfs(0, tmp);

		return ans;
	}
};

/*
Runtime: 4 ms, faster than 66.40% of C++ online submissions for Subsets.
Memory Usage: 7.2 MB, less than 72.44% of C++ online submissions for Subsets.
*/
