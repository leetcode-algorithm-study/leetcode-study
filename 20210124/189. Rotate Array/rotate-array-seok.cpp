class Solution {
public:
	void rotate(vector<int>& nums, int k) {
		int n = nums.size();
		while (k > n)
		{
			k = k-n;
		}
		vector<int> numsOut;
		for (int i = 0; i < n; i++)
		{
			if (i - k >= 0)
			{
				numsOut.push_back(nums[i - k]);
			}
			else
			{
				numsOut.push_back(nums[i - k + n]);
			}
		}
		nums = numsOut;
	}
};

//Runtime: 12 ms, faster than 20.89% of C++ online submissions for Rotate Array.
//Memory Usage: 10.2 MB, less than 65.47% of C++ online submissions for Rotate Array.
