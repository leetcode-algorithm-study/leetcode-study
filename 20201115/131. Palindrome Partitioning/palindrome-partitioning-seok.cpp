class Solution {
public:
	bool isPalindrom(string str)
	{
		int Size = str.size();
		for (int i = 0; i < Size / 2; i++)
		{
			if (str[i] == str[Size - 1 - i])
			{
				continue;
			}
			else
			{
				return false;
			}
		}
		return true;
	}
	void dfs(string s, int idx, vector<string>& v, vector<vector<string>>& ans)
	{
		if (idx >= (signed)s.size())
		{
			ans.push_back(v);
			return;
		}

		string str = "";
		for (int i = idx; i < s.size(); i++)
		{
			str += s[i];
			if (isPalindrom(str))
			{
				v.push_back(str);
				dfs(s, i + 1, v, ans);
				v.pop_back();
			}
		}
	}
	vector<vector<string>> partition(string s) {
		vector<vector<string>>res;
		vector<string> v;
		dfs(s, 0, v, res);
		return res;
	}
};
/*
Runtime: 28 ms
Memory Usage: 16.7 MB
*/