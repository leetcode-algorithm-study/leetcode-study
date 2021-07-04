//TLE

class Solution {
private:
	static bool comp(vector<int>& a, vector<int>& b)
	{
		if (a[1] == b[1])
		{
			return (a[0] < b[0]);
		}
		else
		{
			return (a[1] < b[1]);
		}
	}
public:
	int maxEvents(vector<vector<int>>& events) {
		int ans = 0;
		set<int> s;
		sort(events.begin(), events.end(), comp);
		int endPoint = events.back()[1];
		for (int i = 0; i <= endPoint; i++)
		{
			s.insert(i);
		}

		for (const auto & event:events)
		{
			int start = event[0];
			int end = event[1];
			auto it = lower_bound(s.begin(), s.end(), start);
			if (it == s.end() || *it>end)
			{
                continue;
			}
            else
            {
                ans++;
				s.erase(it);
            }
		}

		return ans;
	}
};
