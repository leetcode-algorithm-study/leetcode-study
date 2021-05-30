//Runtime: 16 ms, faster than 63.05 % of C++ online submissions for Top K Frequent Elements.
//Memory Usage : 13.8 MB, less than 38.53 % of C++ online submissions for Top K Frequent Elements.

class Solution {
public:
	vector<int> topKFrequent(vector<int>& nums, int k) {
		vector<int> ans;
		unordered_map<int, int> m;
		for (auto i : nums)
		{
			if (m.find(i) == m.end())
			{
				m.insert({ i,0 });
			}
			m[i]++;
		}
		priority_queue<pair<int, int>> pq;
		for (auto it = m.begin(); it != m.end(); it++)
		{
			pq.push({ it->second, it->first });
		}

		while (k--)
		{
			ans.push_back(pq.top().second);
			pq.pop();
		}
		return ans;
	}
};