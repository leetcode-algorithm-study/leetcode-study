class Solution {
private:
	void findStr(string s, string t, int idx, vector<string>& ansTable)
	{
		string ans = "";
		int curr = idx;
		vector<char>v;
		bool startSet = false;
		int startIdx;

		for (int i = 0; i < t.size(); i++)
		{
			v.push_back(t[i]);
		}

		while (curr < s.size() && !v.empty())
		{

			for (auto iter = v.begin(); iter != v.end();)
			{
				char i = *iter;
				if (s[curr] == i)
				{
					if (!startSet)
					{
						startSet = true;
						startIdx = curr;
					}
					iter = v.erase(iter);
					break;
				}
				else
				{
					iter++;
				}
			}
			curr++;
		}

		if (!v.empty())
		{
			return;
		}

		for (int i = startIdx; i < curr; i++)
		{
			ans += s[i];
		}

		ansTable.push_back(ans);
	}
public:
	string minWindow(string s, string t)
	{
		string ans;
		vector<string> v;
		for (int i = 0; i < s.size(); i++)
		{
			for (int j = 0; j < t.size(); j++)
			{
				if (s[i] == t[j])
				{
					findStr(s, t, i, v);
					break;
				}
			}
		}

		int minSize = INT_MAX;
		for (int i = 0; i < v.size(); i++)
		{
			if (v[i].size() < minSize)
			{
				minSize = v[i].size();
				ans = v[i];
			}
		}

		return ans;
	}
};