class Solution {
public:
	int minSubArrayLen(int target, vector<int>& nums) {
		int n = nums.size();
		int left = 0;
		int right = left;
		int sum = 0;
		int ans = INT_MAX;
			for (int right = 0; right < n; right++)
			{
				sum += nums[right];
				while (sum >= target)
				{
					ans = min(ans, right - left + 1);
                    sum-=nums[left++];
				}
            }

		return ans!=INT_MAX? ans:0;
	}
};
