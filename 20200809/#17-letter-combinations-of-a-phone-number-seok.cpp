/*
How to approach?
단순한 DFS 풀이
*/

class Solution {
public:
	string digits_global = "";
	int size = 0;
	vector<string> res;
	vector<vector<char>> DigitChar{
		{'a','b','c'},
		{'d','e','f'},
		{'g','h','i'},
		{'j','k','l'},
		{'m','n','o'},
		{'p','q','r','s'},
		{'t','u','v'},
		{'w','x','y','z'}
	};
	string digitGlobal;
	void dfs(int point, string st)
	{
		if (point >= size)
		{
			if(!count(res.begin(),res.end(),st))
			{
				res.push_back(st);
			}
			return;
		}
		int idx=digits_global[point]-'0'-2;
		point++;
		for (int i = 0; i < DigitChar[idx].size(); i++)
		{
			string NextSt = st + DigitChar[idx][i];
			dfs(point, NextSt);
		}
	}
	vector<string> letterCombinations(string digits) {
		digits_global = digits;
		vector<string> ans;
		string st = "";
		size = digits.size();
		for (int i = 0; i < digits.size(); i++)
		{
			dfs(0, st);
		}
		ans = res;
		return ans;
	}
};

/*
Runtime: 8 ms
Memory Usage: 7 MB
*/
