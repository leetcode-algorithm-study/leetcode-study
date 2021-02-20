class Solution {
public:
	int findPeakElement(vector<int>& nums) {
		int peak_idx = nums.size()-1;
		int left = 0;
		int right = left + 1;
		while (right<nums.size())
		{
			if (nums[left] > nums[right])
			{
				peak_idx = left;
				break;
			}
			++left;
			++right;
		}
		return peak_idx;
	}
};

//Runtime: 0 ms, faster than 100.00% of C++ online submissions for Find Peak Element.
//Memory Usage: 8.9 MB, less than 96.67% of C++ online submissions for Find Peak Element.
