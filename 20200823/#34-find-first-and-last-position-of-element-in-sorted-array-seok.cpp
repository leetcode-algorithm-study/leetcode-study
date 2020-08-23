/*
How to approach

Binary Search를 통해 target값을 확인해주었으며, 만일 target과 동일 값이 나오게 되는 상황에서 그 이전 index에 동일 값이 있는지 확인해준다.
target값과 동일한 가장 앞선 index에 mid 값이 맞추어준 후, 동일한 값이 계속 나올때 까지 mid값을 +1씩 증가시켜주며 list에 추가해주었다.
*/

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
