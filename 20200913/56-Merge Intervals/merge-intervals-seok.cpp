/*
How to approach?
1. Sort input
2. Push the very first input index to the answer list
3. Compare the following index with the last index of the answer list.
3-1. If the following is within the boundary of the last index of the answer, pop the answer list, and then push the max and min among the two different lists.
3-2. If not, just push the following.
*/

class Solution {
public:
	vector<vector<int>> merge(vector<vector<int>>& intervals) {
		vector<int> tmp;
		vector<vector<int>> res;
		int i = 1;
		// If the number of intervals is just one, return itself.
		if (intervals.size() <= 1)
		{
			return intervals;
		}
		// Step 1. Sort the list.
		sort(intervals.begin(), intervals.end());
		// Step 2. Push the first index to the answer list.
		res.push_back(intervals[0]);
		while(i<intervals.size())
		{
			// Step 3-1. If the smaller value of the current index in the input is smaller than the bigger value of the last index in the answer,
			// merge them together and make the temporary list including the maximum and the minimum in order to push to the answer.
			if (intervals[i][0] <= res.back().back())
			{
				tmp = {intervals[i][0],intervals[i][1],res.back().front(),res.back().back()};
				sort(tmp.begin(), tmp.end());
				tmp = { tmp.front(),tmp.back() };
				res.pop_back();
				res.push_back(tmp);
			}
			// Step 3-2. Unless so, push the current index in the input to the answer.
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
