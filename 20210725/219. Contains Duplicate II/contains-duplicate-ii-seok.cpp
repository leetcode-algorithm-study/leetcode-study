class Solution {
public:
	bool containsNearbyDuplicate(vector<int>& nums, int k) {
		int n = nums.size();
		int left = 0;
		int right = left + k;
		set<int> s;
		for (int i = 0; i<=right && i<n; i++)
		{
			if (s.find(nums[i]) != s.end())
			{
				return true;
			}
			else
			{
				s.insert(nums[i]);
			}
		}

		s.erase(nums[left]);
		left++;
		right++;

		while (right<n)
		{
			if (s.find(nums[right]) != s.end())
			{
				return true;
			}
			else
			{                
				s.insert(nums[right]);
				s.erase(nums[left]);
				left++;
				right++;
			}
		}

		return false;
	}
};
