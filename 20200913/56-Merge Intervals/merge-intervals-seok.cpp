

class Solution {
public:
	vector<vector<int>> merge(vector<vector<int>>& intervals) {
		vector<int> tmp;
		if (intervals.size() <= 1)
		{
			return intervals;
		}
		sort(intervals.begin(), intervals.end());
		vector<vector<int>> res;
		int i = 1;
		res.push_back(intervals[0]);
		while(i<intervals.size())
		{
			if (intervals[i][0] <= res.back().back())
			{
				tmp = {intervals[i][0],intervals[i][1],res.back().front(),res.back().back()};
				sort(tmp.begin(), tmp.end());
				tmp = { tmp.front(),tmp.back() };
				res.pop_back();
				res.push_back(tmp);
			}
			else
			{
				res.push_back(intervals[i]);
			}
			i++;
		}
		return res;
	}
};

/*
Runtime: 56 ms, faster than 44.51% of C++ online submissions for Merge Intervals.
Memory Usage: 15.2 MB, less than 25.89% of C++ online submissions for Merge Intervals.
*/
