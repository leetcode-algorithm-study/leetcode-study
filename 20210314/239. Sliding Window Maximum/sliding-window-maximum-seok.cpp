//Runtime: 256 ms
//Memory Usage: 131.2 MB

class Solution {
private:
	int findMaxNum(vector<int>& nums, priority_queue<pair<int,int>>& pq, int begin, int end)
	{
		int maxNum = INT_MIN;
		for (int i = begin; i < end; i++)
		{
			pq.push(make_pair(nums[i],i));
		}
		return pq.top().first;
	}
public:
	vector<int> maxSlidingWindow(vector<int>& nums, int k) {

		vector<int> maxNums;
		priority_queue<pair<int,int>> pq;

		int maxNum = findMaxNum(nums, pq, 0, k);
		maxNums.push_back(pq.top().first);

		int begin = 1;
		int end = k + 1;

		while (end <= nums.size())
		{
			pq.push({ nums[end - 1], end - 1 });

			while (pq.top().second<begin)
			{
				pq.pop();
			}

			maxNums.push_back(pq.top().first);
			begin++;
			end++;
		}

		return maxNums;
	}
};
