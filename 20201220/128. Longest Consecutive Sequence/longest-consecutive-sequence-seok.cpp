class Solution {
public:
	int longestConsecutive(vector<int>& nums) {
        if(nums.size()==0)  return 0;
		sort(nums.begin(), nums.end());
		int maxCnt = 0;
		int prev = nums[0];
		int cnt = 1;
		for (int i = 1; i < nums.size(); i++)
		{
			if (nums[i] == prev + 1)
			{
				++cnt;
				prev = nums[i];
			}
            else if (nums[i] == prev)
            {
                continue;
            }
			else
			{
				maxCnt = max(maxCnt, cnt);
				prev = nums[i];
				cnt = 1;
			}
		}
		return cnt>maxCnt?  cnt:maxCnt;
	}
};

//Runtime: 12 ms, faster than 98.13% of C++ online submissions for Longest Consecutive Sequence.
//Memory Usage: 10.1 MB, less than 96.99% of C++ online submissions for Longest Consecutive Sequence.
