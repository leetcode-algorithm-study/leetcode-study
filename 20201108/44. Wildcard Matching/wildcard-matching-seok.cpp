/* memoization, but TLE
Last executed input:
"aaabbaabbbbbaabbbabbbaaabbbaaaabaaabaaaabbbbaabbbabaababababbaabbaabbbbaabaabbaabbaaaabbbbaaaabbaaabbaabbaaabababbabaaabbaabababbbaabaaaaaabababbaababaababaaabbbbaaaaaaaaaaaabbababaababaabababaabaabbaaba"
"*bb*bb*****b******a**ab*bba****ba*a*a*aa*abb*baa*a**ba**b*ba**b**ba*ab**bb***a*ba*ab****ab**aab*bb*b"
*/
class Solution {
public:
	bool isMatchWord(vector<vector<int>>& dp, string s, string p, int i, int j)
	{
		if (i == s.size() && j == p.size())
		{
			return true;
		}

		if (i == s.size())
		{
			if (p[j] == '*')
			{
				return isMatchWord(dp, s, p, i, j + 1);
			}
			else
			{
				return false;
			}
		}

		if (j == p.size())
		{
			return false;
		}

		if (dp[i][j] != -1)
		{
			return dp[i][j];
		}

		if (s[i] == p[j] || p[j] == '?')
		{
			return dp[i][j] = isMatchWord(dp, s, p, i + 1, j + 1);
		}
		if (p[j] == '*')
		{
			if (j == p.size() - 1)
			{
				return dp[i][j] = true;
			}
			else if (i == s.size() - 1)
			{
				return dp[i][j] = isMatchWord(dp, s, p, i, j + 1);
			}
			else
			{
				return dp[i][j] = (isMatchWord(dp, s, p, i + 1, j) || isMatchWord(dp, s, p, i, j + 1));
			}
		}
		return dp[i][j] = false;
	}
	bool isMatch(string s, string p) {

		vector<vector<int>> dp(s.size(), vector<int>(p.size(), -1));

		return isMatchWord(dp, s, p, 0, 0);
	}
};
