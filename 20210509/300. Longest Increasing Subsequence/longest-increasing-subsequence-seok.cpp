// Solution #1 TLE
class Solution {
private:
	void dfs(vector<int>& nums, vector<int>& dp, int idx, int prev, int step, int& maxStep) {
		if (nums[idx] <= prev)
		{
			return;
		}
		else if (dp[idx] >= step)
		{
			return;
		}
		dp[idx] = step;
		maxStep = max(maxStep, step);

		for (int i = idx + 1; i < nums.size(); i++)
		{
			if (nums[i] > nums[idx])
			{
				dfs(nums, dp, i, nums[idx], step + 1, maxStep);
			}
		}
	}
public:
	int lengthOfLIS(vector<int>& nums) {
		int Size = nums.size();
		int maxStep = 0;
		vector<int>dp(Size, 0);
		for (int i = 0; i < Size; i++)
		{
			if (maxStep >= Size - i)
			{
				break;
			}
			if (dp[i] == 0)
			{
				dfs(nums, dp, i, INT_MIN, 1, maxStep);
			}
		}

		return maxStep;
	}
};



// Solution #2 DP
//Runtime: 272 ms, faster than 27.95 % of C++ online submissions for Longest Increasing Subsequence.
//Memory Usage : 10.4 MB, less than 60.85 % of C++ online submissions for Longest Increasing Subsequence.
class Solution {
public:
    int lengthOfLIS(vector<int>& nums) {
        int Size = nums.size();
        vector<int> dp(Size, 1);
        for (int i = 0; i < Size; i++)
        {
            for (int j = 0; j < i; j++)
            {
                if (nums[i] > nums[j])
                {
                    dp[i] = max(dp[i], dp[j] + 1);
                }
            }
            //cout<<"dp["<<i<<"] = "<<dp[i]<<'\n';
        }
        auto maxIter = max_element(dp.begin(), dp.end());
        return *maxIter;
    }
};