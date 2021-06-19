//Runtime: 64 ms, faster than 28.57% of C++ online submissions for Max Consecutive Ones III.
//Memory Usage: 56.9 MB, less than 6.21% of C++ online submissions for Max Consecutive Ones III.
  
class Solution {
public:
	int longestOnes(vector<int>& nums, int k) {
		int n = nums.size();
		queue<int>q;
		int left = 0;
		int right = 0;
		int maxLength = 0;
		
		while (right < n)
		{
			if (nums[right] == 1)
			{
				right++;
			}
			else
			{
				if (k > 0)
				{
					q.push(right);
					right++;
					k--;
				}
				else
				{
					if (!q.empty())
					{
						int idx = q.front();
						q.pop();
						left = idx + 1;

						q.push(right);
						right++;
					}
					else
					{
						left++;
						right = left;
					}
				}
			}

			maxLength = max(maxLength, right - left);
		}



		return maxLength;
	}
};
