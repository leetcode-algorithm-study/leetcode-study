// 265 / 266 test cases passed.


class Solution {
private:
	void findStr(string s, unordered_map<char, int> t_map, int idx, int& minStringSize, string& ans)
	{
		int curr = idx;

		while (curr < s.size() && !t_map.empty())
		{
			if (t_map.count(s[curr]))
			{
				if (t_map[s[curr]] == 1)
				{
					t_map.erase(s[curr]);
				}
				else
				{
					t_map[s[curr]]--;
				}
			}
			curr++;
		}

		if (!t_map.empty())
		{
			return;
		}
		if ((curr - idx) < minStringSize)
		{
			minStringSize = curr - idx;
			ans = s.substr(idx, minStringSize);
		}
	}
public:
	string minWindow(string s, string t)
	{
		string ans = "";
		unordered_map<char, int> t_map;
		int minStringSize = INT_MAX;

		for (int i = 0; i < t.size(); i++)
		{
			t_map[t[i]]++;
		}
		for (int i = 0; i < s.size(); i++)
		{
			if (t_map.find(s[i]) != t_map.end())
			{
				findStr(s, t_map, i, minStringSize, ans);
			}
		}

		return ans;
	}
};
