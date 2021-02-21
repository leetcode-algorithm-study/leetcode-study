class Solution {
public:
	int rob(vector<int>& nums) {
		int size = nums.size();
        if (size==0)    return 0;
        if (size==1)    return nums[0];
		vector<int> dp(size);
		dp[0] = nums[0];
		dp[1] = max(nums[0], nums[1]);
		for (int i = 0; i+2 < nums.size(); i++)
		{
			dp[i + 2] = max(dp[i] + nums[i + 2], dp[i+1]);
		}

		return dp[size - 1];
	}
};
