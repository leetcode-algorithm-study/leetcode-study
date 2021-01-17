class Solution {
private:
	vector<string> merge(string s, vector<string> restVec)
	{
		vector<string> res;
		for (auto i : restVec)
		{
			if (i.size() > 0)
			{
				res.push_back(s+" " + i);
			}
			else
			{
				res.push_back(s);
			}
		}
		return res;
	}
	
	vector<string> restVec(string s, unordered_set<string>& wordSet, unordered_map<string, vector<string>>& mem)
	{
		vector<string> res;

		if (s.empty())
		{
			return res;
		}

		if(wordSet.count(s) > 0)
		{
			res.push_back(s);
		}

		if (mem.count(s) > 0)
		{
			return mem[s];
		}

		for (int len = 1; len <= s.length(); len++)
		{
			if (wordSet.count(s.substr(0, len)))
			{
				auto tmp=merge(s.substr(0,len),restVec(s.substr(len), wordSet, mem));
				res.insert(res.end(), tmp.begin(), tmp.end());
			}
		}

		mem[s] = res;
		return res;
	}
public:
	vector<string> wordBreak(string s, vector<string>& wordDict) {
		vector<string> ans;
		if (s.empty())
			return ans;

		unordered_set<string> wordSet;


		for (int i = 0; i < wordDict.size(); i++)
		{
			wordSet.insert(wordDict[i]);
		}

		if (s.length() == 1)
		{
			if (wordSet.find(s) != wordSet.end())
			{
				ans.push_back(s);
			}
			return ans;
		}

		unordered_map<string, vector<string>> mem;
		return restVec(s, wordSet, mem);
	}
};

//Runtime: 8 ms, faster than 95.65% of C++ online submissions for Word Break II.
//Memory Usage: 14.1 MB, less than 27.62% of C++ online submissions for Word Break II.
