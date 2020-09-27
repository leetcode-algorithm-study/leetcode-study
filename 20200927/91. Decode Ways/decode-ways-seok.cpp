class Solution {
public:
	int cnt = 0;
	void dfs(string str, int pos)
	{
		if (pos >= str.size())
		{
			cnt++;
			return;
		}
		string nextStr;
		if (str[pos] != '0')
		{
			dfs(str,pos+1);

			if (pos + 1 < str.size())
			{
				int maxCount = (str[pos] - '0') * 10 + (str[pos+1] - '0');
				if (maxCount <= 26)
				{
					dfs(str,pos+2);
				}
			}
		}

	}
	int numDecodings(string s) {
		dfs(s,0);
		return cnt;
	}
};
