class Solution {
public:
	int cnt = 0;
	void dfs(string restStr)
	{
		if (restStr == "")
		{
			cnt++;
			return;
		}
		string nextStr;
		if (restStr[0] != '0')
		{
			nextStr = restStr.substr(1, restStr.size());
			dfs(nextStr);
		}

		if (restStr.size() > 1 && restStr[0] != '0')
		{
			int maxCount = (restStr[0] - '0') * 10 + (restStr[1] - '0');
			if (maxCount <= 26)
			{
				nextStr = restStr.substr(2, restStr.size());
				dfs(nextStr);
			}
		}
	}
	int numDecodings(string s) {
		dfs(s);
		return cnt;
	}
};
