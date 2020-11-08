class Solution {
public:
	bool isMatchWord(string s, string p, int i, int j)
	{
		if (s[i] == '\0' && p[j] == '\0')
		{
			return true;
		}
		if (s[i] == p[j] || p[j] == '?')
		{
			return isMatchWord(s, p, i + 1, j + 1);
		}
		if (p[j] == '*')
		{
			if (j == p.size() - 1)
			{
				return true;
			}
			else if (i == s.size() - 1)
			{
				return isMatchWord(s, p, i, j + 1);
			}
			else
			{
				return isMatchWord(s, p, i + 1, j) || isMatchWord(s, p, i, j + 1);
			}
		}
		return false;
	}
	bool isMatch(string s, string p) {
		return isMatchWord(s, p, 0, 0);
	}
};