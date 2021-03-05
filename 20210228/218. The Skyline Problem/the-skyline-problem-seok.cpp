//Runtime: 32 ms, faster than 83.81% of C++ online submissions for The Skyline Problem.
//Memory Usage: 15.3 MB, less than 60.22% of C++ online submissions for The Skyline Problem.
	
class Solution {
public:
	vector<vector<int>> getSkyline(vector<vector<int>>& buildings) {

		vector<vector<int>> skyLine;

		vector<pair<int, int>> v;
		
		for (auto i: buildings)
		{
			v.push_back({ i[0], -i[2] });
			v.push_back({ i[1], i[2] });
		}

		sort(v.begin(), v.end());

		multiset<int>m = {0};

		int prev = 0;
		int curr = 0;

		for (auto i : v)
		{
			if (i.second < 0)
			{
				m.insert(-i.second);
			}
			else
			{
				m.erase(m.find(i.second));
			}
			curr = *m.rbegin();
			if (prev != curr)
			{
                skyLine.push_back({ i.first, curr });
				prev = curr;
				
			}
		}

		return skyLine;
	}
};
