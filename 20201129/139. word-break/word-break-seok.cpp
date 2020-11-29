
class Solution {
public:
	bool isRestWordValid(string s, vector<string>& wordDict, unordered_set<string>& wordSet, unordered_map<string, bool>& mem)
	{
		if (s.empty() || wordSet.count(s) > 0)
		{
			return true;
		}

		if (mem.count(s) > 0)
		{
			return mem[s];
		}

		for (int len = 1; len <= s.length(); len++)
		{
			if (wordSet.count(s.substr(0, len)))
			{
				if (isRestWordValid(s.substr(len), wordDict, wordSet, mem))
				{
					mem[s] = true;
					return true;
				}
			}
		}

		mem[s] = false;
		return false;
	}

	bool wordBreak(string s, vector<string>& wordDict) {
		if (s.empty())
			return true;

		unordered_set<string> wordSet;


		for (int i = 0; i < wordDict.size(); i++)
		{
			wordSet.insert(wordDict[i]);
		}

		if (s.length() == 1)
		{
			if (wordSet.find(s) == wordSet.end())
				return false;
			else
				return true;
		}

		unordered_map<string, bool> mem;
		return isRestWordValid(s, wordDict, wordSet, mem);
	}
};

//Runtime: 20 ms, faster than 47.42 % of C++ online submissions for Word Break.
//Memory Usage : 15 MB, less than 18.23 % of C++ online submissions for Word Break.