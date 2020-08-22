class Solution {
public:
	vector<int> searchRange(vector<int>& nums, int target) {
		vector<int> res;
		vector<int> ans;
		int left = 0;
		int right = nums.size() - 1;
		int mid = (left + right) / 2;
		bool isMidCalculated = false;
		bool isPrevChecked = false;
		while (left <= right)
		{
			if (!isMidCalculated)
			{
				mid = (left + right) / 2;
			}
			else
			{
				isMidCalculated = false;
			}

			if (nums[mid] == target)
			{
				int nextMid = mid + 1;
				int prevMid = mid - 1;
				if (prevMid >= 0)
				{
					if (nums[prevMid] == target && !isPrevChecked)
					{
						mid = prevMid;
						isMidCalculated = true;
						continue;
					}
				}
				isPrevChecked = true;
				res.push_back(mid);
				if (nextMid < nums.size())
				{
					if (nums[nextMid] == target)
					{
						mid = nextMid;
						isMidCalculated = true;
						continue;
					}
					else
					{
						break;
					}
				}
				else
				{
					break;
				}

				// to be added
			}
			else if (target < nums[mid])
			{
				right = mid - 1;
			}
			else
			{
				left = mid + 1;
			}
		}
		if (res.empty())
		{
			res.push_back(-1);
		}
		sort(res.begin(), res.end());
		ans.push_back(res.front());
		ans.push_back(res.back());

		return ans;
	}
};
/*
Runtime: 48 ms, faster than 5.62% of C++ online submissions for Find First and Last Position of Element in Sorted Array.
Memory Usage: 14 MB, less than 16.47% of C++ online submissions for Find First and Last Position of Element in Sorted Array.
*/
