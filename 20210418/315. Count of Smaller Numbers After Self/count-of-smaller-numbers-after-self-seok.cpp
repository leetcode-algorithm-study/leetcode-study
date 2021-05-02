class Solution {
private:
	int searchCount(vector<int> nums, int target)
	{
		sort(nums.begin(), nums.end());

		int count;

		vector<int>::iterator it = lower_bound(nums.begin(), nums.end(), target);
		if (it == nums.end())
		{
			count = nums.size();
		}
		else
		{
			if (*it >= target)
			{
				count = it - nums.begin();
			}
			else
			{
				count = it - nums.begin() + 1;
			}
		}

		return count;
	}
	int getCount(vector<int>& nums)
	{
		if (nums.size() == 1)
		{
			return 0;
		}
		int target = nums.front();
		vector<int>::iterator it = nums.begin() + 1;
		nums.erase(nums.begin(), it);
		return searchCount(nums, target);
	}
public:
	vector<int> countSmaller(vector<int>& nums) {
		vector<int> ans;
		int n = nums.size();
		while (n--)
		{
			ans.push_back(getCount(nums));
		}
		return ans;
	}
};