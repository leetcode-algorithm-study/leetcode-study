#include <iostream>
#include <vector>
#include <algorithm>

using namespace std;

class Solution {
private:
	void makeMoney(vector<int>& nums, int idx, int sum, int &maxSum) {
		if (idx >= nums.size())
		{
			maxSum = max(maxSum,sum);
			return;
		}

		sum += nums[idx];

		makeMoney(nums, idx + 2, sum, maxSum);
		makeMoney(nums, idx + 3, sum, maxSum);
	}
public:
	int rob(vector<int>& nums) {
		int maxSum = INT_MIN;

		makeMoney(nums, 0, 0, maxSum);
		makeMoney(nums, 1, 0, maxSum);
		
		return maxSum;
	}
};

int main()
{
	vector<int> nums = {1,2,3,1};
	Solution s;
	cout<<s.rob(nums);
	return 0;
}