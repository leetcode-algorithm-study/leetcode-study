class Solution {
public:
	vector<int> mem;
	int recur(string str, int pos)
	{
		if (pos >= str.size())
		{
			if (pos == str.size())
			{
				return 1;
			}
			return 0;
		}

		if (mem[pos] != -1)
		{
			return mem[pos];
		}

		int cnt = 0;

		if (str[pos] != '0')
		{

			cnt += recur(str, pos + 1);

			if (pos + 1 < str.size())
			{
				int maxCount = (str[pos] - '0') * 10 + (str[pos + 1] - '0');
				if (maxCount <= 26 && maxCount > 9)
				{
					cnt += recur(str, pos + 2);
				}
			}
		}
		return mem[pos] = cnt;
	}
	int numDecodings(string s) {
		mem = vector<int>(s.size(), -1);
		return recur(s, 0);
	}
};

/*
Runtime: 8 ms, faster than 18.96% of C++ online submissions for Decode Ways.
Memory Usage: 14.5 MB, less than 8.09% of C++ online submissions for Decode Ways.
*/
