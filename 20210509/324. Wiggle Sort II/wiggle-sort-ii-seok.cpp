//Runtime: 20 ms, faster than 42.36% of C++ online submissions for Wiggle Sort II.
//Memory Usage: 19 MB, less than 8.84% of C++ online submissions for Wiggle Sort II.

class Solution {
public:
	void wiggleSort(vector<int>& nums) {
		sort(nums.begin(), nums.end());
		int Size = nums.size();
        int halfSize;
        if(Size%2==0)
        {
            halfSize = Size / 2;
        }
        else
        {
            halfSize = (Size / 2) + 1 ;
        }
		queue<int>left;
		queue<int> right;

		for (int i = halfSize-1; i >= 0; i--)
		{
			left.push(nums[i]);
		}
		for (int i = Size-1; i >= halfSize; i--)
		{
			right.push(nums[i]);
		}

		vector<int> ans;
		while (!left.empty() || !right.empty())
		{
			if (!left.empty())
			{
				ans.push_back(left.front());
				left.pop();
			}
			if (!right.empty())
			{
				ans.push_back(right.front());
				right.pop();
			}
		}

		nums = ans;
		return;
	}
};
